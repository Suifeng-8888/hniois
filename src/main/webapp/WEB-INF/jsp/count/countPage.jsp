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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />

    <script src="static/login/js/jquery-1.7.2.js"></script>
    <script src="static/echarts/echarts.min.js"></script>
    <script src="static/count/echarts-wordcloud.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1XjLLEhZhQNUzd93EjU5nOGQ"></script>
    <script type="text/javascript" src="static/count/mapv.js"></script>
    <style>
        .test{
            border:1px solid #76c1ef;
        }
        .main{
            width: 100%;
            height: 100%;
            margin-top: 15px;
            background: #f3f3f3;
        }
        .map-ctn{
            height: 420px;
            border-radius: 8px;
        }
        .map-ctn .anchorBL{
            display: none;
        }
        .left_one{
            height: 200px;
        }
        .right_one{
            height: 200px;
        }
        .left_two{
            margin-top: -210px;
            height: 200px;
        }
        .right_two{
            display: inline;
            float: right;
            margin-top: -210px;
            height: 200px;
        }
        .left_three{
            height: 200px;
        }
        .centre_two{
            height: 200px;
        }
        .right_three{
            height: 200px;
        }
    </style>
</head>
<body>

<div class="layui-container main">
    <div class="layui-row">
        <%--左一--%>
        <div class="layui-col-md3 test left_one" id="complain_chart">
        </div>
        <%--地图--%>
        <div class="layui-col-md6 test map-ctn" id="map">
        </div>
        <%--右一--%>
        <div class="layui-col-md3 test right_one" id="scan_area_chart">
        </div>
    </div>
    <div class="layui-row">
        <%--左二--%>
        <div class="layui-col-md3 test left_two" id="scan_hot_chart"></div>
        <%--右二--%>
        <div class="layui-col-md3 test right_two" id="scan_count_chart"></div>
    </div>
    <%--<div class="layui-row">--%>
        <%--&lt;%&ndash;左三&ndash;%&gt;--%>
        <%--<div class="layui-col-md3 test left_three">左三</div>--%>
        <%--&lt;%&ndash;中二&ndash;%&gt;--%>
        <%--<div class="layui-col-md6 test centre_two">中二</div>--%>
        <%--&lt;%&ndash;右三&ndash;%&gt;--%>
        <%--<div class="layui-col-md3 test right_three">右三</div>--%>
    <%--</div>--%>
</div>
</body>
<script>
    $(document).ready(function () {
        baidu_show();  //  地图
        complainChart(); //  左一
        areaChart();// 右一
        scanHotChart();// 左二
        cropChart();// 右二
    });

    //地图坐标点
    function baidu_show() {
        $.ajax({
            url:"providers/findList.do",
            type: "post",
            dataType:'json',
            success: function (data) {
                var map = new BMap.Map("map", {
                    enableMapClick: false
                });
                map.centerAndZoom(new BMap.Point(113.200265,33.774238), 10);  // 初始化地图,设置中心点坐标和地图级别
                map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放
                map.addControl(new BMap.NavigationControl());//开启放大缩小按钮

                var opts = {
                    width : 250,     // 信息窗口宽度
                    height: 80,     // 信息窗口高度
                    title : "" , // 信息窗口标题
                    enableMessage:true//设置允许信息窗发送短息
                };
                for(var i=0;i<data.length;i++){
                    var marker = new BMap.Marker(new BMap.Point(data[i].p_longitude,data[i].p_latitude));  // 创建标注
                    var content = data[i].p_name+"</br>"+"地址:"+data[i].p_address+"</br>"+"联系方式:"+data[i].p_phone;
                    map.addOverlay(marker);               // 将标注添加到地图中
                    addClickHandler(content,marker);
                }
                function addClickHandler(content,marker){
                    marker.addEventListener("click",function(e){
                        openInfo(content,e)}
                    );
                }
                function openInfo(content,e){
                    var p = e.target;
                    var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
                    var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
                    map.openInfoWindow(infoWindow,point); //开启信息窗口
                }
            }
        });
    }
    //左一
    function complainChart() {
        $.ajax({
            url: 'scan/complainChart',
            data: '',
            type: "post",
            dataType:'json',
            success: function(data){
                left_one_chart(data);
            }
        });
    }
    function left_one_chart(d) {
        var times=[];
        var warns=[];
        var advices=[];
        for (var i = 0; i < d.length; i++) {
            times.push(d[i].time);
            warns.push(d[i].warn);
            advices.push(d[i].advice);
        }
        var chart1 = echarts.init(document.getElementById('complain_chart'));
        var option = {
            title: {
                text: '平台投诉建议统计'
            },
            tooltip: {
                trigger: 'axis'
            },
            // legend: {
            //     data:['投诉','建议']
            // },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: times
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'投诉',
                    type:'line',
                    stack: '总量',
                    data:warns
                },
                {
                    name:'建议',
                    type:'line',
                    stack: '总量',
                    data:advices
                }
            ]
        };
        chart1.setOption(option);
    }
    //右一
    //饼状态统计
    function areaChart(){
        $.ajax({
            url: 'scan/area.do',
            data: '',
            type: "post",
            dataType:'json',
            success: function(data){
                right_one_chart(data);
            }
        });
    }
    function right_one_chart(d) {
        var arrNum = [];
        var legends = [];
        for (var i = 0; i < d.length; i++) {
            legends.push(d[i].user_city);
            arrNum.push({"value": d[i].code,"name":d[i].user_city});
        }
        var chart2 = echarts.init(document.getElementById('scan_area_chart'));
        var option = {
            title : {
                text: '扫码区域分布',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: legends
            },
            series : [
                {
                    name: '占有量',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:arrNum,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        chart2.setOption(option);
    }
    //左二
    function scanHotChart(){
        $.ajax({
            url: 'scan/hot.do',
            data: '',
            type: "post",
            dataType:'json',
            success: function(data){
                left_two_chart(data);
            }
        });
    }
    function left_two_chart(d) {
        var scanHot = [];
        for (var i = 0; i < d.length; i++) {
            scanHot.push({"value": d[i].number,"name":d[i].crop_name});
        }
        var chart3 = echarts.init(document.getElementById('scan_hot_chart'));
        var option = {
            title: {
                text: '热门产品展示',
                x: 'left',
            },
            tooltip: {
                show: true
            },
            series: [{
                data: scanHot,
                name: '热点产品',
                type: 'wordCloud',
                textPadding: 0,
                autoSize: {
                    enable: true,
                    minSize: 6
                },
                textStyle: {
                    normal: {
                        color: function() {
                            return 'rgb(' + [
                                Math.round(Math.random() * 105) + 100,
                                Math.round(Math.random() * 105) + 100,
                                Math.round(Math.random() * 105) + 100
                            ].join(',') + ')';
                        }
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowColor: '#333'
                    }
                }
            }]
        };
        chart3.setOption(option);
    }
    //右二
    function cropChart(){
        $.ajax({
            url: 'scan/crop.do',
            data: '',
            type: "post",
            dataType:'json',
            success: function(data){
                right_two_chart(data);
            }
        });
    }
    function right_two_chart(d) {
        var names = [];
        var codes = [];
        for (var i = 0; i < d.length; i++) {
            names.push(d[i].crop_name);
            codes.push(d[i].code);
        }
        var chart4 = echarts.init(document.getElementById('scan_count_chart'));
        var option = {
            title: {
                text: '产品扫码量',
                x: 'left',
            },
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    data : names,
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'扫码查寻',
                    type:'bar',
                    barWidth: '60%',
                    data: codes
                }
            ]
        };
        chart4.setOption(option);
    }
    window.onresize=function(){
        $("#complain_chart").width('100%');
        $("#complain_chart").height('100%');
        $("#scan_area_chart").width('100%');
        $("#scan_area_chart").height('100%');
        $("#scan_hot_chart").width('100%');
        $("#scan_hot_chart").height('100%');
        $("#scan_count_chart").width('100%');
        $("#scan_count_chart").height('100%');
        chart1.resize();
        chart2.resize();
        chart3.resize();
        chart4.resize();
    }
</script>
</html>