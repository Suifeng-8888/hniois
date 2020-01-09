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
    <title>采摘管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="hid" id="key" value="${hart.hid}">
    <input type="hidden" name="farm_id"  value="${hart.farm_id}">
    <input type="hidden" name="crop_id" id="cId" value="${hart.crop_id}">
    <input type="hidden" name="batch" value="${hart.batch}">
    <input type="hidden" name="h_img" value="${hart.h_img}">
    <div class="layui-form-item">
            <label class="layui-form-label">采摘作物<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block" id="check">
                <input name="crop" type="text" autocomplete="off" style="width:400px;height:35px;"
                       id="cp" placeholder="请选择" lay-verify="required"  value="${hart.crop}">
                <span data-method="notice"  class="layui-btn  layui-btn-normal chose">请选择作物</span>
            </div>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">采摘时间</label>
            <div class="layui-input-block">
                <input type="text" name="h_time" autocomplete="off"
                     id="test1" placeholder="yyyy-MM-dd"  class="layui-input" value="${hart.h_time}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">采摘人</label>
            <div class="layui-input-block">
                <input name="person" class="layui-input" type="text" autocomplete="off"
                       value="${hart.person}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">是否出货<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <select name="state" id="sta" lay-verify="required" lay-search="">
                        <option selected="selected" value="0">待出货</option>
                        <option value="1">已出货</option>
                        <option value="2">废弃</option>
                </select>
            </div>
        <%--</div>--%>
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
        initSta();
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
            var url = "pick/" + ($("#key").val()==""?"add":"update") + ".do";
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

        //触发事件
        var active = {

            notice:function () {
                var index2 = layer.open({
                    title: "作物列表",
                    type: 2,
                    offset: 't',
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "pick/choose.do",
                    area: ['500px', '80%'],
                });
                layer.full(index2);
            }
        }

        $('.chose').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });

    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${hart.code}"=="1"){
            $("#form-button").show();
        }
    }

    function initSta(){
        $("#sta").val(${hart.state});
    }

</script>
</html>