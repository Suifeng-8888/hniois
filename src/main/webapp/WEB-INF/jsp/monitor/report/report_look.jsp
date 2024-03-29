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
    <title>检验报告</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="rid" id="key" value="${report.rid}">
    <input type="hidden" name="crop_id" id="cId" value="${report.crop_id}">
    <input type="hidden" name="farm_id" value="${report.farm_id}">
    <input type="hidden" name="report_img"  value="${report.report_img}">
    <div class="layui-form-item">
            <label class="layui-form-label">报告编号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="report_num" class="layui-input" type="text"  lay-verify="required" autocomplete="off"
                   id="rpt"    value="${report.report_num}">
            </div>
            <label class="layui-form-label">报告名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="report_name" class="layui-input" type="text"  lay-verify="required" autocomplete="off"
                       value="${report.report_name}">
            </div>
            <label class="layui-form-label">检测产品<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block" >
                <input name="crop" type="text" autocomplete="off" class="layui-input"
                    id="cp"   placeholder="请选择" lay-verify="required"  value="${report.crop}">
            </div>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检测机构<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="office" class="layui-input" lay-verify="required" type="text" autocomplete="off"
                   value="${report.office}">
        </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检测时间<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="ck_time" autocomplete="off" lay-verify="required"
                   id="test1" placeholder="yyyy-MM-dd"  class="layui-input" value="${report.ck_time}">
        </div>
        <%--</div>--%>
            <label class="layui-form-label">检测结果<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <select name="result" id="sta" lay-verify="required" lay-search="">
                    <option value="">请选择</option>
                    <option value="0">合格</option>
                    <option value="1">不合格</option>
                </select>
            </div>
        <div id="demo2">

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
<script src="static/js/jQuery/jquery.imgbox.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
        initSta();
        showImg();
        //图片放大
        showBigPic();
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
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "report/" + ($("#key").val()==""?"add":"update") + ".do";
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
        if("${report.code}"=="1"){
            $("#form-button").show();
        }
    }
    //初始化报告结果
    function initSta(){
        $("#sta").val(${report.result});
    }

    function showImg(){
        var imgs="${report.report_img}";
        var arr=imgs.split(",");
       for(var i=0;i<arr.length-1;i++){
           $('#demo2').append('<a class="big" href="'+arr[i]+'">'+'<img src="'+ arr[i] +'"  style="width: 150px;height: 150px" class="layui-upload-img">'+ '</a>')
       }
    }

    //图片放大
    function showBigPic(){
        $("a.big").imgbox({"slideshow": false});
    }

</script>
</html>