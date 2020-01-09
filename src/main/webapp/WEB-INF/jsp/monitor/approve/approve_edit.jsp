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
        <input type="hidden" name="aid" id="key" value="${approve.aid}">
        <input type="hidden" name="p_id"  value="${approve.p_id}">
        <input type="hidden" name="farm_id"  value="${approve.farm_id}">
        <input type="hidden" name="outfit_id" value="${approve.outfit_id}">
        <input type="hidden" name="outfit_name"  value="${approve.outfit_name}">
        <label class="layui-form-label">产品名称:</label>
        <div class="layui-input-block">
            <input name="crop_name" class="layui-input" type="text" autocomplete="off" readonly="readonly"
                 lay-verify="required" value="${approve.crop_name}">
        </div>
        <label class="layui-form-label">检测报告<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="report_num" class="layui-input" type="text"  autocomplete="off" readonly="readonly"
                   lay-verify="required" value="${approve.report_num}">
        </div>
        <label class="layui-form-label">申请时间<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="apply_time" class="layui-input" type="text"  autocomplete="off" readonly="readonly"
                   lay-verify="required" value="${approve.apply_time}">
        </div>
        <label class="layui-form-label">审批结果<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <select name="p_state" id="pt" lay-search="" class="hniois-search-data">
                <option value="">请选择</option>
                <option value="1">通过</option>
                <option value="2">未通过</option>
            </select>
        </div>
        <label class="layui-form-label">审批意见<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <textarea name="contents" placeholder="请输入审批意见"  lay-verify="required"
                      autocomplete="off" class="layui-textarea"> ${approve.contents} </textarea>
        </div>
        <label class="layui-form-label">审批人<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="approver" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${approve.approver}">
        </div>
        <label class="layui-form-label">审批时间<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="approve_time" class="layui-input" type="text" autocomplete="off"
                   id="test1" placeholder="yyyy-MM-dd"   lay-verify="required" value="${approve.approve_time}">
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
        state();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            laydate=layui.laydate,
            form = layui.form;

        laydate.render({
            elem:"#test1",
        })
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "approve/" + ($("#key").val()==""?"add":"update");
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
        if("${approve.code}"=="1"){
            $("#form-button").show();
        }
    }
    //初始化审批结果
    function state(){
        $("#pt").val(${approve.p_state})
    }
</script>
</html>