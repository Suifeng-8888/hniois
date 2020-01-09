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
    <title>二维码信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="code_id" id="key" value="${QRcode.code_id}">
    <input type="hidden" name="q_code"  value="${QRcode.q_code}">
    <input type="hidden" name="c_nums"  value="${QRcode.c_nums}">
    <input type="hidden" name="rule_code"  value="${QRcode.rule_code}">
    <input type="hidden" name="c_random"  value="${QRcode.c_random}">
    <input type="hidden" name="source_code" id="scode" value="${QRcode.source_code}">
    <input type="hidden" name="crop_id"  id="cId" value="${QRcode.crop_id}">
    <input type="hidden" name="farm_id"  value="${QRcode.farm_id}">
    <input type="hidden" name="farm_name"  value="${QRcode.farm_name}">
    <div class="layui-form-item">

        <label class="layui-form-label">关联产品<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="crop" style="height:36px;width:400px;" type="text" autocomplete="off"
                   id="cp"  lay-verify="required" value="${QRcode.crop}">
            <span data-method="notice"  class="layui-btn chose layui-btn-normal">选择产品</span>
        </div>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">开始条码<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="begin" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${QRcode.begin}">
            </div>
       <%-- </div>--%>
            <label class="layui-form-label">结束条码<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="end" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${QRcode.end}">
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
<script src="static/hniois/hniois.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {

    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','upload'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "qCode/" + ($("#key").val()==""?"add":"update") + ".do";
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
        var active={
            //选择产品
            notice:function(){
                layer.open({
                    title: "选择关联产品",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "qCode/choose.do",
                    area: ['600px', '80%'],
                })
            }
        }
        $(".chose").on('click',function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        })
    });


    //关闭弹框
    function closeWin(){
       parent.layer.close(index);
    }


</script>
</html>