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
    <title>追溯数据监控平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">

    <link rel="stylesheet" href="static/count/css/base.css">
    <link rel="stylesheet" href="static/count/css/firstPage.css">
    <link rel="stylesheet" href="static/count/css/bootstrap.min.css">
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <script src="static/js/jQuery/jquery.min-1.12.1.js"></script>
    <script src="static/count/echarts.js"></script>
    <script src="static/count/jquery.SuperSlide.2.1.1.js"></script>
    <script src="static/count/unslider.min.js"></script>
    <script src="static/count/jquery.cookie.js"></script>
    <script src="static/count/main.js"></script>

    <style>
        #map{width: 96.5%;height:96%;margin: 7px auto;border-radius: 10px}
        #map .anchorBL{display: none;}
        @media (max-width: 1280px) {
            .topLT .progress{
                margin-top: -10px;
            }
        }
        .cls{
            position:fixed;width:70px;height:60px;top:0px; right:0px; z-index: 999;
        }
        .cls img{
            width: 100%;
        }
        .a_img{
            cursor: pointer;
            filter:alpha(Opacity=80);-moz-opacity:0;opacity: 0;
        }
        .a_img:hover{
            cursor: pointer;
            filter:alpha(Opacity=80);-moz-opacity:0.5;opacity: 0.5;
        }
        @media screen and (max-width:1280px){
            #main4{
                width: 100%; height:80% !important;
            }
        }
        .col-sm-2,.col-sm-3{
            padding-left: 5px;
            padding-right: 5px;
        }
        #main4_01{
            position: absolute;
        }
        #main4_02{
            position: absolute;
        }
        #main4_03{
            position: absolute;
        }
        a{
            color: #ffffff;
            cursor: pointer;
            margin: 0 5px;
        }
        a:hover{
            color: #d58512 !important;
            text-decoration: none;
        }
    </style>
</head>
<body id="bigBG" style="overflow: hidden; margin-top: 10px;">

<div class="mainLT">
    <h5>年龄层数</h5>
    <div id="main1" style="width: 100%;height:120%;"></div>

</div>
<%--村情概括--%>
<div class="topLT" style="margin-left: 20px">
    <div id="main01" style="width: 100%;height:100%;"></div>
</div>

<div class="bottomLT" style="margin-top: 20px">
    <h5>贫苦户参与企业类型</h5>
    <div id="main3" style="width: 100%;height:100%;"></div>

</div>
<div class="map-ctn">
    <div id="map"></div>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1XjLLEhZhQNUzd93EjU5nOGQ"></script>
    <script type="text/javascript">
        /*获取生产基地信息及经纬度*/
        window.onload = map_load;
        function map_load(){
            $.ajax({
                url:"providers/findList.do",
                data: "",
                type: "post",
                dataType:'json',
                success: function(data){
                    // alert(data[0].p_name)
                    // 百度地图API功能
                    var map = new BMap.Map("map");
                    map.centerAndZoom(new BMap.Point(113.2939905300,33.7225028056), 8);// 初始化地图,设置中心点坐标和地图级别
                    map.enableScrollWheelZoom(true);// 开启鼠标滚轮缩放
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

    </script>

</div>
<div class="mainRT">
    <%--<h5>产品分类扫码量占比</h5>--%>
    <div id="main2" style="width: 100%;height:100%;"></div>
</div>
<div class="mainRT" style="margin-top: 20px">
    <%--<h5>产品扫码量</h5>--%>
    <div id="main7" style="width: 100%;height:100%;"></div>
</div>
<div class="bottomRT" style="margin-top: 20px">
    <%--<h5>产品扫码区域分布</h5>--%>
    <div id="hd" style="width: 100%;height:100%;">
    </div>
</div>
<div class="main-bottom">
    <div id="main4_01" style="width: 100%;height:115%;display:block"></div>
</div>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script src="static/echarts/echarts.min.js"></script>
<script type="text/javascript">
    //初始化函数 order-1
    $(document).ready(function() {
        //初始化图表
        initChart1();
        initChart2();
        initChart3();
        initChart4();
        initChart5();
        initChart6();
        findProviders();
    });

    //layui模块加载 order-2
    layui.use(['layer'], function() {
        var layer = layui.layer;

    });

    //左侧中间区域
    function initChart1(){
        $.ajax({
            url: 'bigData/findAgeCount.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart11(data);
            }
        });
    }
    //最近半年手机扫描总量
    function initChart2(){
        $.ajax({
            url: 'scan/num.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart12(data);
            }
        });
    }
    //左侧最下边区域
    function initChart3(){
        $.ajax({
            url: 'bigData/findHelpCount.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart13(data);
            }
        });
    }

    //扫码区域分布
    function findProviders(){
        $.ajax({
            url: 'scan/area.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChartPro(data);
            }
        });
    }
    //扫码区域
    function initChartPro(d){
        var myChart1 = echarts.init(document.getElementById('hd'));
        var arrNum = [];
        var legends = [];
        for (var i = 0; i < d.length; i++) {
            legends.push(d[i].user_city);
            arrNum.push({"value": d[i].code,"name":d[i].user_city});
        }
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
                data: arrNum
            },
            series : [
                {
                    name: '扫码量',
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

        myChart1.setOption(option);
    }
    // 村情概况(投诉建议)
    function initChart5(){
        $.ajax({
            url: 'scan/complainChart.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart55(data);
            }
        });
    }
    function initChart55(d){
        var myChart1 = echarts.init(document.getElementById('main01'));
        var times=[];
        var warns=[];
        var advices=[];
        for (var i = 0; i < d.length; i++) {
            times.push(d[i].time);
            warns.push(d[i].warn);
            advices.push(d[i].advice);
        }
        var option = {
            title: {
                text: '平台投诉建议统计'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                 data:['投诉','建议']
             },
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
        myChart1.setOption(option);

    }
    // 致贫原因(产品扫码量)
    function initChart6(){
        $.ajax({
            url: 'scan/crop.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart66(data);
            }
        });
    }
    function initChart66(d){
        var myChart1 = echarts.init(document.getElementById('main7'));
        var names = [];
        var codes = [];
        for (var i = 0; i < d.length; i++) {
            names.push(d[i].crop_name);
            codes.push(d[i].code);
        }
        var option = {
            title: {
                text: '最近半年单品扫码量',
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
                    name:'扫码量',
                    type:'bar',
                    barWidth: '60%',
                    data: codes
                }
            ]
        };
        myChart1.setOption(option);

    }
    /* 年龄图*/
    function initChart11(data) {
        var myChart1 = echarts.init(document.getElementById('main1'));
        var option1;
        var Color = ['#3b7186', '#2e8d94', '#637b69', '#789b6f',
            '#3b64a6', '#2672cc', '#503e8d', '#5d3ec5',
            '#874f5f', '#b6575c', '#623363', '#962e66'
        ];
        var xData = function() {
            var data = ['0-18岁','18-25岁','25-35岁','35-45岁','45-60岁','60岁以上'];
            return data;
        }();

        option1 = {
            // backgroundColor: '#153354',
            grid: {
                left: '3%',
                right: '4%',
                bottom: '10%',
                top: '15%',
                containLabel: true
            },

            tooltip: {
                show: "true",
                trigger: 'item',
                formatter: '{b}<br />{a0}: {c0}',
                backgroundColor: 'rgba(0,0,0,0.7)', // 背景
                padding: [8, 10], //内边距
                extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            xAxis: {
                type: 'value',
                axisTick: {
                    show: false
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: '#32346c '
                    }
                },
                axisLabel: {
                    textStyle: {
                        color: '#bac0c0',
                        fontWeight: 'normal',
                        fontSize: '12'
                    },
                    formatter: '{value}%'
                }
            },
            yAxis: {
                type: 'category',
                axisLine: {
                    lineStyle: {
                        color: '#7256b7'
                    }
                },
                splitLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                splitArea: {
                    show: false
                },
                axisLabel: {
                    inside: false,
                    textStyle: {
                        color: '#bac0c0',
                        fontWeight: 'normal',
                        fontSize: '12'
                    }
                },
                data:xData
            },
            series: [{
                name: '人数',
                type: 'bar',
                itemStyle: {
                    normal: {
                        show: true,
                        color: function(params) {
                            var colorList = [];
                            for (var i = 6; i > 0; i--) {
                                colorList.push({
                                    type: 'bar',
                                    colorStops: [{
                                        offset: 0,
                                        color: Color[i*2 - 2] // 0% 处的颜色
                                    }, {
                                        offset: 1,
                                        color: Color[i*2 - 1] // 100% 处的颜色
                                    }],
                                    globalCoord: false// 缺省为 false

                                });
                            }

                            return colorList[params.dataIndex]
                        },
                        barBorderRadius: 50,
                        borderWidth: 0,
                        borderColor: '#333',
                    }
                },
                barGap: '0%',
                barCategoryGap: '50%',
                data: [data.numA, data.numB, data.numC, data.numD, data.numE, data.numF]
            }

            ]
        };
        myChart1.setOption(option1);
    }
    /* 最近半年手机扫描总量*/
    function initChart12(d) {
        var myChart3 = echarts.init(document.getElementById('main4_01'));
        var  dataCount = [];
        var  dataTime = [];
        for(var i=0;i<d.length;i++){
            dataCount.push(d[i].count);
            dataTime.push(d[i].msg);
        }
        var  option = {
            title : {
                text: '最近半年手机扫描总量',
                subtext: '光标移至图上显示扫码总量',
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['总扫码量']
            },
            toolbox: {
                show : true,
                feature : {
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data:dataTime
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'总扫码量',
                    type:'bar',
                    barWidth: '20%',
                    data : dataCount
                }

            ]
        };
        myChart3.setOption(option);
    }
    // 类型分类
    function initChart13(data) {
        var myChart2 = echarts.init(document.getElementById('main3'));
        var option2 = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                y:'20%',
                textStyle:{color:'#fa497b'},
                data:['务工','入股','种植','其他']
            },
            series: [
                {
                    name:'参与类型',
                    type:'pie',
                    radius: ['40%', '55%'],
                    center: ['50%', '40%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:data.count, name:'务工'},
                        {value:data.count1, name:'入股'},
                        {value:data.count2, name:'种植'},
                        {value:data.count3, name:'其他'}
                    ]
                }
            ]
        };
        myChart2.setOption(option2);
    }
    // 救助来源情况(产品分类扫码量占比)
    function initChart4(){
        $.ajax({
            url: 'scan/type.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart44(data);
            }
        });
    }
    function initChart44(d) {
        var myChart2 = echarts.init(document.getElementById('main2'));
        var arrNum = [];
        for (var i = 0; i < d.length; i++) {
            arrNum.push({"value": d[i].count,"name":d[i].msg});
        }
        console.log(arrNum);
        var option = {
            title : {
                text: '产品分类占比',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: arrNum
            },
            series : [
                {
                    name: '扫码量',
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
        myChart2.setOption(option);

    }
</script>


<script>
    window.onresize = function () {
        $('#main1').width('100%');
        $('#main01').width('100%');
        $('#main2').width('100%');
        $('#main3').width('100%');
        $('#main4_01').width('100%');
        $('#main4_02').width('100%');
        $('#main4_03').width('100%');
        // $('#main5').width('100%');

        myChart1.resize();
        myChart2.resize();
        myChart3.resize();
        main4_01.resize();
        main4_02.resize();
        main4_03.resize();
        // myChart5.resize();

    };
</script>

<script>
    var h5s=document.getElementById("h5s");
    /*console.log(h5s)
    var as=h5s.getElementsByTagName("a")
    console.log(as);*/
    var a1=document.getElementById("a1");
    var a2=document.getElementById("a2");
    var a3=document.getElementById("a3");
    var char1=document.getElementById("main4_01");
    var char2=document.getElementById("main4_02");
    var char3=document.getElementById("main4_03");
    console.log(a1,a2,a3)
    a1.onclick=function() {
        char1.style.display="block";
        char2.style.display="none";
        char3.style.display="none";
        a1.style.color='#d58512';
        a2.style.color='';
        a3.style.color='';
        main4_01.resize();
    };
    a2.onclick=function() {
        char1.style.display="none";
        char2.style.display="block";
        char3.style.display="none";
        a1.style.color='';
        a2.style.color='#d58512';
        a3.style.color='';
        main4_02.resize();
    };
    a3.onclick=function() {
        char1.style.display="none";
        char2.style.display="none";
        char3.style.display="block";
        a1.style.color='';
        a2.style.color='';
        a3.style.color='#d58512';
        main4_03.resize();
    };
</script>
</body>
</html>