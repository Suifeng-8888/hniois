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
    <title>产地准出证</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="fid" id="key" value="${outfile.fid}">
    <input type="hidden" name="farm_id" value="${outfile.farm_id}">
    <input type="hidden" name="crop_img" value="${outfile.crop_img}">
    <div class="layui-form-item">

        <label class="layui-form-label">发证机构<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <input name="government" class="layui-input" type="text" autocomplete="off"
                   value="${outfile.government}">
        </div>
        <label class="layui-form-label">经办人<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <input name="approver" class="layui-input" type="text" autocomplete="off"
                   value="${outfile.approver}">
        </div>
        <label class="layui-form-label">发证日期</label>
        <div class="layui-input-block">
            <input type="text" name="out_time" autocomplete="off"
                   id="test1" placeholder="yyyy-MM-dd"  class="layui-input" value="${outfile.out_time}">
        </div>
        <label class="layui-form-label">生产单位<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <input name="company" class="layui-input" type="text" autocomplete="off"
                   value="${outfile.company}">
        </div>
        <label class="layui-form-label">地址<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <input name="address" class="layui-input" type="text" autocomplete="off"
                   value="${outfile.address}">
        </div>
        <label class="layui-form-label">联系电话<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <input name="phone" class="layui-input" type="text" autocomplete="off"
                   value="${outfile.phone}">
        </div>
        <label class="layui-form-label">检测编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <input name="report_num" class="layui-input" type="text" autocomplete="off"
                   value="${outfile.report_num}">
        </div>
        <label class="layui-form-label">产品名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <input name="pro_name" class="layui-input" type="text" autocomplete="off"
                   value="${outfile.pro_name}">
        </div>
        <label class="layui-form-label">产品数量<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <input name="pro_num" class="layui-input" type="text" autocomplete="off"
                   value="${outfile.pro_num}">
        </div>
        <label class="layui-form-label">产品规格</label>
        <div class="layui-input-block">
            <input name="pro_unit" class="layui-input" type="text" autocomplete="off"
                   value="${outfile.pro_unit}">
        </div>
        <label class="layui-form-label">打印日期</label>
        <div class="layui-input-block">
            <input type="text" name="print_time" autocomplete="off"
                   id="test2" placeholder="yyyy-MM-dd"  class="layui-input" value="${outfile.print_time}">
        </div>

    </div>
    <div class="layui-form-item" style="text-align: center;display: none" id="form-button" >
        <button class="layui-btn" lay-filter="formSave" lay-submit>保存</button>
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
    });


    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            laydate=layui.laydate,
            form = layui.form;

        //日历
        laydate.render({
            elem:'#test1'
        });
        //日历
        laydate.render({
            elem:'#test2'
        });
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "outfile/" + ($("#key").val()==""?"save":"update") + ".do";
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
        if("${outfile.code}"=="1"){
            $("#form-button").show();
        }
    }

</script>
</html>