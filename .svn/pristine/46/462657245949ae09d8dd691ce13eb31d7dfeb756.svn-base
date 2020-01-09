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
    <title>检测报告照片</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <style>
        #upload_img_list {
            margin: 10px 10px 0px 10px;
        }
        #upload_img_list dd {
            position: relative;
            margin: 0 10px 10px 0;
            float: left;
        }
        #upload_img_list .operate {
            position: absolute;
            top: 0;
            right: 0;
            z-index: 1;
        }
        #upload_img_list .operate i {
            cursor: pointer;
            background: #2F4056;
            padding: 2px;
            width: 20px;
            line-height: 20px;
            text-align: center;
            color: #fff;
            margin-left: 2px;
            float: left;
            /*透明属性*/
            filter: alpha(opacity=80);
            -moz-opacity: .8;
            -khtml-opacity: .8;
            opacity: .8;
        }
        #upload_img_list dd .img {
            height: 150px;
            width: 200px;
        }
        #uploadFile{
            margin: 10px 10px 0px 10px;
        }
    </style>
</head>
<body>
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="rid" id="key" value="${report.rid}">

    <div >
        <button type="button" class="layui-btn " id="uploadFile">上传图片</button>
        <div id="upload_img_list">

            <%--<dd class="item_img" id="img_111">--%>
                <%--<div class="operate">--%>
                    <%--<i class="toleft layui-icon"></i>--%>
                    <%--<i class="toright layui-icon"></i>--%>
                    <%--<i onclick="delete_IMG('img_111')" class="close layui-icon"></i>--%>
                <%--</div>--%>
                <%--<img src="attached/file/20180828/D.jpg" class="img">--%>
                <%--<input name="imgs" value="attached/file/20180828/D.jpg" type="hidden">--%>
            <%--</dd>--%>

        </div>
    </div>

</form>

<%--文件下载--%>
<form id="file-form" action="file/download.do" method="post">
    <input name="path" type="hidden">
</form>
<%--检测报告图片信息--%>
<div style="display: none" id="report_img">${report.report_img}</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);

    //上传参数设定
    var upurl = "/file/upload";//上传图片地址
    var duotu = true;//是否为多图上传true false

    $(function () {
        //初始化图片
        init_IMG();
        //多图上传变换左右位置
        change_IMG_left_right();
    });

    //layui模块加载 order-2
    layui.use(['layer','upload'], function() {
        var layer = layui.layer,
            upload = layui.upload;

        //选完文件后不自动上传
        upload.render({
            elem: '#uploadFile',
            url: upurl,
            accept:"images",
            acceptMime: 'image/*',
            multiple: duotu,
            number:10,
            done: function(res,index,upload) {
                var url = res.url[0];
                console.log("上传图片" + index +" : "+ url);
                add_IMG(index,url,"new");
            },
            allDone: function(obj){ //当文件全部被提交后，才触发
                var msg = "上传"+obj.successful+"张图片成功";
                updateSchoolData(msg);
            }
        });

    });

    //关闭窗口
    function closeWin(){
        parent.layer.close(index);
    }

    //初始化图片
    function init_IMG(){
        var img_hmtl = $("#report_img").html()||"";
        var imgs = img_hmtl.split(",");
        for(var i=0;i<imgs.length;i++){
            if($.trim(imgs[i])){
                add_IMG(i,imgs[i],"old");
            }
        }
    }

    /**
     * 图片拼接
     * @param idnex 图片下标
     * @param url 图片路径
     * @param cls img_old:原始图片/ img_new新增图片
     * */
    function add_IMG(index,url,cls){
        $('#upload_img_list').append(
            '<dd class="item_img" id="img_' + index + '">' +
            '<div class="operate"><i class="toleft layui-icon"></i>' +
            '<i class="toright layui-icon"></i>' +
            // '<i class="fa fa-arrow-down" onclick=downLoad("'+url+'")></i>' +
            '<i class="close layui-icon" onclick=delete_IMG("' + index + '","'+url+'") ></i>' +
            '<i class="layui-icon layui-icon-download-circle" onclick=downLoad("'+url+'")>&#xe601</i>'+
            '</div>' +
            '<img src="' + url + '" class="img" >' +
            '<input type="hidden" class="img_' + cls + '" name="imgs" value="' + url + '" /></dd>');
    }

    //删除图片
    function delete_IMG(divs,url) {
        $.ajax({
            url: "report/update.do",
            data: {
                rid:$("#key").val(),
                report_path:url //删除路径
            },
            type: "post",
            dataType:'json',
            success: function(data){
                if(data.state=="ok"){
                    $("#img_"+divs).remove();
                    $.ajax({
                        url: "file/delete.do",
                        data: {
                            path:url
                        },
                        type: "post",
                        dataType:'json',
                        success: function(data){
                            if(data.state=="ok"){

                            }else{
                                //错误信息
                                layer.msg(data.msg);
                            }
                        }
                    });
                }else{
                    //错误信息
                    layer.msg(data.msg);
                }
            }
        });


    }

    //图片下载
    function downLoad(url){
        $("#file-form input[name='path']").val(url);
        $("#file-form").submit();
    }

    //多图上传变换左右位置
    function change_IMG_left_right(){
        $(".toleft").live("click", function() {
            var item = $(this).parent().parent(".item_img");
            var item_left = item.prev(".item_img");//item_img 前一个同胞元素
            if ($("#upload_img_list").children(".item_img").length >= 2) {
                if (item_left.length == 0) {
                    item.insertAfter($("#upload_img_list").children(".item_img:last"));
                } else {
                    item.insertBefore(item_left);
                }
                updateSchoolData("图片左侧移动成功");
            }
        });
        $(".toright").live("click", function() {
            var item = $(this).parent().parent(".item_img");
            var item_right = item.next(".item_img");
            if ($("#upload_img_list").children(".item_img").length >= 2) {
                if (item_right.length == 0) {
                    item.insertBefore($("#upload_img_list").children(".item_img:first"));
                } else {
                    item.insertAfter(item_right);
                }
                updateSchoolData("图片右侧移动成功");
            }
        });
    }

    //修改学校图片信息
    function updateSchoolData(msg){
        var imgs  = "";
        $("input[name='imgs']").each(function () {
            imgs += $(this).val() + ",";
        });
        $.ajax({
            url: "report/update.do",
            data: {
                rid:$("#key").val(),
                report_img:imgs
            },
            type: "post",
            dataType:'json',
            success: function(data){
                if(data.state=="ok"){
                    layer.msg(msg);
                }else{
                    //错误信息
                    layer.msg(data.msg);
                }
            }
        });
    }

</script>
</html>