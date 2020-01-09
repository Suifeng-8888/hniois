<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, norm-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="id" id="key" value="${outfit.id}">
        <label class="layui-form-label">监管机构名称:</label>
        <div class="layui-input-block">
            <input name="name" class="layui-input" type="text" autocomplete="off" value="${outfit.name}">
        </div>
        <label class="layui-form-label">监管机构代码:</label>
        <div class="layui-input-block">
            <input name="number" class="layui-input" type="text" autocomplete="off" value="${outfit.number}">
        </div>
        <label class="layui-form-label">监管机构级别:</label>
        <div class="layui-input-block">
            <select name="grade" id="tp" lay-verify="required"  autocomplete="off"  lay-search="">
                <option value="3">市级</option>
                <option value="2" selected="selected">区/县级</option>
                <option value="1">乡/镇级</option>
            </select>
        </div>
        <label class="layui-form-label">所属区域:</label>
        <div class="layui-input-block">
            <div class="layui-input-inline">
                <select name="p_city" id="cty">
                    <option value="">请选择市</option>
                    <option value="平顶山市" selected="">平顶山市</option>
                </select>
            </div>
            <div class="layui-input-inline" >
                <select name="area"  id="ops" >
                </select>
            </div>
        </div>
        <label class="layui-form-label">详细地址:</label>
        <div class="layui-input-block">
            <input name="site" class="layui-input" type="text" autocomplete="off" value="${outfit.site}">
        </div>
        <label class="layui-form-label">负责人:</label>
        <div class="layui-input-block">
            <input name="charge" class="layui-input" type="text" autocomplete="off" value="${outfit.charge}" />
        </div>
        <label class="layui-form-label">联系电话:</label>
        <div class="layui-input-block">
            <input name="phone" class="layui-input" type="text" autocomplete="off" value="${outfit.phone}" />
        </div>
        <div class="layui-form-item" style="text-align: center; margin-top: 30px;" >
            <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
            <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
        </div>
    </form>
</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
        initSta()
        choseArea("${outfit.area}");
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "outfit/" + ($("#key").val()==""?"add":"update");
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
    });

    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${outfit.code}"=="1"){
            $("#form-button").show();
        }
    }

    function initSta(){
        <%--alert("${outfit.grade}")--%>
        $("#tp").val("${outfit.grade}");
    }
    //根据市获取所属区
    function choseArea(val){
        var str='<option value="市直辖区">市直辖区</option>';
        var c_name=$("#cty").val();//获取市名称
        $.ajax({
            url:"province/area.do",
            data:{
                city_name:c_name,
            },
            dataType:'json',
            type: "post",
            success:function(d){
                for(var i=0;i<d.length;i++){
                    str+='<option value="'+d[i].county_name+'">'+d[i].county_name+'</option>';
                }
                $("#ops").html(str);
                if(val){
                    $("#ops").val(val);
                    layui.form.render('select');
                }else{
                    layui.form.render('select');
                }

            }
        })

    }
</script>
</html>