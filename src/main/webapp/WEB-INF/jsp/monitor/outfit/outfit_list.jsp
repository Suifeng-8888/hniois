<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%--任务栏--%>
<div class="hniois-table">
    <form action="outfit/list" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <c:if test="${fn:contains(QX,'outfit/add')}">
                    <a id="hniois-add" onclick="toAdd('',1)" class="layui-btn layui-btn-sm layui-btn-outfital" href="javascript:;">
                        <i class="fa fa-plus fa-lg" aria-hidden="true"></i> 新增</a>
                </c:if>
                <c:if test="${fn:contains(QX,'outfit/delete')}">
                    <a id="hniois-deletes" onclick="doDeletes()" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                        <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i> 批量删除</a>
                </c:if>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="name" placeholder="搜索监管机构名称..." />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
            </div>
        </div>
    </form>
</div>

<%--查询表格--%>
<table class="layui-hide" id="table" lay-filter="lay_table">
</table>

<%--编辑--%>
<script type="text/html" id="editBar">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看</a>
    <c:if test="${fn:contains(QX,'outfit/update')}">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </c:if>
    <c:if test="${fn:contains(QX,'outfit/delete')}">
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    </c:if>
</script>
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
            url:'outfit/list',
            cols: [[
                {type:'checkbox'},
                // {field:'id', title:'ID', sort:true,width: 80,align:"center"},
                {field:'name', title:'监管机构名称',align:"center",width:200},
                {field:'number', title:'机构代码',align:"center"},
                {field:'grade', title:'机构级别',align:"center",templet:function(d){
                    var str=d.grade;
                    if (str=='1'){
                        str="乡/镇级";
                    }else if(str=="2"){
                        str="区/县级";
                    }else if(str=="3"){
                        str="市级";
                    }
                    return str;
                    }},
                {field:'p_city', title:'所属市',align:"center"},
                {field:'area', title:'所属区/县',align:"center"},
                {field:'site', title:'详细地址',align:"center",width:200},
                {field:'charge', title:'负责人姓名',align:"center"},
                {field:'phone', title:'负责人电话',align:"center"},
                {fixed: 'right', title: '操作', width: 180, align:'center', toolbar: '#editBar'}
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                toEdit(data.id,0)
            }  else if(layEvent === 'edit'){
                toEdit(data.id,1)
            }else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.id);
                });
            }
        });

        //监听搜索表单提交
        form.on('submit(search)', function(data) {
            //带条件查询
            data_table.reload({
                where: data.field
            });
            $('.hniois-search-mored').hide();
            return false;
        });
    });

    //执行重载 表单查询
    function formReload() {
        var param = getSearchData();
        data_table.reload({
            where: param
        });
    }

    //修改弹窗
    function toEdit(id,code){
        var layer = layui.layer
        layer.open({
            title : '编辑监管机构',
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "outfit/toEdit?id=" + id + "&code=" + code,
            area: ['650px', '80%']
        });
    }

    //修改弹窗
    function toAdd(id,code){
        var layer = layui.layer
        layer.open({
            title : '新增监管机构',
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "outfit/newAdd?id=" + id + "&code=" + code,
            area: ['650px', '80%']
        });
    }

    //单个删除
    function doDelete(id){
        $.ajax({
            url: 'outfit/delete',
            data: {
                id:id
            },
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
                formReload();
            }
        });
    }

    //批量删除
    function doDeletes(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择要删除的数据');
            return;
        }
        var data = d.data,
            ids = [];
        for(var i=0;i<data.length;i++){
            ids.push(data[i].id);
        }
        layui.layer.confirm('确认删除', function(index){
            console.log(ids.toString());
            $.ajax({
                url: 'outfit/deletes',
                data: {
                    data:ids.toString()
                },
                type: "post",
                dataType:'json',
                success: function(data){
                    layui.layer.msg(data.msg);
                    formReload();
                }
            });
        });
    }
</script>
</html>