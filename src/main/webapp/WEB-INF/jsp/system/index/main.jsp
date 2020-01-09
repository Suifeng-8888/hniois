﻿<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<title>${SYSNAME}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="Bookmark" href="static/login/layui/css/favicon.ico">
	<link rel="shortcut icon" href="static/login/layui/css/favicon.ico">
	<link href="static/layui/css/layui.css" rel="stylesheet">
	<link href="static/layui/css/main.css" rel="stylesheet" media="all">
	<link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />

	<script src="static/layui/layui.js"></script>
	<script src="static/login/js/jquery-1.7.2.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo" style="width: 300px;">
			<img src="static/images/icon/favicon.png" class="layui-nav-img">
			<span>${SYSNAME}</span>
		</div>
		<!-- 头部区域（可配合layui已有的水平导航） -->
		<ul class="layui-nav layui-layout-left">

		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item" id="today" style="width: 220px;">

			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="${user.user_img}" class="layui-nav-img">
					${user.username}
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a onclick="toEdit(${user.id}, 1)" >
							<i class="fa fa-address-book-o fa-lg" aria-hidden="true"></i>
							&nbsp;基本资料
						</a>
					</dd>
					<dd>
						<a onclick="change(${user.id})" >
							<i class="fa fa-unlock-alt fa-lg" aria-hidden="true"></i>
							&nbsp;修改密码
						</a>
					</dd>
					<%--<c:if test="${user.user_id=='admin'}">--%>
						<%--<dd>--%>
							<%--<a id="autoCreate">--%>
								<%--<i class="fa fa-hand-o-right fa-lg" aria-hidden="true"></i>--%>
								<%--&nbsp;生成代码--%>
							<%--</a>--%>
						<%--</dd>--%>
					<%--</c:if>--%>
				</dl>
			</li>
			<%--<li class="layui-nav-item"><a href="javascript:;" onclick="ckMsg()">消息<span class="layui-badge" id="mg"></span></a></li>--%>
			<li class="layui-nav-item"><a href="javascript:;" onclick="loginOut()">退出</a></li>
		</ul>
	</div>

	<div class="layui-side layui-bg-black" id="left">
		<div class="layui-side-scroll">
			<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			<ul class="layui-nav layui-nav-tree"  lay-filter="layui_nav">
				<li class="layui-nav-item " lay-unselect >
					<a href="javascript:;" tab-title="首页" tab-url="/login_default.do" tab-layId="0">
						<i class="fa fa-home fa-lg"></i> 首页
					</a>
				</li>
				<c:forEach items="${menuList}" var="menu1">
					<li class="layui-nav-item">
						<a href="javascript:;" tab-title="${menu1.menu_name}" tab-url="${menu1.menu_url}" tab-layId="${menu1.menu_id}">
							<i class="${menu1.menu_icon}"></i> ${menu1.menu_name}</a>
						<c:if test="${'[]' != menu1.children}">
							<dl class="layui-nav-child">
								<c:forEach items="${menu1.children}" var="menu2">
									<dd><a href="javascript:;" tab-title="${menu2.menu_name}" tab-url="${menu2.menu_url}" tab-layId="${menu2.menu_id}">
										<i class="${menu2.menu_icon}"></i> ${menu2.menu_name}</a></dd>
								</c:forEach>
							</dl>
						</c:if>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div class="layui-body layui-form" style="height: 100%;">
		<!-- 内容主体区域 -->
		<div class="layui-tab layui-tab-card marg0" lay-allowClose="true" lay-filter="lay-tab" id="layui-tabs">
			<ul class="layui-tab-title top_tab" id="layui-tabs-ul">
				<li class="layui-this"  lay-id="0" >首页</li>
			</ul>
			<div class="layui-tab-content clildFrame" id="layui-tabs-content">
				<div class="layui-tab-item layui-show">
					<iframe  src='/login_default.do'></iframe>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="layui-footer">
	<!-- 底部固定区域 -->
    <%--文件下载--%>
    <form id="excel-form" method="post">

    </form>
</div>

<script type="text/javascript">
    //JavaScript代码区域
    //导航 + tab 相关js代码模块
    layui.use(['layer','element'], function(){
        var element = layui.element,
            layer = layui.layer ;

        $("#left .layui-nav .layui-nav-item a").on("click",function(){
            if($(this).attr("tab-url")!="#"){
                addTabs($(this).attr("tab-title"),$(this).attr("tab-url"),$(this).attr("tab-layId"))
            }
            $(this).parent("li").siblings().removeClass("layui-nav-itemed");
        });


        //打开layui-tab选项卡
        function addTabs(title,url,layId){
            if ($("#layui-tabs-ul li[lay-id=" + layId + "]").length > 0) {
                element.tabDelete('lay-tab', layId);
            }
            url = url + "?id=" + layId;
            element.tabAdd('lay-tab', {
                id: layId,
                title: title,
                content: '<iframe src=\'' + url + '\'></iframe>' //支持传入html
            });
            element.tabChange('lay-tab', layId);
        }

        //公共tools
        var _tools = {
            goExcel: function() {
                //打开新导出页面
				if($("#layui-tabs-ul li[lay-id=233333]").length>0){
                    element.tabDelete('lay-tab', "233333");
				}
                addTabs("导出数据","excel/toExport.do","233333");
            },
			doExcel: function(url,param){
                //执行导出
                var $from = $("#excel-form");
                //刷新路径
                $from.attr("action",url);
                //组装param
				var $input = "";
				for(var key in param){
                    $input+= '<input type="hidden" name="'+key+'" value="'+param[key]+'">';
				}
                $from.html("").append($input);
				//提交表单
                 $from.submit();
                //关闭导出窗口
                 _tools.endExcel();
			},
            endExcel:function(){
                //关闭导出tabs
                element.tabDelete('lay-tab', "233333");
			},
			//打印二维码页面
			goPrint:function(ids){
                //打开新导出页面
                if($("#layui-tabs-ul li[lay-id=266666]").length>0){
                    element.tabDelete('lay-tab', "266666");
                }
                addTabs("打印二维码","qCode/toPrint.do?data="+ids ,"266666");
               // addTabs("打印二维码","code/toPrint.do?code_id="+id,"266666");之前的打印方法
			},
			endPrint:function(){
                //关闭导出tabs
                element.tabDelete('lay-tab', "266666");
			}

        };
        //绑定tools
        window._tools = _tools;

        //生成代码
		$("#autoCreate").on("click",function () {
            addTabs("代码生成","temp/toCreatePage","999");
        })
    });

    //退出登录
    function loginOut(){
        // window.location.href =  "login_logout.do";
        var $from = $("#excel-form");
        $from.attr("action","login_logout.do");
        $from.submit();
    }

    //	基本资料
    var layer = layui.layer ;
    function toEdit(id,code){
        layer.open({
            title : "用户信息",
            type: 2,
            offset: 'auto',
            maxmin: false,
            skin: 'layui-layer-rim', //加边框
            content: "user/edit.do?id="+id+"&code="+code,
            area: ['650px', '80%']
        });
    }
    //	修改密码
    function change(id) {
        layer.open({
            title: "修改密码",
            type: 2,
            offset: "auto",
            maxmin: false,
            skin: 'layui-layer-rim', //加边框
            content: "user/toChange.do?id=" + id,
            area:['650px', '80%']
        });
    }

    //获取日期时间
    function setDateTime() {
        var date = new Date();
        var day = date.getDay();
        var yy = date.getFullYear();
        var MM = date.getMonth() + 1;
        if(MM < 10) {
            MM = "0" + MM;
        }
        var dd = date.getDate();
        if(dd < 10) {
            dd = "0" + dd;
        }
        var hh = date.getHours();
        if(hh < 10) {
            hh = "0" + hh;
        }
        var mm = date.getMinutes();
        if (mm < 10) {
            mm = "0" + mm;
        }
        var ss = date.getSeconds();
        if (ss < 10) {
            ss = "0" + ss;
        }
        var week;
        switch (day) {
            case 0 : week = "星期日";break;
            case 1 : week = "星期一";break;
            case 2 : week = "星期二";break;
            case 3 : week = "星期三";break;
            case 4 : week = "星期四";break;
            case 5 : week = "星期五";break;
            case 6 : week = "星期六";break;
        }
        var today = yy + "年" + MM + "月" + dd + "日&nbsp;" + week + "&nbsp;" + hh + ":" + mm + ":" + ss;
        $("#today").html(today);
    }
    window.setInterval("setDateTime()", 1000);

    //获取消息数提醒
	function count(){
	    var mg=$("#mg");
	    $.ajax({
			url:'msg/count.do',
			type:'post',
			dataType:'json',
			success:function (msg){
			   mg.html(msg.toString());
			}
		});
	}
    window.setInterval(count(), 2000);

	//查看消息
	function ckMsg(){
		var layer = layui.layer;
		layer.open({
            title : "消息信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "msg/scanner.do",
            area: ['700px', '80%']
		});
	}

</script>
</body>
</html>