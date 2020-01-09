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
    <title>家畜详情登记</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="breed_id"  value="${breedData.breed_id}">
    <input type="hidden" name="detail_id"  id="key" value="${breedData.detail_id}">
    <input type="hidden" name="farm_id" value="${breedData.farm_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">家畜编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <input name="detail_id" type="text" autocomplete="off" class="layui-input"
                   lay-verify="required"  value="${breedData.detail_id}">
        </div>

        <label class="layui-form-label">家畜性别<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <select name="detail_sex" id="sex" lay-verify="required" lay-search="">
                <option value="">请选择</option>
                <option value="公畜">公畜</option>
                <option value="母畜" >母畜</option>
            </select>
        </div>
        <label class="layui-form-label">生长情况<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <select name="grow_suit" id="way" lay-verify="required" lay-search="">
                <option value="">请选择</option>
                <option value="肥壮">肥壮</option>
                <option value="正常">正常</option>
                <option value="偏瘦">偏瘦</option>
            </select>
        </div>


    </div>
    <div class="layui-form-item" style="text-align: center;" id="form-button" >
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
        initSta();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "breedData/" + ($("#key").val()==""?"add":"update") + ".do";
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

    function initSta(){
        $("#sex").val("${breedData.detail_sex}");
        $("#way").val("${breedData.grow_suit}");
    }

</script>
</html>