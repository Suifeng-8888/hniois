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
    <title>基地产品表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
<%--任务栏--%>
<div class="hniois-table">
    <form action="crop/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <c:if test="${fn:contains(QX,'crop/add')}">
                    <a id="hniois-add" onclick="toEdit('',1)" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
                        <i class="fa fa-plus fa-lg" aria-hidden="true"></i> 新增</a>
                </c:if>
                <c:if test="${fn:contains(QX,'crop/delete')}">
                    <a id="hniois-deletes" onclick="doDeletes()" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                        <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i> 批量删除</a>
                </c:if>
                <a id="hniois-export" onclick="doExport('crop/doExport')" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                    <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 导出</a>
                <%--<a id="send" onclick="sendCheck()" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                    <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 送检</a>--%>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="crop_name" placeholder="作物名称.." />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <div class="layui-form-item">
                    <label class="layui-form-label">所属分类</label>
                    <div class="layui-input-block">
                        <select name="ctype"   lay-search="">
                            <option value="">请选择</option>
                            <option value="蔬菜">蔬菜</option>
                            <option value="水果">水果</option>
                            <option value="食用菌">食用菌</option>
                            <option value="谷物类">谷物类</option>
                            <option value="其他">其他</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">三品一标分类</label>
                    <div class="layui-input-block">
                        <select name="crop_type" id="sta"  lay-search="">
                            <option value="">请选择</option>
                            <option value="无公害农产品">无公害农产品</option>
                            <option value="绿色食品">绿色食品</option>
                            <option value="有机农产品">有机农产品</option>
                            <option value="农产品地理标志">农产品地理标志</option>
                            <option value="普通农产品">普通农产品</option>
                        </select>
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
    <c:if test="${fn:contains(QX,'crop/update')}">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </c:if>
    <c:if test="${fn:contains(QX,'crop/delete')}">
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
            url:'crop/list.do',
            limits:[10],
            cols: [[
                {type:'checkbox'},
               // {field:'crop_id', title: '产品ID',align:'center'},
               // {field:'farm_id', title: '农场编号',align:'center'},
                {field:'crop_name',  title: '产品名称',edit:'text',align:'center'},
                {field:'ctype',  title: '所属分类',edit:'text',align:'center'},
                {field:'crop_mark',  title: '产品标识',edit:'text',align:'center'},
                {field:'crop_type',  title: '三品一标',edit:'text',align:'center'},
                {field:'type_img',  title: '产品证书',width:100,templet:function(d){
                        //打药多张图片，默认显示第一张
                        var img="static/images/icon/school.png";
                        if(d.type_img){
                            img = d.type_img.split(",")[0];
                        }
                        var str = '<div class="layui-inline"  lay-event="tImgs">\n' +
                            '  <img class="layui-nav-img user-imgs" src="'+img+'" class="layui-nav-img" style="background-color: black">\n' +
                            '</div>';
                        return str + "";
                    }},
                {field:'crop_desc',  title: '产品描述',edit:'text',align:'center', width: 450},
                {field:'crop_img',  title: '产品图片',width:100,templet:function(d){
                        //打药多张图片，默认显示第一张
                        var img="static/images/icon/school.png";
                        if(d.crop_img){
                            img = d.crop_img.split(",")[0];
                        }
                        var str = '<div class="layui-inline"  lay-event="imgs">\n' +
                            '  <img class="layui-nav-img user-imgs" src="'+img+'" class="layui-nav-img" style="background-color: black">\n' +
                            '</div>';
                        return str + "";
                    }},
                {fixed: 'right', width: 165, align:'center', toolbar: '#editBar'}
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });


        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                toEdit(data.crop_id,0)
            }  else if(layEvent === 'edit'){
                toEdit(data.crop_id,1)
            } else if(layEvent === 'imgs'){
                toChangeCropImgs(data.crop_id)
            } else if(layEvent === 'tImgs'){
                toChangeTypeImgs(data.crop_id)
            }else if(layEvent === 'del'){
                layer.confirm('确认删除么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.crop_id);
                });
            }
        });

        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
            var field = obj.field , //得到字段
                value = obj.value ,//得到修改后的值
                data = obj.data ;//得到所在行所有键值
            var obj = new Object();
            obj.crop_id = data.crop_id;
            obj[field] = value;
            //修改数据
            doEdit(obj);
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

        //初始化角色下拉
        //initRoleSelect();
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
            title : "采摘管理",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "crop/toEdit.do?crop_id="+id+"&code="+code,
            area: ['750px', '80%']
        });
    }

    //表格编辑 修改数据
    function doEdit(obj){
        $.ajax({
            url: "crop/update.do",
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
            url: 'crop/delete.do',
            data: {
                crop_id:id
            },
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
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
            ids.push(data[i].crop_id);
        }
        layui.layer.confirm('确认删除', function(index){
            $.ajax({
                url: 'crop/deletes.do',
                data: {
                    data:ids.toString()
                },
                type: "post",
                dataType:'json',
                success: function(data){
                    layui.layer.close(index);
                    layui.layer.msg(data.msg);
                    formReload();
                }
            });
        });
    }

    //产品图片上传
    function toChangeCropImgs(id){
        var layer = layui.layer ;
        layer.open({
            title : "产品图片",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "crop/toEditImgs.do?crop_id="+id,
            area: ['650px', '80%']
        });
    }

    //资质证书上传
    function toChangeTypeImgs(id){
        var layer = layui.layer ;
        layer.open({
            title : "资质证书",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "crop/toTypeImgs.do?crop_id="+id,
            area: ['650px', '80%']
        });
    }

</script>
</html>