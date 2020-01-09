<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>播种信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="s_id" id="key" value="${seed.s_id}">
        <input name="crop_id"  type="hidden" id="cId" value="${seed.crop_id}">
        <input name="buy_id" type="hidden"  id="buy" value="${seed.buy_id}">
        <input name="s_img" type="hidden" value="${seed.s_img}">
        <input name="s_descr" type="hidden" value="${seed.s_descr}">
        <input name="farm_id" type="hidden" value="${seed.farm_id}">
        <div class="layui-form-item">
            <label class="layui-form-label">作物名称</label>
            <div class="layui-input-block">
                <input name="crop" type="text" autocomplete="off" style="width:400px;height:35px;"
                       id="cp" placeholder="请选择" lay-verify="required"  value="${seed.crop}">
                <span data-method="note"  class="layui-btn  layui-btn-normal chose">请选择作物</span>
            </div>
            <label class="layui-form-label">所用种子</label>
            <div class="layui-input-block">
                <input name="s_name" type="text" autocomplete="off" style="width:400px;height:35px;"
                       id="test" placeholder="请选择" lay-verify="required"  value="${seed.s_name}">
                <span data-method="notice"  class="layui-btn  layui-btn-normal chose">请选择种子</span>
            </div>
            <label class="layui-form-label">播种时间<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="s_time" class="layui-input" type="text" autocomplete="off"
                       id="test1" placeholder="yyyy-MM-dd"   lay-verify="required" value="${seed.s_time}">
            </div>
            <label class="layui-form-label">播种方式</label>
            <div class="layui-input-block">
                <select name="tool">
                    <option value="">请选择</option>
                    <option value="0" selected = "selected">机器</option>
                    <option value="1">人工</option>
                </select>
            </div>

            <label class="layui-form-label">播种负责人</label>
            <div class="layui-input-block">
                <input name="people" class="layui-input" type="text" autocomplete="off"
                        value="${seed.people}">
            </div>

            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input name="bz" class="layui-input" type="text" autocomplete="off"
                        value="${seed.bz}">
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center;"  >
            <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
            <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
        </div>
    </form>

</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            laydate=layui.laydate,
            form = layui.form;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "seed/" + ($("#key").val()==""?"add":"update") + ".do";
            $.ajax({
                url: url,
                data: data.field,
                type: "post",
                dataType:'json',
                success: function(data){
                    if(data.state=="ok"){
                        parent.formReload();
                        parent.layer.msg(data.msg);
                        closeWin();
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        });
//触发事件
        var active = {
            notice:function () {
                var index2 = layer.open({
                    title: "种子名称",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "seed/buy.do",
                    area: ['500px', '80%']
                });
                layer.full(index2);
            },
            note:function(){
                var index1 = layer.open({
                    title: "选择作物",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "seed/crop.do",
                    area: ['500px', '80%']
                });
                layer.full(index1);
            }

        };
        $('.chose').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });

    //关闭窗口
    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${seed.code}"=="1"){
            $("#form-button").show();
        }
    }
</script>
</html>