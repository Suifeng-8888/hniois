//   pc端追溯码搜索
function codeAjax(code) {
    // alert(code);
    // $.ajax({
    //
    // });
   window.location.href(rootPath + "qrCode.html");
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