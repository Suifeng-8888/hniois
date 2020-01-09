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
        <input type="hidden" name="r_id" id="key" value="${recall.r_id}">
        <input type="hidden" name="farm_id" id="fid" value="${recall.farm_id}">
        <input type="hidden" name="org_id" id="oId" value="${recall.org_id}">
        <input type="hidden" name="crop_id" id="cId" value="${recall.crop_id}">
        <input type="hidden" name="rank" value="${recall.rank}">
        <input type="hidden" name="status" value="${recall.status}">
        <label class="layui-form-label">发布机构:</label>
        <div class="layui-input-block">
            <input class="layui-input"  name="org_name" value="${recall.org_name}" type="text" lay-verify="required">
        </div>
        <label class="layui-form-label">所属基地:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input id="fn" name="farm_name" style="height:36px;width:400px" type="text" autocomplete="off" readonly="readonly"
                   lay-verify="required" value="${recall.farm_name}">
            <span class="layui-btn-normal layui-btn chose" data-method="choose">选择基地</span>
        </div>
            <label class="layui-form-label">召回品名:<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input id="cp" name="crop_name" style="height:36px;width:400px" type="text" autocomplete="off" readonly="readonly"
                       lay-verify="required" value="${recall.crop_name}">
                <span class="layui-btn-normal layui-btn chose" data-method="notice">选择产品</span>
            </div>
        <label class="layui-form-label">召回原因:</label>
        <div class="layui-input-block">
            <textarea name="cause" class="layui-textarea" placeholder="请输入召回原因" lay-verify="required">${recall.cause}</textarea>
        </div>

        <label class="layui-form-label">发布时间:</label>
        <div class="layui-input-block">
            <input class="layui-input" id="time" name="time" autocomplete="off" placeholder="yyyy-MM-dd"
                   value="${recall.time}" type="text" lay-verify="required">
        </div>

        <div class="layui-form-item" style="text-align: center; margin-top: 30px;" >
            <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" >保存</button>
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

    });

    //layui模块加载 order-2
    layui.use(['layer', 'form', 'laydate'], function() {
        var layer = layui.layer,
            form = layui.form,
            laydate = layui.laydate;

        laydate.render({
            elem: '#time'
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "recall/save.do";
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

            choose:function () {
                var index = layer.open({
                    title: "选择基地",
                    type: 2,
                    offset: 't',
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "recall/farm.do",
                    area: ['500px', '80%'],
                });
                layer.full(index);
            },
            notice:function () {
                var f_id=$("#fid").val();
                if(f_id==""){
                    layui.layer.msg("请先选择基地");
                    return;
                }
                var index2 = layer.open({
                    title: "选择产品",
                    type: 2,
                    offset: 't',
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "recall/crop.do?farm_id="+f_id,
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



</script>
</html>