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
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="id" id="key" value="${article.id}">
        <input type="hidden" name="org_id"  value="${article.org_id}">
        <label class="layui-form-label">发布机构:</label>
        <div class="layui-input-block">
            <input name="org_name" class="layui-input" type="text" autocomplete="off" value="${article.org_name}">
        </div>
        <label class="layui-form-label">信息类型:</label>
        <div class="layui-input-block">
            <select name="type">
                <option selected></option>
                <option value="新闻" <c:if test="${article.type eq '新闻'}">selected</c:if>>新闻</option>
                <option value="公告" <c:if test="${article.type eq '公告'}">selected</c:if>>公告</option>
                <option value="资讯" <c:if test="${article.type eq '资讯'}">selected</c:if>>资讯</option>
            </select>
        </div>
        <label class="layui-form-label">文章标题:</label>
        <div class="layui-input-block">
            <input name="title" class="layui-input" type="text" autocomplete="off" value="${article.title}">
        </div>
        <label class="layui-form-label">文章副标题:</label>
        <div class="layui-input-block">
            <input name="subtitle" class="layui-input" type="text" autocomplete="off" value="${article.subtitle}">
        </div>
        <label class="layui-form-label">文章内容:</label>
        <div class="layui-input-block">
            <textarea name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
            <%--<textarea id="content" name="content">--%>
                <%--${article.content}--%>
            <%--</textarea>--%>
        </div>

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
    layui.use(['layer', 'form', 'layedit'], function() {
        var layer = layui.layer,
            form = layui.form,
            layedit = layui.layedit;

        layedit.set({
            uploadImage: {
                url: 'file/upload', //接口url
                type: 'post' //默认post
            }
        });

        // var edit = layedit.build('content'); //建立编辑器

        //监听提交
        form.on('submit(formSave)', function(data){
            $.ajax({
                url: "article/" + ($("#key").val()==""?"add":"update"),
                data: data.field,
                type: "post",
                dataType:'json',
                success: function(rest){
                    if(rest.state=="ok"){
                        parent.formReload();
                        parent.layer.msg(rest.msg);
                        closeWin();
                    }else{
                        layer.msg(rest.msg);
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
        if("${article.code}"=="1"){
            $("#form-button").show();
        }
    }
</script>
</html>