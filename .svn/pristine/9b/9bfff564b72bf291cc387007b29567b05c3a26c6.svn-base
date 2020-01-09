<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>扶贫企业信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="p_id" id="key" value="${providers.p_id}">
        <div class="layui-form-item">

            <label class="layui-form-label">扶贫企全称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="full_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${providers.full_name}">
            </div>

            <label class="layui-form-label">企业简称</label>
            <div class="layui-input-block">
                <input name="short_name" class="layui-input" type="text" autocomplete="off"
                        value="${providers.short_name}">
            </div>

            <label class="layui-form-label">企业类型</label>
            <div class="layui-input-block">
                <select name="p_type">
                    <option value=""></option>
                    <option value="特色林果" selected = "selected" >特色林果</option>
                    <option value="林下种植" >林下种植</option>
                    <option value="花卉苗木" >花卉苗木</option>
                    <option value="其它" >其它</option>
                </select>
            </div>

            <label class="layui-form-label">参与方式</label>
            <div class="layui-input-block">
                <select name="p_join">
                    <option value=""></option>
                    <option value="务工" selected = "selected" >务工</option>
                    <option value="种植" >种植</option>
                    <option value="入股" >入股</option>
                    <option value="其它" >其它</option>
                </select>
            </div>

            <label class="layui-form-label">详细地址</label>
            <div class="layui-input-block">
                <input name="p_location" class="layui-input" type="text" autocomplete="off"
                        value="${providers.p_location}">
            </div>

            <label class="layui-form-label">占地面积</label>
            <div class="layui-input-block">
                <input name="p_area" class="layui-input" type="text" autocomplete="off"
                       value="${providers.p_area}">
            </div>

            <label class="layui-form-label">邮政编码</label>
            <div class="layui-input-block">
                <input name="p_coding" class="layui-input" type="text" autocomplete="off"
                        value="${providers.p_coding}">
            </div>

            <label class="layui-form-label">省份</label>
            <div class="layui-input-block">
                <select name="p_province" id="p_province"  lay-search="" lay-filter="p_province_select" >
                    <%--<option value="">请选择</option>--%>
                    <%--<c:forEach items="${clist}" var="province">--%>
                        <%--<option value="${province.province_id}" >${province.province_name}</option>--%>
                    <%--</c:forEach>--%>
                </select>
            </div>


            <label class="layui-form-label">市</label>
            <div class="layui-input-block">
                <select name="p_city" id="p_city"  lay-search="" lay-filter="p_city_select" >

                </select>
            </div>

            <label class="layui-form-label">区县</label>
            <div class="layui-input-block">
                <select name="p_county" id="p_county"  lay-search="" lay-filter="p_county_select" >

                </select>
            </div>

            <label class="layui-form-label">乡镇</label>
            <div class="layui-input-block">
                <%--lay-filter="p_towns_select"--%>
                <select name="p_towns" id="p_towns"  lay-search="" >

                </select>
            </div>

                <label class="layui-form-label">企业负责人</label>
                <div class="layui-input-block">
                    <input name="p_person" class="layui-input" type="text" autocomplete="off"
                           value="${providers.p_person}">
                </div>

                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-block">
                    <input name="p_phone" class="layui-input" type="text" autocomplete="off"
                           value="${providers.p_phone}">
                </div>

                <label class="layui-form-label">企业介绍</label>
                <div class="layui-input-block">
                    <input name="p_profile" class="layui-input" type="text" autocomplete="off"
                           value="${providers.p_profile}">
                </div>

            <label class="layui-form-label">企业标识码</label>
            <div class="layui-input-block">
                <input name="p_identifiers" class="layui-input" type="text" autocomplete="off"
                        value="${providers.p_identifiers}">
            </div>

            <label class="layui-form-label">经度</label>
            <div class="layui-input-block">
                <input name="p_longitude" class="layui-input" type="text" autocomplete="off"
                       value="${providers.p_longitude}">
            </div>

            <label class="layui-form-label">纬度</label>
            <div class="layui-input-block">
                <input name="p_latitude" class="layui-input" type="text" autocomplete="off"
                       value="${providers.p_latitude}">
            </div>
            <label class="layui-form-label">企业审核</label>
            <div class="layui-input-block">
                <input name="p_verify" class="layui-input" disabled="disabled" type="text" autocomplete="off"
                       value="${providers.p_verify}">
            </div>

            <label class="layui-form-label">扶贫简介</label>
            <div class="layui-input-block">
                <textarea name="p_aptitude" placeholder="请输入内容" class="layui-textarea" >${providers.p_aptitude}</textarea>
            </div>

        </div>

        <div class="layui-form-item" style="text-align: center;"  >
            <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
            <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
        </div>
    </form>

</div>
</body>

<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);

    //layui模块加载 order-2
    layui.use(['layer', 'form', 'layedit'], function() {
        var layer = layui.layer,
            form = layui.form,
            layedit = layui.layedit;

        var edit = layedit.build('p_aptitude'); //建立编辑器

    });

    //初始化函数 order-1
    $(document).ready(function() {
        init();
        initProvinceSelect({},"${providers.p_province}");

        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "providers/" + ($("#key").val()==""?"add":"update") + ".do";
            $.ajax({
                url: url,
                data: data.field,
                type: "post",
                dataType:'json',
                success: function(data){
                    if(data.state=="ok"){
                        parent.formReload();
                        parent.layer.msg(data.msg);
                        closeWin();
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        });

        form.on('select(p_province_select)', function(data){
            clrF4Select("province");
            var obj = {
                show:2,
                province_name:data.value
            };
            initCitySelect(obj);
        });

        form.on('select(p_city_select)', function(data){
            clrF4Select("city");
            var obj = {
                show:3,
                city_name:data.value
            };
            initCountySelect(obj);
        });

        form.on('select(p_county_select)', function(data){
            var obj = {
                show:4,
                county_name:data.value
            };
            initTownsSelect(obj);
        });
    });

    //关闭窗口
    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${providers.code}"=="1"){
            $("#form-button").show();
        }
    }

    /**
     * 初始化省份
     * @param obj 查询参数
     * @param val 初始化数值
     * */
    function initProvinceSelect(obj,val){
        $.ajax({
            url: 'providers/findCity.do',
            data: {
                show : 1
            },
            type: "post",
            dataType:'json',
            success: function(data){
                var options = "<option value=''></option>";
                for(var i=0;i<data.length;i++){
                    options+= "<option value='"+data[i].province_name+"'>"+data[i].province_name+"</option>";
                }
                $("#p_province").html(options);
                if(val){
                    $("#p_province").val(val);
                    layui.form.render('select');
                    //加载市区
                    var param = {
                        show : 2,
                        province_name : val
                    };
                    initCitySelect(param,"${providers.p_city}");
                }else{
                    layui.form.render('select');
                }
            }
        });
    }
    /**
     * 初始化市区
     * @param obj 查询参数
     * @param val 初始化数值
     * */
    function initCitySelect(obj,val){
        $.ajax({
            url: 'providers/findCity.do',
            data: obj,
            type: "post",
            dataType:'json',
            success: function(data){
                var options = "<option value=''></option>";
                for(var i=0;i<data.length;i++){
                    options+= "<option value='"+data[i].city_name+"'>"+data[i].city_name+"</option>";
                }
                $("#p_city").html(options);
                if(val){
                    $("#p_city").val(val);
                    layui.form.render('select');

                    //加载县区
                    var param = {
                        show:3,
                        city_name: val
                    };
                    initCountySelect(param,"${providers.p_county}");
                }else{
                    layui.form.render('select');
                }
            }
        });
    }
    /**
     * 初始化县区
     * @param obj 查询参数
     * @param val 初始化数值
     * */
    function initCountySelect(obj,val){
        $.ajax({
            url: 'providers/findCity.do',
            data: obj,
            type: "post",
            dataType:'json',
            success: function(data){
                var options = "<option value=''></option>";
                for(var i=0;i<data.length;i++){
                    options+= "<option value='"+data[i].county_name+"'>"+data[i].county_name+"</option>";
                }
                $("#p_county").html(options);
                if(val){
                    $("#p_county").val(val);
                    layui.form.render('select');

                    //加载县区
                    var param = {
                        show:4,
                        county_name: val
                    };
                    initTownsSelect(param,"${providers.p_towns}");
                }else{
                    layui.form.render('select');
                }
            }
        });
    }
    /**
     * 初始化乡镇
     * @param obj 查询参数
     * @param val 初始化数值
     * */
    function initTownsSelect(obj,val){
        $.ajax({
            url: 'providers/findCity.do',
            data: obj,
            type: "post",
            dataType:'json',
            success: function(data){
                var options = "<option value=''></option>";
                for(var i=0;i<data.length;i++){
                    options+= "<option value='"+data[i].town_name+"'>"+data[i].town_name+"</option>";
                }
                $("#p_towns").html(options);
                if(val){
                    $("#p_towns").val(val);
                    layui.form.render('select');

                }else{
                    layui.form.render('select');
                }
            }
        });
    }

    /**
     * 初始化省市县区下拉
     * @param  param 初始化
     * */
    function clrF4Select(param) {
        //省-select
        if(param=="province"){
            // 默认清空
            $("#p_county").html("");
            $("#p_towns").html("");
        }
        //-select
        else if(param=="city"){
            $("#p_towns").html("");
        }
    }
</script>
</html>