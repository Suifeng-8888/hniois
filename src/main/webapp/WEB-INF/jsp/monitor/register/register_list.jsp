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
    <title>基地注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
<%--任务栏--%>
<div class="hniois-table">
    <form action="register/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <%--<c:if test="${fn:contains(QX,'register/export')}">
                    <a id="hniois-export" onclick="doExport('register/doExport')" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                        <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 导出</a>
                </c:if>--%>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="p_name" placeholder="生产基地名称.." />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <%--<div class="layui-form-item">
                    <label class="layui-form-label">所属区县</label>
                    <div class="layui-input-block">
                        <select name="p_area">
                            <option value="">请选择</option>
                            <option value="市直辖区">市直辖区</option>
                            <option value="卫东区" >卫东区</option>
                            <option value="石龙区">石龙区</option>
                            <option value="湛河区" >湛河区</option>
                            <option value="宝丰县">宝丰县</option>
                            <option value="叶县" >叶县</option>
                            <option value="鲁山县">鲁山县</option>
                            <option value="郏县" >郏县</option>
                            <option value="舞钢市">舞钢市</option>
                            <option value="汝州市">汝州市</option>
                            <option value="新华区">新华区</option>
                            <option value="高新区">高新区</option>
                            <option value="城乡示范区">城乡示范区</option>
                        </select>
                    </div>
                </div>--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属行业</label>
                        <div class="layui-input-block">
                            <input type="text" name="p_industry" autocomplete="off" class="layui-input hniois-search-data">
                        </div>
                    </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">组织形式</label>
                    <div class="layui-input-block">
                        <input type="text" name="p_form" autocomplete="off" class="layui-input hniois-search-data">
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
    <c:if test="${fn:contains(QX,'register/update')}">
    <a class="layui-btn layui-btn-xs" lay-event="update">初级审批</a>
    </c:if>
    <c:if test="${fn:contains(QX,'register/approve')}">
        <a class="layui-btn layui-btn-xs" lay-event="edit">二级审批</a>
    </c:if>
    <c:if test="${fn:contains(QX,'register/delete')}">
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
            url:'register/list.do',
            limits:[10],
            cols: [[
                {type:'checkbox'},
               // {field:'r_id', width:100, title: '注册ID'},
                {field:'p_name',  title: '企业名称', width:220, align:'center'},
                {field:'p_form', title: '组织形式', width:150, align:'center'},
                {field:'p_register', title: '营业执照代码', width:180, align:'center'},
                {field:'p_time', title: '营业期限',width:150, align:'center'},
                {field:'p_person', title: '基地法人', width:100, align:'center'},
                {field:'aly_time', title: '申请时间', width:150, align:'center'},
                {field:'state', title: '审批状态', width:150, align:'center',templet:function(d){
                        var str=d.state;
                        if (str=="0"){
                            str="<span style='color:blue'>待审核</span>";
                        }
                        if(str=="1"){
                            str="<span style='color:green'>初审通过</span>";
                        }
                        if(str=="2"){
                            str="<span style='color:red'>初审驳回</span>";
                        }
                        if(str=="3"){
                            str="<span style='color:green'>审批通过</span>";
                        }
                        if(str=="4"){
                            str="<span style='color:red'>复审驳回</span>";
                        }
                        return str;
                    }},
                {field:'p_qualifications', title: '资质图片', width:100, align:'center',templet:function(d){
                        //企业资质图片，默认显示第一张
                        var img="static/images/icon/school.png";
                        if(d.p_qualifications){
                            img = d.p_qualifications.split(",")[0];
                        }
                        var str = '<div class="layui-inline"  lay-event="imgs">\n' +
                            '  <img class="layui-nav-img user-imgs" src="'+img+'" class="layui-nav-img" style="background-color: black">\n' +
                            '</div>';
                        return str + "";
                    }},
                {field:'p_province',title: '省份', width:100, align:'center'},
                {field:'p_city',title: '所属市', width:100, align:'center'},
                {field:'p_area',title: '县/区', width:100, align:'center'},
                {field:'p_address',title: '详细地址', width:400, align:'center'},
                {field:'p_phone', title: '联系电话', width:150, align:'center'},
                // {field:'apo_reason', title: '驳回理由'},
                // {field:'p_longitude', title: '经度'},
                // {field:'p_latitude', title: '纬度'},
                {fixed: 'right',align:'center',width:180, toolbar: '#editBar'}
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                lookDetail(data.r_id,0)
            } else if(layEvent === 'update'){//初级审批
                toEdit(data.r_id,1)
            } else if(layEvent === 'edit'){
                twoEdit(data.r_id,1)
            }else if(layEvent === 'imgs'){
                toProvidersImgs(data.r_id)
            }else if(layEvent === 'del'){
                layer.confirm('确认删除么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.r_id);
                });
            }
        });

        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
            if("${fn:contains(QX,'register/update')}"=="true"){
                var field = obj.field , //得到字段
                    value = obj.value ,//得到修改后的值
                    data = obj.data ;//得到所在行所有键值
                var obj = new Object();
                obj.r_id = data.r_id;
                obj[field] = value;
                //修改数据
                doEdit(obj);
            }else {
                layer.msg("无修改权限")
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

    //初级审批
    function toEdit(id,code){
        var layer = layui.layer ;
        layer.open({
            title : "生产主体信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "register/toEdit.do?r_id="+id+"&code="+code,
            area: ['750px', '80%']
        });
    }

    //查看详情
    function lookDetail(id,code){
        var layer = layui.layer ;
        layer.open({
            title : "生产主体信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "register/check.do?r_id="+id+"&code="+code,
            area: ['750px', '80%']
        });
    }

    //二级审批
    function twoEdit(id,code){
        var layer = layui.layer ;
        layer.open({
            title : "生产主体信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "register/twoEdit.do?r_id="+id+"&code="+code,
            area: ['750px', '80%']
        });
    }

    //表格编辑 修改数据
    function doEdit(obj){
        $.ajax({
            url: "register/update.do",
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
            url: 'register/delete.do',
            data: {
                r_id:id
            },
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
            }
        });
    }


    //检验报告照片上传
    function toProvidersImgs(id){
        var layer = layui.layer ;
        layer.open({
            title : "企业资质上传",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "register/toEditImgs.do?r_id="+id,
            area: ['650px', '80%']
        });
    }

</script>
</html>