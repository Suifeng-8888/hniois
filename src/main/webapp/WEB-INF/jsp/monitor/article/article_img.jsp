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
    <title>文章配图</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <style>
        #upload_img {
            margin: 20px;
        }
    </style>
</head>
<body>
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${article.id}">
    <div id="upload_img">
        <button type="button" class="layui-btn " id="optFile">选择图片</button>
        <button type="button" class="layui-btn " id="uploadFile">上传图片</button>
        <img src="${article.picture}" style="height: 300px; width: 550px; margin-top: 10px;">
    </div>
</form>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>

    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);

    //layui模块加载 order-2
    layui.use(['layer','upload'], function() {
        var upload = layui.upload;
        upload.render({
            elem: '#optFile',
            url: "/file/upload",
            auto: false,
            bindAction: '#uploadFile',
            accept:"images",
            acceptMime: 'image/*',
            number:10,
            choose: function (obj) {
                obj.preview(function(index, file, result){
                    $('#upload_img img').attr('src', result); //图片链接（base64）
                });
            },
            done: function(res){ //上传后的回调
                layer.msg("图片上传成功。");
                updateSchoolData(res);
            },
            error: function () {
                layer.msg("上传文件异常。");
            }
        });
    });

    function updateSchoolData(res){
        var url =  res.url[0];
        $.ajax({
            url: "article/update.do",
            data: {
                id:$("#key").val(),
                picture:url
            },
            type: "post",
            dataType:'json',
            success: function(data){
                if(data.state=="ok"){
                    //表单刷新
                    parent.formReload();
                    //提示信息
                    parent.layer.msg("图片上传成功。");
                    //关闭窗口
                    closeWin();
                }else{
                    layer.msg("上传失败");
                }
            }
        });
    }
    //关闭窗口
    function closeWin(){
        parent.layer.close(index);
    }

</script>
</body>
</html>