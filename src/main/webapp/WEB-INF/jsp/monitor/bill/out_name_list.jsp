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
    <title>采购商品费用</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
<%--任务栏--%>
<div class="hniois-table">
    <form action="Buy/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <a id="hniois-export" onclick="doExport('buy/doExport')" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                    <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 导出</a>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" style="width:100px" id="test1" class="layui-input-inline hniois-search-data" name="btime" placeholder="开始日期" />
                    <i>-</i>
                    <input type="text" style="width:100px;margin-right: 70px" id="test2" class="layui-input-inline hniois-search-data" name="etime" placeholder="结束日期" />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
            </div>
        </div>
    </form>
</div>

<div class="layui-row">
    <div class="layui-col-md7">
        <div style="height: 300px;width: 100%;" id="echarts-left1">

        </div>
    </div>

    <div class="layui-col-md5">
        <div style="height: 300px;width: 100%;" id="echarts-left2">

        </div>
    </div>
</div>
<%--查询表格--%>
<table class="layui-hide" id="table" lay-filter="lay_table">

</table>

</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script src="static/echarts/echarts.min.js"></script>
<script>
    //初始化函数 order-1
    var data_table ;//数据表格
    $(document).ready(function() {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate=layui.laydate;
        data_table = table.render({
            elem: '#table',
            url:'buy/outList.do',
            limits:[10],
            cols: [[
                {type:'checkbox'},
               // {field:'id',  title: '序号'},
                {field:'b_name',  title: '物品名'},
                {field:'b_category',  title: '采购类别',templet:function(d) {
                        var str = d.b_category;
                        if (str == "1") {
                            return "<span>化肥</span>";
                        } else if (str == "2") {
                            return "<span>种子</span>";
                        } else if (str == "3") {
                            return "<span>农药</span>";
                        }else if (str == "4") {
                            return "<span>其他</span>";
                        }
                    }},
                {field:'b_number',  title: '采购数量'},
                {field:'cost',  title: '总价(¥)'},
               // {field:'b_time',  title: '日期'}

            ]],
            height: 'full-450', cellMinWidth: 60,page: true
        });

        //获取日历
        laydate.render({
            elem: '#test1'
        })
        //获取日历
        laydate.render({
            elem: '#test2'
        })
        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                toEdit(data.id,0)
            }
        });

        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
            if("${fn:contains(QX,'buy/update')}"=="true"){
                var field = obj.field , //得到字段
                    value = obj.value ,//得到修改后的值
                    data = obj.data ;//得到所在行所有键值
                var obj = new Object();
                obj.id = data.id;
                obj[field] = value;
                //修改数据
                doEdit(obj);
            }else {
                layer.msg("无修改权限")
            }

        });

        //监听搜索表单提交
        form.on('submit(search)', function(data) {
            //带条件查询
            data_table.reload({
                where: data.field
            });
            $('.hniois-search-mored').hide();
            //点击查询时重新初始化图表
            initCharts();
            return false;
        });

        //更多筛选
        $('#hniois-search-more').on('click', function() {
            $('.hniois-search-mored').toggle();
        });
        //初始化表格
        initCharts();
    });

    //执行重载 表单查询
    function formReload() {
        var param = getSearchData();
        data_table.reload({
            where: param
        });
    }

    //*************图标加载模块
    function initCharts(){
        initChart1();
        initChart2();
    }
    //柱状图统计
    function initChart1(){
        b_time=$("#test1").val();
        e_time=$("#test2").val();
        $.ajax({
            url: 'buy/outList.do',
            data: {
                btime:b_time,
                etime:e_time,
            },
            type: "post",
            dataType:'json',
            success: function(data){
                initChart11(data);
            }
        });
    }

    //饼状态统计
    function initChart2(){
        b_time=$("#test1").val();
        e_time=$("#test2").val();
        $.ajax({
            url: 'buy/outList.do',
            data: {
                btime:b_time,
                etime:e_time,
            },
            type: "post",
            dataType:'json',
            success: function(data){
                initChart22(data);
            }
        });
    }

    /* 柱状图*/
    function initChart11(d){
        var  dataCount = [];
        var  dataName = [];
        for(var i=0;i<d.data.length;i++){
            dataCount.push(d.data[i].cost);
            dataName.push(d.data[i].b_name);
        }
        var  option = {
            title : {
                text: '最近半年采购商品费用',
                subtext: '光标移至图上显示费用',
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['费用']
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
                    data:dataName
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'费用',
                    type:'bar',
                    barWidth: '20%',
                    data : dataCount
                }

            ]
        };
        var myChart1 = echarts.init(document.getElementById('echarts-left1'));
        myChart1.setOption(option);
    }

    /*饼状图*/
    function initChart22(d){
        var arrNum=[];
        var obj = d.data;
        var objNum = d.data;
        for (var i = 0; i < obj.length; i++) {
            arrNum.push({"value": objNum[i].cost,"name":obj[i].b_name});
        }
        var  option = {
            title : {
                text: '最近六个月采购费用对比',
                subtext: '光标移至图上显示百分比',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: '10%',
                data: arrNum
            },
            series : [
                {
                    name: '采购费用',
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
        var myChart2 = echarts.init(document.getElementById('echarts-left2'));
        myChart2.setOption(option);
    }
</script>
</html>