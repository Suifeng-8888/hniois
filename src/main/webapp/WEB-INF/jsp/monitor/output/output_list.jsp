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
    <form action="output/list" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <a id="hniois-add" onclick="toEdit('',1)" class="layui-btn layui-btn-sm layui-btn-outfital" href="javascript:;">
                    <i class="fa fa-plus fa-lg" aria-hidden="true"></i> 新增</a>
                <%--<a id="hniois-deletes" onclick="doDeletes()" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                    <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i> 批量删除</a>--%>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="crop_name" placeholder="产品名称.." />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <div class="layui-form-item">
                    <label class="layui-form-label">审批状态</label>
                        <div class="layui-input-block">
                            <select name="p_status" lay-search="" class="hniois-search-data">
                                <option value=""></option>
                                <option value="0">待审核</option>
                                <option value="1">通过</option>
                                <option value="2">未通过</option>
                            </select>
                        </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">审批机构</label>
                    <div class="layui-input-block">
                        <input type="text" name="outfit_name" autocomplete="off" class="layui-input hniois-search-data">
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
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>
<script type="text/html" id="editBar1">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="print">生成准出证</a>
</script>
<script type="text/html" id="editBar2">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="dels">删除</a>
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
            url:'output/list',
            cols: [[
                {type:'checkbox'},
                //{field:'p_id', title:'申请ID',align:"center",width:120},
                //{field:'crop_id', title:'产品ID',align:"center",width:120},
                //{field:'farm_id', title:'基地ID',align:"center",width:120},
                //{field:'outfit_id', title:'机构ID',align:"center",width:120},
                {field:'crop_name', title:'产品名称',align:"center"},
                {field:'report_num', title:'检测报告编号',align:"center"},
                {field:'outfit_name', title:'监管审核机构',align:"center"},
                {field:'applyer', title:'申请人',align:"center"},
                {field:'apply_time', title:'申请时间',align:"center"},
                {field:'p_status', title:'审批状态',align:"center",width:120,templet: function (d) {
                    var str = d.p_status;
                    if (str == "0") {
                      str="<span>待审核</span>";
                    } else if (str == "1") {
                        str="<span style='color: #00B83F'>通过</span>";
                    } else if (str == "2") {
                        str= "<span style='color: #CF1900'>未通过</span>";
                    }
                    return str;
                }},
                {fixed: 'right', title: '操作', width: 150, align:'left', templet: function (d) {
                        var str = d.p_status;
                        if (str == "0") {
                            str = $("#editBar").html();
                        } else if (str == "1") {
                            str = $("#editBar1").html();
                        } else if (str == "2") {
                            str = $("#editBar2").html();
                        }
                        return str;
                }}
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                toLook(data.p_id,data.outfit_id)
            }else if(layEvent === 'edit'){//暂时放弃,不保留编辑功能
                toEdit(data.p_id,1)
            }else if(layEvent === 'print'){
                toPrint(data.p_id,data.outfit_id);
            }else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.p_id,0);
                });
            }else if(layEvent === 'dels'){
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.p_id,1);
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

    //查看审批
    function toLook(pid,outid){
        var layer = layui.layer ;
        layer.open({
            title : "审批详情",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "approve/look?p_id=" + pid + "&outfit_id="+outid ,
            area: ['650px', '80%']
        });
    }

    //修改弹窗
    function toEdit(id,code){
        var layer = layui.layer ;
        layer.open({
            title : "准出申请",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "output/toEdit?p_id=" + id + "&code=" + code,
            area: ['650px', '80%']
        });
    }

    //生成准出信息
    function toPrint(id,code){
        var layer = layui.layer ;
        layer.open({
            title : "生成准出信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "outfile/add?p_id=" + id + "&outfit_id=" + code,
            area: ['650px', '80%']
        });
    }
    //单个删除
    function doDelete(id,num){
        $.ajax({
            url: 'output/delete',
            data: {
                p_id:id,
                msg:num,
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
            ids.push(data[i].p_id);
        }
        layui.layer.confirm('确认删除', function(index){
            console.log(ids.toString());
            $.ajax({
                url: 'output/deletes',
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