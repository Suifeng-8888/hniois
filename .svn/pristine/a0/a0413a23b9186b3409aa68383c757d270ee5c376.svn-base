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
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>

<div class="hniois-search-btns">
    <input type="hidden" id="p_id" value="${p_id}">
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
        var p_id = $("#p_id").val();
        data_table = table.render({
            elem: '#table',
            url:'goods/list?p_id=' + p_id,
            cols: [[
                {type:'checkbox'},
                {field:'name', title: '产品名称'},
                {field:'price', title: '产品价格'},
                {field:'unit', title: '产品规格'}
            ]],
            height: 'full-60', cellMinWidth: 60,page: true
        });

    });


    //给父页面传值
    function sendMsg(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择产品');
            return;
        }
        if (d.data.length > 1) {
            layui.layer.msg('只能选择一个产品');
            return;
        }
        var data = d.data,
            names = [],
            prices = [],
            units = [];

        for(var i=0;i<data.length;i++){
            names.push(data[i].name);
            prices.push(data[i].price);
            units.push(data[i].unit);
        }
        parent.$('#goods').val(names.toString());
        parent.$('#b_price').val(prices.toString());
        parent.$('#b_spec').val(units.toString());
        closeWin();
    }

    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</html>