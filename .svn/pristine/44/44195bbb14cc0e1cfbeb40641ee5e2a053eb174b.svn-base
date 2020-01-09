<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>运输信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="trans_id" id="key" value="${trans.trans_id}">
    <input type="hidden" name="order_id"  value="${trans.order_id}">
    <div class="layui-form-item">
            <label class="layui-form-label">运输公司<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="company" class="layui-input" type="text"  lay-verify="required" autocomplete="off"
                       value="${trans.company}">
            </div>
            <label class="layui-form-label">车辆信息<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="plate_num" class="layui-input" type="text"  lay-verify="required" autocomplete="off"
                       value="${trans.plate_num}">
            </div>
            <label class="layui-form-label">车辆司机<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="driver" class="layui-input" type="text"  lay-verify="required" autocomplete="off"
                       value="${trans.driver}">
            </div>

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
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "trans/" + ($("#key").val()==""?"add":"update") + ".do";
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
        if("${trans.code}"=="0"){
            $("#form-button").show();
        }
    }
</script>
</html>