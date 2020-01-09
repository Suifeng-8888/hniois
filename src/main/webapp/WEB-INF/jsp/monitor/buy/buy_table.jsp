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
    <title>农场表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>

<div class="hniois-search-btns">
    <a id="hniois-add" onclick="sendMsg()" class="layui-btn layui-btn-sm layui-btn-normal">确定</a>
    <a id="hniois-deletes" onclick="closeWin();" class="layui-btn layui-btn-sm layui-btn-danger">关闭</a>
</div>
<%--查询表格--%>
<table class="layui-hide" id="table" lay-filter="lay_table">

</table>

</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //初始化函数 order-1
    var data_table ;//数据表格
    $(document).ready(function() {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        data_table = table.render({
            elem: '#table',
            url:'provide/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'id', title: 'ID',width: 80},
                {field:'name', title: '供应商名称'},
                {field:'site', title: '供应商地址'},
                {field:'contact', title: '联系人',width: 100}
            ]],
            height: 'full-60', cellMinWidth: 60,page: true
        });

    });


    //给父页面传值
    function sendMsg(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择供应商');
            return;
        }
        if (d.data.length > 1) {
            layui.layer.msg('只能选择一个供应商');
            return;
        }
        var data = d.data,
            ids=[],
            names=[];

        for(var i=0;i<data.length;i++){
            names.push(data[i].name);
            ids.push(data[i].id);
        }
        parent.$('#test').val(names.toString());
        parent.$('#supplier').val(ids.toString());
        parent.$('#provide_id').val(ids.toString());
        /*parent.layer.tips('Look here', '#test', {time: 5000});*/
        closeWin();
    }

    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</html>