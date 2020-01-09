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
    <title>企业信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="r_id" id="key" value="${register.r_id}">
        <input type="hidden" name="p_qualifications"  value="${register.p_qualifications}">
        <%--<label class="layui-form-label">基地类别</label>
            <div class="layui-input-block">
                <input name="p_certificate" class="layui-input" type="text" autocomplete="off"
                        value="${register.p_certificate}">
            </div>--%>
        <div class="layui-form-item">
            <label class="layui-form-label">基地名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="p_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${register.p_name}">
            </div>
            <label class="layui-form-label">企业类型</label>
            <div class="layui-input-block">
                <select name="p_category" id="st">
                    <option value="">请选择</option>
                    <option value="龙头企业" >龙头企业</option>
                    <option value="家庭农场" >家庭农场</option>
                    <option value="专业合作社" >专业合作社</option>
                    <option value="其他" >其他</option>
                </select>
            </div>
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-block">
                <select name="p_industry" id="indus">
                    <option value="">请选择</option>
                    <option value="种植业" >种植业</option>
                    <option value="畜禽业" >畜禽业</option>
                    <option value="水产业" >水产业</option>
                </select>
            </div>
            <label class="layui-form-label">营业执照代码</label>
            <div class="layui-input-block">
                <input name="p_register" class="layui-input" type="text" autocomplete="off" value="${register.p_register}">
            </div>

            <label class="layui-form-label">组织形式</label>
            <div class="layui-input-block">
                <input name="p_form" class="layui-input" type="text" autocomplete="off"
                        value="${register.p_form}">
            </div>
            <label class="layui-form-label">营业期限</label>
            <div class="layui-input-block">
                <input type="text" name="p_time" autocomplete="off" lay-verify="required"
                       id="test1" placeholder="yyyy-MM-dd"  class="layui-input" value="${register.p_time}">
            </div>

            <label class="layui-form-label">基地法人</label>
            <div class="layui-input-block">
                <input name="p_person" class="layui-input" type="text" autocomplete="off"
                       value="${register.p_person}">
            </div>
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input name="p_phone" class="layui-input" type="text" autocomplete="off"
                       value="${register.p_phone}">
            </div>
            <label class="layui-form-label">申请日期</label>
            <div class="layui-input-block">
                <input type="text" name="aly_time" autocomplete="off" lay-verify="required"
                       id="test2" placeholder="yyyy-MM-dd"  class="layui-input" value="${register.aly_time}">
            </div>
            <label class="layui-form-label">审批状态</label>
            <div class="layui-input-block">
                <select name="state" id="state">
                    <option value="">请选择</option>
                    <option value="0" >待审核</option>
                    <option value="1" >初审通过</option>
                    <option value="2" >初审驳回</option>
                </select>
            </div>
            <%--<label class="layui-form-label">二级审批</label>--%>
            <%--<div class="layui-input-block">--%>
                <%--<select name="city_state" id="cstate">--%>
                    <%--<option value="">请选择</option>--%>
                    <%--<option value="0" >待审批</option>--%>
                    <%--<option value="1" >审批通过</option>--%>
                    <%--<option value="2" >审批驳回</option>--%>
                <%--</select>--%>
            <%--</div>--%>
            <label class="layui-form-label">审批时间</label>
            <div class="layui-input-block">
                <input type="text" name="apo_time" autocomplete="off" lay-verify="required"
                       id="test3" placeholder="yyyy-MM-dd"  class="layui-input" value="${register.apo_time}">
            </div>
            <label class="layui-form-label">驳回理由</label>
            <div class="layui-input-block">
                <input name="apo_reason" class="layui-input" type="text" autocomplete="off"
                       value="${register.apo_reason}">
            </div>

            <label class="layui-form-label">所属区域</label>
            <div class="layui-input-block">
                <div class="layui-input-inline">
                    <select name="p_province">
                        <option value="">请选择省</option>
                        <option value="河南省" selected="">河南省</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="p_city" id="cty">
                        <option value="">请选择市</option>
                        <option value="平顶山市" selected="">平顶山市</option>
                    </select>
                </div>
                <div class="layui-input-inline" >
                    <select name="p_area"  id="ops" >
                    </select>
                </div>
                </div>
                <label class="layui-form-label">详细地址</label>
                <div class="layui-input-block">
                    <input name="p_address" class="layui-input" type="text" autocomplete="off"
                           value="${register.p_address}">
                </div>

                <label class="layui-form-label">企业简介</label>
                <div class="layui-input-block">
                    <textarea name="brief" placeholder="请输入..." class="layui-textarea">${register.brief}</textarea>
                </div>

                <label class="layui-form-label">经度</label>
                <div class="layui-input-block">
                    <input name="p_longitude" class="layui-input" type="text" autocomplete="off"
                     placeholder="经度"      value="${register.p_longitude}">
                </div>
                <label class="layui-form-label">纬度</label>
                <div class="layui-input-block">
                    <input name="p_latitude" class="layui-input" type="text" autocomplete="off"
                           placeholder="纬度"      value="${register.p_latitude}">
                </div>
        </div>

        <div class="layui-form-item" style="text-align: center;"  >
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
        initState();
        choseArea("${register.p_area}");
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
        //日历
        laydate.render({
            elem:'#test3'
        });
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "register/" + ($("#key").val()==""?"add":"update") + ".do";
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


    });

    //关闭窗口
    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${register.code}"=="1"){
            $("#form-button").show();
        }
    }
    function initState(){
        $("#st").val("${register.p_category}");
        $("#indus").val("${register.p_industry}");
        $("#state").val("${register.state}");
    }

    //根据市获取所属区
        function choseArea(val){
            var str='<option value="">请选择</option>';
            var c_name=$("#cty").val();//获取市名称
            $.ajax({
                url:"province/area.do",
                data:{
                    city_name:c_name,
                },
                dataType:'json',
                type: "post",
                success:function(d){
                    for(var i=0;i<d.length;i++){
                        str+='<option value="'+d[i].county_name+'">'+d[i].county_name+'</option>';
                    }
                    $("#ops").html(str);
                    if(val){
                        $("#ops").val(val);
                        layui.form.render('select');
                    }else{
                        layui.form.render('select');
                    }

                }
            })

    }
</script>
</html>