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
                        var content = data[i].full_name+"</br>"+"地址:"+data[i].p_location+"</br>"+"联系方式:"+data[i].p_phone;
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
    <h5>救助物资及救济金来源情况</h5>
    <div id="main2" style="width: 100%;height:100%;"></div>
</div>
<div class="mainRT" style="margin-top: 20px">
    <h5>致贫原因分析</h5>
    <div id="main7" style="width: 100%;height:100%;"></div>
</div>
<div class="bottomRT" style="margin-top: 20px">
    <h5>本地区企业数量占比及类型</h5>
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
    function initChart2(){
        $.ajax({
            url: 'bigData/findMonth.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart12(data);
            }
        });
    }
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
    function findProviders(){
        $.ajax({
            url: 'bigData/findProvideCount.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChartPro(data);
            }
        });
    }
    //本地供应商
    function initChartPro(data){
        var myChart1 = echarts.init(document.getElementById('hd'));
        option = {
            title : {
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                y:'20%',
                textStyle:{color:'#3ac6fa'},
                data: ['特色林果','林下种植','花卉苗木']
            },
            series : [
                {
                    name: '企业数量',
                    type: 'pie',
                    radius : '55%',
                    center: ['60%', '50%'],
                    data:[
                        {value:data.count, name:'特色林果'},
                        {value:data.count1, name:'林下种植'},
                        {value:data.count2, name:'花卉苗木'}
                    ],
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
    // 村情概况
    function initChart5(){
        $.ajax({
            url: 'bigData/findCount.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart55(data);
            }
        });
    }
    function initChart55(data){
        var myChart1 = echarts.init(document.getElementById('main01'));
        var xData = function() {
            var data = ['贫困村','贫困户','人口总数','村干部','无劳动能力'];
            return data;
        }();
        var data = [data.count, data.count1, data.count2, data.count3, data.count4];
        option = {
            // backgroundColor: "#141f56",
            title: {
                text: "村情概况",
                textStyle: {
                    color: '#fff',
                    fontSize: '12'
                },
                subtextStyle: {
                    color: '#90979c',
                    fontSize: '16'

                }
            },
            tooltip: {
                show: "true",
                trigger: 'item',
                backgroundColor: 'rgba(0,0,0,0.7)', // 背景
                padding: [8, 10], //内边距
                extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
                formatter: function(params) {
                    if (params.seriesName != "") {
                        return params.name +':'+ params.value + '个';
                    }
                }

            },
            grid: {
                borderWidth: 0,
                top: 30,
                bottom: 25,
                textStyle: {
                    color: "#fff"
                }
            },
            xAxis: [{
                type: 'category',
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#85dfff'
                    }
                },
                axisLabel: {
                    inside: false,
                    textStyle: {
                        color: '#bac0c0',
                        fontWeight: 'normal',
                        fontSize: '12'
                    }
                },
                data: xData
            }, {
                type: 'category',
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    show: false
                },
                splitArea: {
                    show: false
                },
                splitLine: {
                    show: false
                },
                data: xData
            }],
            yAxis: {
                type: 'value',
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#85dfff'
                    }
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
                    formatter: '{value}'
                }
            },
            series: [{
                name: '生师比(%)',
                type: 'bar',
                itemStyle: {
                    normal: {
                        show: true,
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: '#00c0e9'
                        }, {
                            offset: 1,
                            color: '#3b73cf'
                        }]),
                        barBorderRadius: 50,
                        borderWidth: 0
                    },
                    emphasis: {
                        shadowBlur: 15,
                        shadowColor: 'rgba(105,123, 214, 0.7)'
                    }
                },
                zlevel: 2,
                barWidth: '30%',
                data: data
            },
                {
                    name: '',
                    type: 'bar',
                    xAxisIndex: 1,
                    zlevel: 1,
                    itemStyle: {
                        normal: {
                            color: '#121847',
                            borderWidth: 0,
                            shadowBlur: {
                                shadowColor: 'rgba(255,255,255,0.31)',
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowOffsetY: 2
                            }
                        }
                    },
                    barWidth: '10%',
                    data: [10, 10, 10, 10, 10]
                }
            ]
        };
        myChart1.setOption(option);

    }
    // 致贫原因
    function initChart6(){
        $.ajax({
            url: 'bigData/findReasonCount.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart66(data);
            }
        });
    }
    function initChart66(data){
        var myChart1 = echarts.init(document.getElementById('main7'));
        var data =[data.count, data.count1, data.count2, data.count3, data.count4];
        option = {
            //color: ['#3398DB'],
            tooltip: {
                trigger: 'axis',
                backgroundColor:'rgba(255,255,255,0.8)',
                extraCssText: 'box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);',
                textStyle:{
                    color:'#6a717b'
                }

            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '-13%',
                top: '10%',
                containLabel: true
            },
            yAxis: [{
                type: 'category',
                data: ['因   病','因   残','因   学','缺   地','缺劳力'],
                inverse: true,
                axisTick: {
                    alignWithLabel: true
                },
                axisLabel: {
                    margin: 10,
                    textStyle: {
                        fontSize: 10,
                        color:'#53a8fa'
                    }
                },
                axisLine: {
                    lineStyle: {
                        type:'dashed',
                        color: '#85dfff'
                    }
                }

            }],
            xAxis: [{
                type: 'value',
                axisLabel: {
                    margin: 10,
                    textStyle: {
                        fontSize: 12,
                        color:'#53a8fa'
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#192469'
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: '#17367c'
                    }
                }



            }],
            // backgroundColor: '#192469',
            series: [{
                // name: 'Top 10',
                type: 'bar',
                barWidth:16,
                data: data,
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight',
                        textStyle: {
                            color: 'white' //color of value
                        }
                    }
                },


                itemStyle: {

                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                            offset: 0,
                            color: '#0590eb' // 0% 处的颜色
                        }, {
                            offset: 1,
                            color: '#08e3f1' // 100% 处的颜色
                        }], false),
                        barBorderRadius: [0, 15,15, 0],
                        shadowColor: 'rgba(0,0,0,0.1)',
                        shadowBlur: 3,
                        shadowOffsetY: 3
                    }
                }
            }]
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
    /* 次数折现图*/
    function initChart12(data) {
        var myChart3 = echarts.init(document.getElementById('main4_01'));
        option = {
            color: ['#D53A35', '#E98F6F', '#6AB0B8', '#334B5C'],
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                textStyle:{color:'#fa497b'},
                data: ['走访次数', '扶贫记次数']
            },
            grid: {
                left: '3%',
                right: '4.5%',
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
                // name: '日期',
                axisLabel: {
                    color: '#ff709e'
                },
                axisLine:{
                    lineStyle:{
                        color: '#ff709e'
                    }
                },
                boundaryGap: false,
                data: data.time
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    color: '#ff709e'
                },
                axisLine:{
                    lineStyle:{
                        color: '#ff709e'
                    }
                },
                name: '次数'
            },
            series: [{
                name: '走访次数',
                type: 'line',
                stack: '总量',
                data: data.count
            },
                {
                    name: '扶贫记次数',
                    type: 'line',
                    stack: '总量',
                    data: data.count2
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
    // 救助来源情况
    function initChart4(){
        $.ajax({
            url: 'bigData/findAlmsCount.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart44(data);
            }
        });
    }
    function initChart44(data) {
        var myChart2 = echarts.init(document.getElementById('main2'));
        var option2 = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: '2%',
                y:'20%',
                textStyle:{color:'#3fb791'},
                data:['社会救助物资','政府救助物资','其他救助物资','社会救济金','政府救济金','其他救济金']
            },
            series: [
                {
                    name:'救助物资来源',
                    type:'pie',
                    selectedMode: 'single',
                    radius: [0, '35%'],
                    center: ['60%', '55%'],
                    label: {
                        normal: {
                            show : false,
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:data.count4, name:'社会救助物资', selected:true},
                        {value:data.count3, name:'政府救助物资'},
                        {value:data.count5, name:'其他救助物资'}
                    ]
                },
                {
                    name:'救济金来源',
                    type:'pie',
                    radius: ['50%', '70%'],
                    center: ['60%', '55%'],
                    label: {
                        normal: {
                            show : false
                        }
                    },
                    data:[
                        {value:data.count, name:'社会救济金'},
                        {value:data.count1, name:'政府救济金'},
                        {value:data.count2, name:'其他救济金'}
                    ]
                }
            ]
        };
        myChart2.setOption(option2);

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
    console.log(h5s)
    var as=h5s.getElementsByTagName("a")
    console.log(as);
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