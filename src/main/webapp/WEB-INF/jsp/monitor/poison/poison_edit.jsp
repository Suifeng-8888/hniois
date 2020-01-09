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
    <title>产品准出证</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="pid" id="key" value="${poison.pid}">
    <input type="hidden" name="buy_id" id="bId" value="${poison.buy_id}">
    <input type="hidden" name="crop_id" id="cId" value="${poison.crop_id}">
    <input type="hidden" name="farm_id" value="${poison.farm_id}">
    <input type="hidden" name="p_img" value="${poison.p_img}">
    <div class="layui-form-item">
            <label class="layui-form-label">打药作物<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block" >
                <input name="crop" type="text" autocomplete="off" style="width:400px;height:35px;"
                       id="cp" placeholder="请选择" lay-verify="required"  value="${poison.crop}">
                <span data-method="notice"  class="layui-btn  layui-btn-normal chose">请选择作物</span>
            </div>
            <label class="layui-form-label">农药名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block" >
                <input name="pname" type="text" autocomplete="off" style="width:400px;height:35px;"
                       id="test"   placeholder="请选择" lay-verify="required"  value="${poison.pname}">
                <span data-method="note"  class="layui-btn  layui-btn-normal chose">请选择农药</span>
            </div>

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">打药时间</label>
            <div class="layui-input-block">
                <input type="text" name="p_time" autocomplete="off"
                     id="test1" placeholder="yyyy-MM-dd"  class="layui-input" value="${poison.p_time}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">打药负责人</label>
            <div class="layui-input-block">
                <input name="person" class="layui-input" type="text" autocomplete="off"
                       value="${poison.person}">
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
            var url = "poison/" + ($("#key").val()==""?"add":"update") + ".do";
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
                    title: "作物名称",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "poison/crop.do",
                    area: ['500px', '80%'],
                });
                layer.full(index2);
            },
            note:function(){
                var index1 = layer.open({
                    title: "农药名称",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "poison/buy.do",
                    area: ['500px', '80%'],
                });
                layer.full(index1);
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
        if("${poison.code}"=="1"){
            $("#form-button").show();
        }
    }

</script>
</html>