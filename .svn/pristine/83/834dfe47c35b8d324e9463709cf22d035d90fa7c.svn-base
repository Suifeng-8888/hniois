<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>采购信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
    <input type="hidden" id="supplier" value="0">
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="id" id="key" value="${Buy.id}">
        <input type="hidden" name="total_cost"  value="${Buy.total_cost}">
        <input type="hidden" name="provide_id" id="provide_id" value="${Buy.provide_id}">
        <div class="layui-form-item">
            <label class="layui-form-label">供应商<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="b_provider" style="height:36px;width:350px" type="text" id="test" autocomplete="off" readonly="readonly"
                       lay-verify="required" value="${Buy.b_provider}">
                <span data-method="notice" id="chose"  class="layui-btn layui-btn-normal">请选择供应商</span>
            </div>
            <label class="layui-form-label">物品名<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="b_name" style="height:36px;width:350px" type="text" id="goods" autocomplete="off" readonly="readonly"
                       lay-verify="required" value="${Buy.b_name}">
                <span data-method="product" id="product"  class="layui-btn layui-btn-normal">请选择产品</span>
            </div>
            <label class="layui-form-label">采购数量<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="b_number" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${Buy.b_number}">
            </div>
            <label class="layui-form-label">物品规格</label>
            <div class="layui-input-block">
                <input name="b_spec" id="b_spec" class="layui-input" type="text" autocomplete="off" value="${Buy.b_spec}">
            </div>
            <label class="layui-form-label">采购类别</label>
            <div class="layui-input-block">
                <select name="b_category" id="st">
                    <option value="">请选择</option>
                    <option value="1" >化肥</option>
                    <option value="2" >种子</option>
                    <option value="3" >农药</option>
                    <option value="4" >其他</option>
                </select>
            </div>
            <label class="layui-form-label">采购时间<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="b_time" class="layui-input" type="text" autocomplete="off" id="test1" placeholder="yyyy-MM-dd"   lay-verify="required" value="${Buy.b_time}">
            </div>
            <label class="layui-form-label">采购人<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="b_buyer" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${Buy.b_buyer}">
            </div>
            <label class="layui-form-label">采购单价</label>
            <div class="layui-input-block">
                <input name="b_price" id="b_price" class="layui-input" type="text" autocomplete="off" value="${Buy.b_price}">
            </div>
            <%--<label class="layui-form-label">总花费</label>
            <div class="layui-input-block">
                <input name="total_cost" class="layui-input" type="text" autocomplete="off" value="${Buy.total_cost}">
            </div>--%>
        </div>
        <div class="layui-form-item" style="text-align: center;margin-top: 50px;"  >
            <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
            <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
        </div>
    </form>

</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
        Sname();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            laydate=layui.laydate,
            form = layui.form;
        //获取时间日历
        laydate.render({
            elem: '#test1'
        });
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "buy/" + ($("#key").val()==""?"add":"update") + ".do";
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
                    title: "供应商信息",
                    type: 2,
                    offset: "20px",
                    maxmin: true,
                    moveType: 1,
                    content: ["buy/toTable.do", "no"],
                    area: ['650px', '80%']
                })
            }
        };
        $("#chose").on('click',function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        //触发事件  供应商产品选择
        var goods = {
        product:function(){
            debugger;
            var p_id = $("#supplier").val();
            layer.open({
                    title: "供应产品信息",
                    type: 2,
                    offset: "20px",
                    maxmin: true,
                    moveType: 1,
                    content: ["buy/toGoods?p_id=" + p_id, "no"],
                    area: ['650px', '80%']
                })
            }
        };
        $("#product").on('click',function(){
            var othis = $(this), method = othis.data('method');
            goods[method] ? goods[method].call(this, othis) : '';
        });
    });

    //关闭窗口
    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${Buy.code}"=="1"){
            $("#form-button").show();
        }
    }
    function Sname(){
        $("#st").val(${Buy.b_category});
    }

</script>
</html>