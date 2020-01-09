<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%--解析时间的标签--%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<style>
    *{
        margin: 0 auto;
        padding: 0;
    }
    .left{
        background-color: #00B83F;
        width:100px;
        height:110px;
    }
    .left span{
        height: 30px;
        line-height: 30px;
    }
    .right{
        width:100px;
        height:100px;
    }
    .itm{
        width:240px;
        height:140px;
        margin:5px 10px;
    }
    span{
        display: block;
        text-align: center;
        height:40px;
        line-height: 40px;
    }
    .font{
        font-size:12px;
        text-align: center;
    }
    .search{
        margin-bottom: 100px;
        margin-top: 30px;
    }
    .title{
        text-align: center;
        margin:0 10px;
    }

</style>
<body>
<%--条件筛选--%>
<div class="head layui-col-sm12">

    <div class="layui-btn layui-btn-success" onclick="doPrint()">打印二维码</div>
</div>

<%--展示每页二维码排版--%>
<div class="search layui-col-md12" id="search_show">
    <%--每一个要打印的二维码图片--%>
    <c:forEach items="${list}" var="nTemp">
        <ul class="itm layui-col-md2">
            <li class="title">${nTemp.name}</li>
            <li class="bd">
                <ul class="font layui-col-md5">
                    <li>${nTemp.tel}</li>
                    <li>${nTemp.mark}</li>
                </ul>
                <ul class="layui-col-md7">
                    <img src="${nTemp.img}" style="width:80px;height:80px;">
                </ul>
            </li>
            <li class="layui-col-md12">
                <ul class="layui-col-md8 font"><li>${nTemp.website}</li></ul>
                <ul class="layui-col-md4 font"><li>${nTemp.random}</li></ul>
            </li>
        </ul>
    </c:forEach>
</div>
<div id="demo1" class="pg"></div>


<div class="layui-row" id="item_html" style="display: none;" >
        <div class="layui-col-md2 grid-demo item">
            <div class="layui-col-md12">
                <div class="grid-demo title">${temp.name}</div>
            </div>
            <div class="layui-col-md6">
                <div class="grid-demo grid-demo-bg1">
                    <span class="font">${temp.tel}</span>
                    <span name="mark" class="font"></span>
                </div>
            </div>
            <div class="layui-col-md6">
                <div class="grid-demo grid-demo-bg2">
                    <img name="the_img" src="" style="width:80px;height:80px;"  alt="二维码">
                </div>
            </div>
            <div class="layui-col-md12">
                <div class="layui-col-md6 font">${temp.address}</div>
                <div class="glayui-col-md4 font">${temp.random}</div>
            </div>
        </div>

</div>
</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    $(document).ready(function(){
        layui.use(['laypage', 'layer'], function() {
            var laypage = layui.laypage
                , layer = layui.layer;

            //总页数低于页码总数
            laypage.render({
                elem: 'demo1'
                ,page: true //开启分页
                ,count: "${count}" //
                ,jump: function(obj, first){
                    if(!first){
                        console.log(obj)
                    }
                }
            });

        });
    });


    //打印页面内容
    function doPrint() {
        var oldHtml = window.document.body.innerHTML;
        $(".head").hide();
        window.document.body.innerHTML = $("#search_show").html();
        window.print();
        window.document.body.innerHTML = oldHtml;
    }


    /**/
</script>
</html>
