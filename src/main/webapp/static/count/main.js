bathpath = 'http://192.168.88.88:7777/api'
// 在首页设置一个全局变量为超级管理员公司的id
var superCompanyId=123;
$.ajaxSetup({
    headers: {
        "sessionToken": getSessionToken()
        //"X-CAF-Authorization-Token": getGatewayToken()
    },
    cache: true, //close AJAX cache
    error:function(jqXHR, textStatus, errorMsg){ // 出错时默认的处理函数
        console.log(errorMsg)
        swal({
            title: '会话超时，请重新登陆，亲~',
            text: "" || "",
            type: "warning"
        }, function() {
            $.cookie('user', '', {expires: -1}); // 删除 cookie
            $.cookie('sessionToken', '', {expires: -1}); // 删除 sessionToken
            window.location.href = "login.html"
        })
    }
});
function getSessionToken(){
    $.cookie('sessionToken')
    return   $.cookie('sessionToken');
}
function ajaxdatacheck(data) {
    if (data.code == -1) {
        toastr.warning('会话超时，请重新登陆', '亲~', {
            "positionClass": "toast-top-right",
            "timeOut": 3000,
            "progressBar": true
        })
        window.setTimeout('window.location.href="login.html"', 3000)
        return false
    } else if (data.code == -2) {
        swal({
            title: '账户状态异常，请联系客服',

            text: data.errorMsg || data.msg,
            type: "warning"
        }, function() {
            window.location.href = "login.html"
        })
        return false
    } else if (data.code == -3) {
        loadPage('home.html', '主页|fa-home|home.html')
        $.cookie('unlockSafePwdVal', false)
        swal({
            title: '您无权访问,系统将锁定,重新进入需要输入登录密码',
            text: data.errorMsg || data.msg,
            type: "warning"
        }, function() {
            window.location.href = "lockscreen.html"
        })
        return false
    } else if (data.code == -4) {
        $('body').empty().html('<h1>' + data.errorMsg || data.msg + '</h1><p><a href="provider.html">重试</a></p>')
        return false
    }
    return true
}

function setNavBar(breadcrumb) {
    $('#menu_name').html(breadcrumb)
}

function loadPage(page, breadcrumb) {

    $('#main-body').load(page, function(response, status, xhr) {
        if (status == "error") {
            var msg = "loadPage " + page + ", but there was an error: "
            $('#main-body').html(msg + xhr.status + " " + xhr.statusText)
        }

        setNavBar(breadcrumb)
        $('#main-body').show()
        $('#main-body').removeClass('animated').removeClass('bounce').addClass('animated')
            .addClass('fadeInRight')

        /*
         * bounce ,flash ,pulse ,rubberBand ,shake ,swing ,tada ,wobble ,bounceIn
         * ,bounceInDown ,bounceInLeft ,bounceInRight ,bounceInUp ,bounceOut
         * ,bounceOutDown ,bounceOutLeft ,bounceOutRight ,bounceOutUp ,fadeIn
         * ,fadeInDown ,fadeInDownBig ,fadeInLeft ,fadeInLeftBig ,fadeInRight
         * ,fadeInRightBig ,fadeInUp ,fadeInUpBig ,fadeOut ,fadeOutDown
         * ,fadeOutDownBig ,fadeOutLeft ,fadeOutLeftBig ,fadeOutRight
         * ,fadeOutRightBig ,fadeOutUp ,fadeOutUpBig ,flip ,flipInX ,flipInY
         * ,flipOutX ,flipOutY ,lightSpeedIn ,lightSpeedOut ,rotateIn
         * ,rotateInDownLeft ,rotateInDownRight ,rotateInUpLeft ,rotateInUpRight
         * ,rotateOut ,rotateOutDownLeft ,rotateOutDownRight ,rotateOutUpLeft
         * ,rotateOutUpRight ,slideInDown ,slideInLeft ,slideInRight ,slideOutLeft
         * ,slideOutRight ,slideOutUp ,hinge ,rollIn ,rollOut
         */
    })
}

if ($.fn.dataTable != undefined) {
    $.fn.dataTable.defaults.oLanguage = {
        "sProcessing": "处理中...",
        "sLengthMenu": "_MENU_",
        "sZeroRecords": "没有匹配结果",
        "sInfo": "第 _START_ 至 _END_ 项，共 _TOTAL_ 项",
        "sInfoEmpty": "第 0 至 0 项，共 0 项",
        "sInfoFiltered": " ( 过滤之前 _MAX_ 项 )",
        "sInfoPostFix": "",
        "sSearch": "搜索:",
        "sUrl": "",
        "sEmptyTable": "表中数据为空",
        "sLoadingRecords": "载入中...",
        "sInfoThousands": ",",
        "sThousands": ",",
        "oPaginate": {
            "sFirst": "首页",
            "sPrevious": "上页",
            "sNext": "下页",
            "sLast": "末页"
        },
        "oAria": {
            "sSortAscending": ": 以升序排列此列",
            "sSortDescending": ": 以降序排列此列"
        }
    }
}

// $.extend($.validator.messages, {
//     required: "这是必填字段",
//     remote: "请修正此字段",
//     email: "请输入有效的电子邮件地址",
//     url: "请输入有效的网址",
//     date: "请输入有效的日期",
//     dateISO: "请输入有效的日期 (YYYY-MM-DD)",
//     number: "请输入有效的数字",
//     digits: "只能输入数字",
//     creditcard: "请输入有效的信用卡号码",
//     equalTo: "你的输入不相同",
//     extension: "请输入有效的后缀",
//     maxlength: $.validator.format("最多可以输入 {0} 个字符"),
//     minlength: $.validator.format("最少要输入 {0} 个字符"),
//     rangelength: $.validator.format("请输入长度在 {0} 到 {1} 之间的字符串"),
//     range: $.validator.format("请输入范围在 {0} 到 {1} 之间的数值"),
//     max: $.validator.format("请输入不大于 {0} 的数值"),
//     min: $.validator.format("请输入不小于 {0} 的数值")
// })


function datetimeFormat(longTypeDate) {
    var datetimeType = "";
    var date = new Date();
    date.setTime(longTypeDate);
    datetimeType += date.getFullYear(); //年
    datetimeType += "-" + getMonth(date); //月
    datetimeType += "-" + getDay(date); //日
    return datetimeType;
}

function datetimeFormat_1(longTypeDate) {
    var datetimeType = "";
    var date = new Date();
    date.setTime(longTypeDate);
    datetimeType += date.getFullYear(); //年
    datetimeType += "-" + getMonth(date); //月
    datetimeType += "-" + getDay(date); //日
    datetimeType += "&nbsp;&nbsp;" + getHours(date); //时
    datetimeType += ":" + getMinutes(date); //分
    datetimeType += ":" + getSeconds(date); //分
    return datetimeType;
}

function datetimeFormat_2(longTypeDate) {
    var datetimeType = "";
    var date = new Date();
    date.setTime(longTypeDate);
    datetimeType = date.getFullYear() + "-" + getMonth(date) + "-" + getDay(date) + "&nbsp;" + getHours(date) + ":" + getMinutes(date) + ":" + getSeconds(date); //yyyy-MM-dd 00:00:00格式日期
    return datetimeType;
}


//返回 01-12 的月份值
function getMonth(date) {
    var month = "";
    month = date.getMonth() + 1; //getMonth()得到的月份是0-11
    if (month < 10) {
        month = "0" + month;
    }
    return month;
}
//返回01-30的日期
function getDay(date) {
    var day = "";
    day = date.getDate();
    if (day < 10) {
        day = "0" + day;
    }
    return day;
}
//返回小时
function getHours(date) {
    var hours = "";
    hours = date.getHours();
    if (hours < 10) {
        hours = "0" + hours;
    }
    return hours;
}
//返回分
function getMinutes(date) {
    var minute = "";
    minute = date.getMinutes();
    if (minute < 10) {
        minute = "0" + minute;
    }
    return minute;
}
//返回秒
function getSeconds(date) {
    var second = "";
    second = date.getSeconds();
    if (second < 10) {
        second = "0" + second;
    }
    return second;
}

//返回
pageindex=0;
function back(url,title,page){
    pageindex = page*10;
    loadPage(url,title);
};

 //获取表单参数
var DataDeal = {  
        formToJson: function (id) {
            var data=$(id).serialize();//获取值  
            data = decodeURIComponent(data,true);//防止中文乱码
            data=data.replace(/&/g,"\",\"");  
            data=data.replace(/=/g,"\":\"");  
            data="{\""+data+"\"}";  
            return JSON.parse(data);  
        },  
    };