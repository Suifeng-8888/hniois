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
        <input type="hidden" name="p_id" id="key" value="${output.p_id}">
        <input type="hidden" name="farm_id"  value="${output.farm_id}">
        <input type="hidden" name="p_status"  value="${output.p_status}">
        <input type="hidden" name="crop_id" id="cId" value="${output.crop_id}">
        <input type="hidden" name="outfit_id" id="outId" value="${output.outfit_id}">
        <label class="layui-form-label">产品名称:</label>
        <div class="layui-input-block">
            <input name="crop_name" style="height:36px;width:350px" type="text" autocomplete="off"
               id="cp"    lay-verify="required" value="${output.crop_name}">
            <span data-method="notice"  class="layui-btn layui-btn-normal chose">选择产品</span>
        </div>
        <label class="layui-form-label">检测报告<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="report_num" style="height:36px;width:350px" type="text" id="rpt" autocomplete="off"
                   lay-verify="required" value="${output.report_num}">
            <span data-method="report"  class="layui-btn layui-btn-normal chose">选择报告</span>
        </div>
        <label class="layui-form-label">监管机构<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="outfit_name" style="height:36px;width:350px" type="text" id="app" autocomplete="off"
                   lay-verify="required" value="${output.outfit_name}">
            <span data-method="approve"  class="layui-btn layui-btn-normal chose">选择监管</span>
        </div>
        <label class="layui-form-label">申请人<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="applyer" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${output.applyer}">
        </div>
        <label class="layui-form-label">申请时间<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="apply_time" class="layui-input" type="text" autocomplete="off"
                   id="test1" placeholder="yyyy-MM-dd"   lay-verify="required" value="${output.apply_time}">
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
            var url = "output/" + ($("#key").val()==""?"add":"update");
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
        //触发事件  供应商选择
        var active={
            notice:function(){
                layer.open({
                    title: "基地产品",
                    type: 2,
                    offset: "20px",
                    maxmin: true,
                    moveType: 1,
                    content: "output/toCrops.do",
                    area: ['650px', '80%']
                })
            },
            report:function(){
                var cid=$("#cId").val();
                layer.open({
                    title: "检测报告",
                    type: 2,
                    offset: "20px",
                    maxmin: true,
                    moveType: 1,
                    content: "output/toReports.do?crop_id="+cid,
                    area: ['650px', '80%']
                })
            },
            approve:function(){
                layer.open({
                    title: "准出证审批机构",
                    type: 2,
                    offset: "20px",
                    maxmin: true,
                    moveType: 1,
                    content: "output/toApprove.do",
                    area: ['650px', '80%']
                })
            },
        };
        $(".chose").on('click',function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });

    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${output.code}"=="1"){
            $("#form-button").show();
        }
    }
</script>
</html>