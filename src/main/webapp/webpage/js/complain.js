layui.use(["form"], function () {
    var form = layui.form;
    form.on("submit(formSave)", function (data) {
        var url = BaseUrl + "complain/save";
        var tempUrl = BaseUrl + "complain/exist";
        var scode = $("#source_code").val();
        //验证当前输入的追溯码是否存在
        $.ajax({
            url:tempUrl ,
            data: {
                source_code:scode,
            },
            type: "post",
            dataType: "json",
            success: function (result) {
                if(result > 0){
                    subMit(url,data);
                } else {
                    alert("追溯码不存在,请输入正确追溯码....");
                }
            },
            error: function () {
                alert("系统异常....");
            }
        });
        return false;
    });
});

function subMit(url,data){
    $.ajax({
        url: url,
        data: data.field,
        type: "post",
        dataType: "json",
        success: function (result) {
            if(result.code == 0) {
                setTimeout(function () {
                    window.location.href = "index.html";
                },1500);
            }
            layer.msg(result.msg);
        }
    });
}