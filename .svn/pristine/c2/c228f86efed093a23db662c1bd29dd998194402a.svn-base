//   pc端追溯码搜索
function codeAjax(code) {
    $.ajax({
        url: BaseUrl + "complain/exist" ,
        data: {
            source_code: code,
        },
        type: "post",
        dataType: "json",
        success: function (result) {
            if(result > 0){
                localStorage.setItem("code",code);
                window.location.href = webPath + "qrCode.html?reviewCode=" + code;
            } else {
                alert("追溯码不存在,请输入正确追溯码....");
            }
        },
        error: function () {
            alert("系统异常....");
        }
    });
}

$("#search_code").click(function () {
    var code = $("#code").val().trim();
    if (code.length == 17) {
        codeAjax(code);
    } else {
        alert("请输入17位产品追溯码！");
    }
});

$('#code').bind('keypress',function(event){
    if(event.keyCode == "13") {
        var code = $("#code").val().trim();
        if(code.length == 17) {
            codeAjax(code);
        } else {
            alert("请输入17位产品追溯码！");
        }
    }
});