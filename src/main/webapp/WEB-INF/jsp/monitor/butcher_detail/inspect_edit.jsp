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
    <title>防疫疫苗</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden"  id="key" value="${inspect.inspcet_id}">
    <input type="hidden" name="but_id"  value="${inspect.but_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">检疫编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="inspcet_id" class="layui-input" type="text"  lay-verify="required" autocomplete="off"
                   value="${inspect.inspcet_id}">
        </div>
            <label class="layui-form-label">检疫名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="inspect_name" class="layui-input" type="text"  lay-verify="required" autocomplete="off"
                       value="${inspect.inspect_name}">
            </div>
            <label class="layui-form-label">检疫时间<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="inspect_time" autocomplete="off" lay-verify="required"
                       id="test1" placeholder="yyyy-MM-dd"  class="layui-input" value="${inspect.inspect_time}">
            </div>
        <label class="layui-form-label">检疫员<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="inspecter" class="layui-input" type="text"  lay-verify="required" autocomplete="off"
                   value="${inspect.inspecter}">
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
            laydate=layui.laydate,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "inspect/" + ($("#key").val()==""?"add":"update") + ".do";
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

        laydate.render({
            elem:'#test1'
        })

    });

    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${inspect.code}"=="0"){
            $("#form-button").show();
        }
    }

</script>
</html>