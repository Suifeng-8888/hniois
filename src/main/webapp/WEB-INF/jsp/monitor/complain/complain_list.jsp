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
    <form action="complain/list" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <c:if test="${fn:contains(QX,'complain/export')}">
                    <a id="hniois-export" onclick="doExport('complain/doExport')" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                        <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 导出</a>
                </c:if>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <select name="status">
                        <option value="" selected>处理结果</option>
                        <option value="待回复">待回复</option>
                        <option value="已关注">已关注</option>
                        <option value="已解决">已解决</option>
                    </select>
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <div class="layui-form-item">
                    <label class="layui-form-label">客户名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="put_name" autocomplete="off" placeholder="反馈人" class="layui-input hniois-search-data">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="crop_name" placeholder="所反馈产品"  class="layui-input" id="test1" placeholder="yyyy-MM-dd"
                               autocomplete="off"   >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">所属公司</label>
                    <div class="layui-input-block">
                        <input type="text" name="farm_name" autocomplete="off" class="layui-input hniois-search-data">
                    </div>
                </div>
            </div>
            <div class="hniois-search-footer">
                <button type="reset" class="layui-btn layui-btn-sm layui-btn-primary hniois-btn">重置</button>
                <button class="layui-btn layui-btn-sm hniois-btn" lay-submit lay-filter="search" >确定</button>
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
    <c:if test="${fn:contains(QX,'complain/reply')}">
        <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="reply">回复</a>
    </c:if>
    <c:if test="${fn:contains(QX,'complain/delete')}">
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
            url:'complain/list',
            limits:[10],
            cols: [[
                {type:'checkbox'},
                // {field:'id', title:'ID', sort:true,width: 60},
                // {field:'farm_id', title:'基地ID', sort:true,width: 60},
                {field:'p_type', title:'反馈类型',width: 150,align:"center",templet:function(d){
                        var str=d.p_type;
                        if(str=="投诉"){
                            str="<span style='color:red'>投诉</span>";
                        }else if(str=="建议"){
                            str="<span style='color:green'>建议</span>";
                        }
                        return str;
                    }},
                {field:'farm_name', title:'所属公司',align:"center",width: 200},
                {field:'put_name', title:'客户名称',align:"center",width: 100},
               // {field:'put_phone', title:'联系电话',align:"center"},
                {field:'crop_name', title:'反馈产品',align:"center",width: 150},

               // {field:'put_theme', title:'标题',align:"center",width: 220},
                {field:'put_content', title:'反馈内容',align:"center",width: 220},
                 {field:'put_time', title:'反馈时间',align:"center",width: 150},
                {field:'reply_way', title:'回复方式',align:"center",width: 100},
                {field:'status', title:'处理结果',width: 150,align:"center"},
                {field:'reply_content', title:'结果详情',align:"center",width:320},
                {fixed: 'right', width: 200, align:'center', toolbar: '#editBar'}
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                detail(data.id,0);
            }else if(layEvent === 'reply'){
                detail(data.id,1);
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

        //更多筛选
        $('#hniois-search-more').on('click', function() {
            $('.hniois-search-mored').toggle();
        });
    });

    //执行重载 表单查询
    function formReload() {
        var param = getSearchData();
        data_table.reload({
            where: param
        });
    }

    function detail(id,code){
        var layer = layui.layer ;
        layer.open({
            title : "反馈详情",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "complain/toEdit.do?id=" + id+"&code="+code,
            area: ['650px', '80%']
        });
    }

    //单个删除
    function doDelete(id){
        $.ajax({
            url: 'complain/delete',
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
    function doDeletes() {
        var d = layui.table.checkStatus('table');
        var data = d.data;
        if (data.length === 0) {
            layui.layer.msg('请选择要删除的数据');
            return;
        }
        var ids = [];
        for(var i=0;i<data.length;i++){
            ids.push(data[i].id);
        }
        layui.layer.confirm('确认删除', function(index){
            console.log(ids.toString());
            $.ajax({
                url: 'complain/deletes',
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