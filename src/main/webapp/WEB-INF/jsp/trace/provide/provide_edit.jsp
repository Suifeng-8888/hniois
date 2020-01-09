<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, norm-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
    <style>
        /*.layui-form-label {*/
            /*width: 120px;*/
        /*}*/
        /*.layui-input-block {*/
            /*margin-left: 120px;*//**/
        /*}*/
    </style>
</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${provide.id}">
        <label class="layui-form-label">供应商名称:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="name" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${provide.name}">
        </div>
        <label class="layui-form-label">生产许可证号:</label>
        <div class="layui-input-block">
            <input name="licence" class="layui-input" type="text" autocomplete="off" value="${provide.licence}">
        </div>
        <label class="layui-form-label">营业执照代码:</label>
        <div class="layui-input-block">
            <input name="organization" class="layui-input" type="text" autocomplete="off" value="${provide.organization}">
        </div>
        <label class="layui-form-label">地址:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="site" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${provide.site}">
        </div>
        <label class="layui-form-label">电话:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="phone" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${provide.phone}">
        </div>
        <label class="layui-form-label">邮箱:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="email" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${provide.email}" />
        </div>
        <label class="layui-form-label">联系人:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="contact" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${provide.contact}" />
        </div>
        <%--<div class="layui-form-item">--%>
            <%--<label class="layui-form-label">是否公开:</label>--%>
            <%--<div class="layui-input-block">--%>
                <%--<input type="radio" name="publicity" value="1" title="是" <c:if test="${provide.publicity == 1}">checked</c:if>>--%>
                <%--<input type="radio" name="publicity" value="2" title="否"<c:if test="${provide.publicity == 2}">checked</c:if>>--%>
            <%--</div>--%>
        <%--</div>--%>
    <div class="layui-form-item" style="text-align: center; margin-top: 30px;" >
        <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>

</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
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
            var url = "provide/" + ($("#key").val()==""?"add":"update") + ".do";
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

    });

    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${provide.code}"=="1"){
            $("#form-button").show();
        }
    }
</script>
</html>