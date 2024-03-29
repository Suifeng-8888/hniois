<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>用户管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
    <style>
        /**treeselect*/
        .layui-form-select .layui-tree {
            display: none;
            position: absolute;
            left: 0;
            top: 42px;
            padding: 5px 0;
            z-index: 999;
            min-width: 100%;
            border: 1px solid #d2d2d2;
            max-height: 300px;
            overflow-y: auto;
            background-color: #fff;
            border-radius: 2px;
            box-shadow: 0 2px 4px rgba(0,0,0,.12);
            box-sizing: border-box;
        }
        .layui-form-selected .layui-tree {
            display: block;
        }
    </style>
</head>
<body>
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${user.id}">
    <input type="hidden" name="dept_id" id="dId" value="${user.dept_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">帐号ID<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="user_id" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${user.user_id}">
        </div>
    <%--</div>--%>
        <label class="layui-form-label">账号类型</label>
        <div class="layui-input-block" >
            <select name="bz" id="bz" lay-verify="required" lay-search="" disabled="disabled">
                <option value="">请选择</option>
                <option value="OUTFIT_ADMIN">监管机构</option>
                <option value="PROVIDER_ADMIN">生产基地</option>
            </select>
        </div>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">用户名<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="username" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${user.username}">
        </div>
    <%--</div>--%>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">组织机构</label>
        <div class="layui-input-block" >
            <input name="dept_name" class="layui-input" type="text" autocomplete="off"
                   id="dept_select"    lay-verify="required" value="${user.dept_name}" disabled="disabled">
           <%-- <span data-method="notice"  class="layui-btn layui-btn-normal chose" >请选择名称</span>--%>
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">用户角色</label>
        <div class="layui-input-block">
            <select name="role_id" id="role_id" lay-verify="required" lay-search="" disabled="disabled">
                <option value="">请选择</option>
                <c:forEach items="${rlist}" var="role">
                    <option value="${role.role_id}">${role.role_name}</option>
                </c:forEach>
            </select>
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input name="phone" class="layui-input" type="text" autocomplete="off"
                   value="${user.phone}">
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input name="email" class="layui-input" type="text" autocomplete="off"
                   value="${user.email}">
        </div>
    <%--</div>--%>


    </div>
    <div class="layui-form-item" style="text-align: center;"  >
        <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>

</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
        initRole();
        initProviders();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "user/" + ($("#key").val()==""?"add":"update") + ".do";
            $.ajax({
                url: url,
                data: data.field,
                type: "post",
                dataType:'json',
                success: function(data){
                    if(data.state=="ok"){
                        layer.msg(data.msg);
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
                var typ=$("#bz").val();
                if(typ===""){
                    layui.layer.msg('请选择账号类型');
                    return false;
                }
                layer.open({
                    title: "组织机构名称",
                    type: 2,
                    offset: "20px",
                    maxmin: true,
                    moveType: 1,
                    content: "user/Organization.do?bz="+typ,
                    area: ['650px', '80%']
                })
            }

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
        if("${user.code}"=="1"){
            $("#form-button").show();
        }
    }

    //初始化角色下拉框
    function initRole(){
        $("#role_id").val("${user.role_id}");
        $("#bz").val("${user.bz}");
    }

    //初始化组织机构名称
    function initProviders(){
        $("#dept_select").val("${user.dept_name}");
    }

</script>
</html>