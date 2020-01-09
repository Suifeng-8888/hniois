<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <style>
        .report-img{
            height: 150px;
            width: 200px;
        }
    </style>
</head>
<body>
    <div class="hniois-table">
        <form class="layui-form" action="">
            <div class="hniois-table-header">
                <div class="layui-form-item hniois-search-btns">
                    <label class="layui-form-label">生产企业:</label>
                    <div class="layui-input-inline layui-col-md5">
                        <input name="code" id="code" type="text" class="layui-input" style="width: 300px">
                    </div>
                    <div class="layui-input-inline layui-col-md2">
                        <span data-method="notice" style="margin-left: 2px" class="layui-btn chose layui-btn-normal">选择生产企业</span>
                    </div>
                    <label class="layui-form-label">产品名称:</label>
                    <div class="layui-input-inline layui-col-md3">
                        <input name="batch" id="batch" type="text" class="layui-input" style="width: 250px">
                    </div>
                    <div class="layui-input-inline layui-col-md2">
                        <span data-method="notice"  class="layui-btn chose layui-btn-normal">选择产品</span>
                    </div>
                    <button class="layui-btn" lay-submit lay-filter="formSave" >查询</button>
                </div>
            </div>
        </form>
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <li class="layui-this">企业信息</li>
                <li>资质信息</li>
                <li>产品信息</li>
                <li>生产信息</li>
                <li>追溯码信息</li>
                <li>检验报告</li>
                <li>销售信息</li>
                <li>召回信息</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-fluid layui-show" id="company">
                    <div class="layui-container">
                        <div class="layui-row">
                            <div class="layui-col-md10">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">企业名称:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="平顶山蓝天农场品生产基地">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">组织形式:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="个人">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">所属行业:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="农产品种植,养殖">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">主体类别:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="农业生产">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">证件类型:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="生产许可证">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">工商注册号:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="zc20181029">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">营业期限:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="10年">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">详细地址:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="平顶山市宝丰县魏庄街">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">联系电话:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="15503647259">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item" id="aptitude">
                    <div class="layui-row layui-col-space20">
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                    </div>
                </div>

                <div class="layui-tab-item">
                    <h4>暂无信息</h4>
                </div>
                <div class="layui-tab-item">
                    <h4>暂无信息</h4>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-container">
                        <div class="layui-row">
                            <div class="layui-col-md10">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">防伪码:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="0219">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">国家编码:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="Y-A-20180241">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">开始条码:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="0012">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">结束条码:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="0050">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md6">
                            <div class="layui-form-item">
                                <label class="layui-form-label">检测编号:</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" type="text" readonly value="JC-20181001-01">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">报告名称:</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" type="text" readonly value="黄瓜检测报告">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">产品名称:</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" type="text" readonly value="黄瓜">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">产品批次:</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" type="text" readonly value="PC-20181029-001">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">检测结果:</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" type="text" readonly value="合格通过">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">检测人:</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" type="text" readonly value="周杰伦">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">检测时间:</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" type="text" readonly value="2018-10-29">
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md6">
                            <table class="layui-table">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>检测项</th>
                                    <th>检测值</th>
                                    <th>结果</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>农药残留</td>
                                    <td>0.03mg/L</td>
                                    <td style="color: #00B83F">合格</td>
                                </tr>
                                <tr>
                                    <td>PH</td>
                                    <td>0.7</td>
                                    <td style="color: red">不合格</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="layui-row layui-col-space10" style="margin-bottom: 40px;">
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                        <div class="layui-col-md2">
                            <img src="attached/file/20181029/meimv.jpg" class="report-img">
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md12">
                            <table class="layui-table">
                                <thead>
                                <tr>
                                    <th>销售商</th>
                                    <th>发货时间</th>
                                    <th>发货地址</th>
                                    <th>收货人</th>
                                    <th>收货地址</th>
                                    <th>产品名称</th>
                                    <th>产品数量</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>城南菜市场</td>
                                    <td>2018-01-01</td>
                                    <td>许昌</td>
                                    <td>周杰伦</td>
                                    <td>郑州</td>
                                    <td>黄瓜</td>
                                    <td>100kg</td>
                                </tr>
                                <tr>
                                    <td>城南菜市场</td>
                                    <td>2018-01-01</td>
                                    <td>许昌</td>
                                    <td>周杰伦</td>
                                    <td>郑州</td>
                                    <td>黄瓜</td>
                                    <td>100kg</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-container">
                        <div class="layui-row">
                            <div class="layui-col-md10">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">产品名称:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="黄瓜">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">生产企业:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="平顶山蓝天农场品生产基地">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">召回数量:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="200kg">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">召回原因:</label>
                                    <div class="layui-input-block">
                                        <textarea class="layui-textarea" type="text" readonly>农药残留检测超标</textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">发布机构:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="平顶山农业局">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">发布时间:</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" type="text" readonly value="2018-10-30">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    layui.use(['layer', 'form'], function() {
        var form =layui.form;
        //监听提交
        form.on('submit(formSave)', function(data){
            $.ajax({
                type: "post",
                data: data.field,
                url: "search/getdata.do",
                dataType:'json',
                success: function (msg) {
                    if(msg != null) {

                        // $("#company").html("<h1>" + msg.providers.p_name + msg.providers.p_form + "</h1>");
                        // var aptitudehtml = "";
                        // for (var i = 0; i < msg.aptitudeList.length; i++) {
                        //     aptitudehtml += "<h1>" + msg.aptitudeList[i].unit + "</h1>";
                        // }
                        //     $("#aptitude").html(aptitudehtml);

                    }
                }
            });
            return false;
        });
    });
</script>
</html>