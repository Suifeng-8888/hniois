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
    <title>养殖管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="breed_id"  id="key" value="${breed.breed_id}">
    <input type="hidden"  name="b_batch" value="${breed.b_batch}">
    <input type="hidden"  name="b_nums" value="${breed.b_nums}">
    <input type="hidden" name="farm_id" id="farm_id" value="${breed.farm_id}">
    <input type="hidden" name="breed_img" value="${breed.breed_img}">
    <div class="layui-form-item">
        <label class="layui-form-label">家畜名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" id="check">
            <input name="breed_name" type="text" autocomplete="off" class="layui-input"
                   lay-verify="required"  value="${breed.breed_name}">
            <%--<span data-method="notice"  class="layui-btn  layui-btn-normal chose">选择家畜</span>--%>
        </div>
        <%--<label class="layui-form-label">批次数量</label>
        <div class="layui-input-block">
            <input name="b_nums" class="layui-input" type="text" autocomplete="off"
                   value="${breed.b_nums}">
        </div>--%>
        <label class="layui-form-label">养殖方法<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <select name="breed_ways" id="way" lay-verify="required" lay-search="">
                <option value="0">散养</option>
                <option value="1" selected="selected">圈养</option>
            </select>
        </div>
        <label class="layui-form-label">所用饲料<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="feed_name" type="text" autocomplete="off" class="layui-input"
                     lay-verify="required"  value="${breed.feed_name}">
            <%--<span data-method="note"  class="layui-btn  layui-btn-normal chose">选择饲料</span>--%>
        </div>
            <label class="layui-form-label">入栏时间</label>
            <div class="layui-input-block">
                <input type="text" name="begin_time" autocomplete="off" lay-verify="required"
                     id="test1" placeholder="yyyy-MM-dd"  class="layui-input" value="${breed.begin_time}">
            </div>

        <label class="layui-form-label">出栏时间</label>
        <div class="layui-input-block">
            <input type="text" name="end_time" autocomplete="off"
                   id="test2" placeholder="yyyy-MM-dd"  class="layui-input" value="${breed.end_time}">
        </div>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">养殖人</label>
            <div class="layui-input-block">
                <input name="breeder" class="layui-input" type="text" autocomplete="off"
                       value="${breed.breeder}">
            </div>
        <%--</div>--%>
            <label class="layui-form-label">检验情况<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <select name="test" id="sta" lay-verify="required" lay-search="">
                        <option value="0">合 格</option>
                        <option value="1">不合格</option>
                        <option selected="selected" value="2">待检测</option>
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
        initWay();
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
            var url = "breed/" + ($("#key").val()==""?"add":"update") + ".do";
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
                    title: "家畜列表",
                    type: 2,
                    offset: 't',
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "breed/choose.do",
                    area: ['500px', '80%'],
                });
                layer.full(index2);
            },
            note:function(){
                var index2 = layer.open({
                    title: "饲料列表",
                    type: 2,
                    offset: 't',
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "breed/chose.do",
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
        if("${breed.code}"=="1"){
            $("#form-button").show();
        }
    }


    function initSta(){
        $("#sta").val(${breed.test});
    }
    function initWay(){
        $("#way").val(${breed.breed_ways});
    }

</script>
</html>