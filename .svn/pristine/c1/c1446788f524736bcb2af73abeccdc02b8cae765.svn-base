/*
 * main.js
 *
 * © Jee 2017/11/26
*/


var main = {
	//获取地址栏参数
	getUrlString : function(name){
		// 用该属性获取页面 URL 地址从问号 (?) 开始的 URL（查询部分）
		var url = window.location.search;
		// 正则筛选地址栏
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		// 匹配目标参数
		var result = url.substr(1).match(reg);
		//返回参数值
		return result ? decodeURIComponent(result[2]) : null;
	},
    getUrlString2 : function(id){
        // 用该属性获取页面 URL 地址从问号 (?) 开始的 URL（查询部分）
        var url = window.location.search;
        // 正则筛选地址栏
        var reg = new RegExp("(^|&)"+ id +"=([^&]*)(&|$)");
        // 匹配目标参数
        var result = url.substr(1).match(reg);
        //返回参数值
        return result ? decodeURIComponent(result[2]) : null;
    },
    /* 
    * url 目标url 
    * arg 需要替换的参数名称 
    * arg_val 替换后的参数的值 
    * return url 参数替换后的url 
    */ 
    changeURLArg : function(url,arg,arg_val){ 
        var pattern=arg+'=([^&]*)'; 
        var replaceText=arg+'='+arg_val; 
        if(url.match(pattern)){ 
            var tmp='/('+ arg+'=)([^&]*)/gi'; 
            tmp=url.replace(eval(tmp),replaceText); 
            return tmp; 
        }else{ 
            if(url.match('[\?]')){ 
                return url+'&'+replaceText; 
            }else{ 
                return url+'?'+replaceText; 
            } 
        } 
        return url+'\n'+arg+'\n'+arg_val; 
    },
	
	//返回顶部
	backTopFn : function(){
		$(window).scroll(function(){
			if($(window).scrollTop() > 100){
				$("#back-to-top").fadeIn(1500);
			} else {
				$("#back-to-top").fadeOut(1500);
			}
		});

		$("#back-to-top").click(function(){
			$('body,html').animate({scrollTop:0},800);
			return false;
		});		
	},
	
	//二位码 隐藏/显示
	picCodeFn : function(){
		$(".picCode .small").mouseover(function(){
			$(this).next().show();	
		}).mouseout(function(){
			$(this).next().hide();	
		});
	},
	
	goback: function(){
		var u = navigator.userAgent;
		if(u.indexOf("iosapp/zc-sy")>0){
			JsCallIosGoBack();
		}else{
			window.location.href = "index.html";
		}
	},
	
	iosAction:function(){
		 var ua = navigator.userAgent;
		 if(ua.indexOf("IOS-QDAPP")>0){
			 console.info("IOS-QDAPP");
			$(".header").hide();
			$(".app-search").hide();
			$(".appShow").remove();
		 }
//		 else{
//			 wxConfig();
//		 }
	}
};
