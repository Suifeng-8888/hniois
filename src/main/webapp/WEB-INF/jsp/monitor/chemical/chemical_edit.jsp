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
    <title>施肥信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="id" id="key" value="${chemical.id}">
        <input type="hidden" name="crop_id" id="cId" value="${chemical.crop_id}">
        <input type="hidden" name="buy_id" id="bId" value="${chemical.buy_id}">
        <input type="hidden" name="farm_id" value="${chemical.farm_id}">
        <input type="hidden" name="c_img"  value="${chemical.c_img}">
        <div class="layui-form-item">
            <label class="layui-form-label">施肥对象<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="crop" type="text" autocomplete="off" style="width:400px;height:35px;"
                       id="cp" placeholder="请选择" lay-verify="required"  value="${chemical.crop}">
                <span data-method="notice"  class="layui-btn  layui-btn-normal chose">请选择农作物</span>
            </div>
            <label class="layui-form-label">化肥名称</label>
            <div class="layui-input-block">
                <input name="cname" type="text" autocomplete="off" style="width:400px;height:35px;"
                       id="cl" placeholder="请选择" lay-verify="required"  value="${chemical.cname}">
                <span data-method="notice2"  class="layui-btn  layui-btn-normal chose">请选择化肥</span>
            </div>
            <label class="layui-form-label">施肥时间<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="c_time" class="layui-input" type="text" autocomplete="off"
                       id="test1" placeholder="yyyy-MM-dd" lay-verify="required" value="${chemical.c_time}">
            </div>
            <label class="layui-form-label">施肥方法</label>
            <div class="layui-input-block">
                <select name="method" id="way">
                    <option >请选择</option>
                    <option value="0" >机器</option>
                    <option value="1">人工</option>
                </select>
            </div>
            <label class="layui-form-label">施肥负责人<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="person" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${chemical.person}">
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
        initState();
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
            var url = "chemical/" + ($("#key").val()==""?"add":"update") + ".do";
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
                var index3 = layer.open({
                    title: "农作物列表",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "chemical/crop.do",
                    area: ['500px', '80%']
                });
                layer.full(index3);
            },
            notice2:function () {
                var index2 = layer.open({
                    title: "化肥名称",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "chemical/buy.do",
                    area: ['500px', '80%']
                });
                layer.full(index2);
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
        if("${chemical.code}"=="1"){
            $("#form-button").show();
        }
    }
    function initState(){
        $("#way").val(${chemical.method})
    }

</script>
</html>