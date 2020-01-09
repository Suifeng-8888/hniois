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
    <title>新增or编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${soil.id}">
    <input type="hidden" name="farm_id"  value="${soil.farm_id}">
    <input type="hidden" name="crop_id" id="cid" value="${soil.crop_id}">
    <div class="layui-form-item">
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">土地编号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="s_number" class="layui-input" type="text" autocomplete="off"
                      lay-verify="required" value="${soil.s_number}">
            </div>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">土地面积</label>
            <div class="layui-input-block">
                <input name="area" class="layui-input" type="text" autocomplete="off"
                    id="code"   lay-verify="required" value="${soil.area}">
            </div>
        <label class="layui-form-label">所种作物</label>
        <div class="layui-input-block">
            <input name="crop" style="width:400px;height:35px;" type="text" autocomplete="off"
               id="cp"     value="${soil.crop}">
            <span data-method="notice"  class="layui-btn  layui-btn-normal chose">请选择作物</span>
        </div>
        <%--</div>--%>


    </div>
    <div class="layui-form-item" style="text-align: center;display: none" id="form-button" >
        <button class="layui-btn" lay-filter="formSave" lay-submit>保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>

</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "soil/" + ($("#key").val()==""?"add":"update") + ".do";
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
        var active={
            notice:function(){
                var index2=layer.open({
                    title: "作物列表",
                    type: 2,
                    offset: 't',
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "soil/choose.do",
                    area: ['500px', '80%'],
                });
                layer.full(index2);
            }
        }

        $('.chose').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });

    //关闭弹框
    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${soil.code}"=="1"){
            $("#form-button").show();
        }
    }
</script>
</html>