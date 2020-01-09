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
    <title>订单运输信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
<%--任务栏--%>
<div >
    <%--<div class="hniois-table-head" >--%>
    <form  method="post" class="layui-form hniois-search-form" id="hniois-search-form">
            <div > &nbsp&nbsp&nbsp&nbsp&nbsp订单运输信息&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <a  onclick="closeWin();" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                    返回</a>
            </div>

            <table class="layui-table">
                <tr><td>订单编号:</td><td><input type="text" class="layui-input layui-table-edit" value="${order.order_num}"></td><td>订单产品:</td><td><input type="text" class="layui-input layui-table-edit" value="${order.crop}"></td></tr>
                <tr><td>发货时间:</td><td><input type="text" class="layui-input layui-table-edit" value="${order.send_time}"></td><td>收货地址:</td><td><input type="text" class="layui-input layui-table-edit" value="${order.end_address}"></td></tr>
            </table>
    </form>
   <%-- </div>--%>
    <div class="hniois-search-inputs" style="display: none">
        <div class="hniois-search-keyword">
            <input type="hidden" class="hniois-search-data"  name="page_id" id="ids">
        </div>
    </div>
</div>
<div class="layui-row">
        <div class="hniois-search-inputs">
            <a id="hniois-add" onclick="toEdit('','${order.order_id}')" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
                <i class="fa fa-plus fa-lg" aria-hidden="true"></i> 新增</a>
        </div>
        <%--查询表格--%>
        <table class="layui-hide" id="table" lay-filter="lay_table">

        </table>
</div>
<%--编辑--%>
<script type="text/html" id="editBar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>
</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script type="text/javascript" src="static/zTree/js/jquery.ztree.core.js"></script>
<script>
    //初始化函数 order-1
    var data_table ;//数据表格
    $(document).ready(function() {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        data_table = table.render({
            elem: '#table',
            limits:[10],
            url:'trans/list.do?order_id=${order.order_id}',
            cols: [[
              //  {field:'trans_id',  title:'运输ID'},
                {field:'company',  title:'运输公司'},
                {field:'plate_num', title: '车辆信息',edit:'text'},
                {field:'driver',  title: '司机',edit:'text'},
                {fixed: 'right',title:'操作', width: 150, align:'center', toolbar: '#editBar'}
            ]],
            height: 'full-250', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'edit'){
                toEdit(data.trans_id,"${order.order_id}")
            }else if(layEvent === 'del'){
                layer.confirm('确认删除么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.trans_id);
                });
            }
        });

        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
                var field = obj.field , //得到字段
                    value = obj.value ,//得到修改后的值
                    data = obj.data ;//得到所在行所有键值
                var obj = new Object();
                obj.trans_id = data.trans_id;
                obj[field] = value;
                //修改数据
                doEdit(obj);
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
        var layer = layui.layer ;
        layer.open({
            title : "订单运输信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "trans/toEdit.do?trans_id="+id+"&order_id="+code,
            area: ['650px', '80%']
        });
    }

    //表格编辑 修改数据
    function doEdit(obj){
        $.ajax({
            url: "trans/update.do",
            data: obj,
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
            }
        });
    }

    //单个删除
    function doDelete(id){
        $.ajax({
            url: 'trans/delete.do',
            data: {
                trans_id:id
            },
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
            }
        });

    }

    //关闭页面
    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>

</html>