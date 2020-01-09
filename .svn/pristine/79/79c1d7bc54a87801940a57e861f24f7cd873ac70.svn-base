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
    <form action="recall/list" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <c:if test="${fn:contains(QX,'recall/add')}">
                    <a id="hniois-add" onclick="add()" class="layui-btn layui-btn-sm layui-btn-recallal" href="javascript:;">
                        <i class="fa fa-plus fa-lg" aria-hidden="true"></i> 新增</a>
                </c:if>
                <c:if test="${fn:contains(QX,'recall/export')}">
                    <a id="hniois-export" onclick="doExport('recall/doExport')" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                        <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 导出</a>
                </c:if>
                <c:if test="${fn:contains(QX,'recall/delete')}">
                    <a id="hniois-deletes" onclick="doDeletes()" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                        <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i> 批量删除</a>
                </c:if>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="name" placeholder="搜索召回产品名称..." />
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
    <c:if test="${fn:contains(QX,'recall/update')}">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </c:if>
    <c:if test="${fn:contains(QX,'recall/crop')}">
        <a class="layui-btn layui-btn-xs" lay-event="recal">召回</a>
    </c:if>
    <c:if test="${fn:contains(QX,'recall/delete')}">
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
            url:'recall/list',
            limits:[10],
            cols: [[
                {type:'checkbox'},
              //  {field:'r_id', title:'ID', sort:true, width: 60 },
              //  {field:'crop_id', title:'产品ID', sort:true, width: 60 },
              //  {field:'org_id', title:'发布机构ID', sort:true, width: 60 },
              //  {field:'farm_id', title:'生产基地ID', sort:true, width: 60 },
                {field:'org_name', title:'发布机构',align:"center"},
                {field:'farm_name', title:'所属基地',align:"center"},
               // {field:'rank', title:'机构等级',align:"center"},
                {field:'crop_name', title:'召回产品',align:"center"},
                {field:'time', title:'发布时间',align:"center"},
                {field:'cause', title:'召回原因',align:"center"},
                {field:'status', title:'召回状态',templet:function(d){
                    var str=d.status;
                    if(str=="待召回"){
                        str="<span style='color:red'>待召回</span>";
                    }else if(str=="召回中"){
                        str="<span style='color:green'>召回中</span>";
                    }else if(str="已召回"){
                        str="<span style='color:blue'>已召回</span>";
                    }
                    return str;
                    }},
                {field:'r_num', title:'召回数量'},
                {fixed: 'right',align:'left', width: 180, toolbar: '#editBar'}
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                toEdit(data.r_id,0)
            }  else if(layEvent === 'edit'){
                toEdit(data.r_id,1)
            }else if(layEvent === 'recal'){
                reCall(data.r_id,1)
            }else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.r_id);
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
    function add(){
        var layer = layui.layer ;
        layer.open({
            title : '新增召回',
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "recall/add.do" ,
            area: ['650px', '80%']
        });
    }
    //修改弹窗
    function toEdit(id,code){
        var layer = layui.layer ;
        layer.open({
            title : '召回信息',
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "recall/toEdit?r_id=" + id+"&code="+code ,
            area: ['650px', '80%']
        });
    }

    //产品召回
    function reCall(id,code){
        var layer = layui.layer ;
        layer.open({
            title : '召回产品',
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "recall/call.do?r_id=" + id+"&code="+code ,
            area: ['650px', '80%']
        });
    }

    //单个删除
    function doDelete(id){
        $.ajax({
            url: 'recall/delete',
            data: {
                r_id:id
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
            ids.push(data[i].r_id);
        }
        layui.layer.confirm('确认删除', function(index){
            console.log(ids.toString());
            $.ajax({
                url: 'recall/deletes',
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