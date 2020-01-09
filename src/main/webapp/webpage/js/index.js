/*
 * index.js
 *
 * © Jee 2017/11/26
*/


var index = {
	//标签切换
	tagsFn : function() {
		var obj = $(".tags .tBtn");
		var input = $(".search-mod .search-input");

		obj.on("click", function() {
			var index = $(this),
				target = index.attr("data-target"),
				placeholder = index.attr("data-placeholder");

			obj.removeClass("on");
			index.addClass("on");
			input.attr("data-target", target);
			input.attr("placeholder", placeholder);
		});
	},

	//查询跳转
	searchLinksFn : function() {
		var sBtn = $(".search-mod .sBtn");
		
		$(".search-mod .search-input").focus(function (){
			$(document).on("keyup", function (event){
				if (event.keyCode == 13) {
					searchAction();
				}
			});				
		});
		
		$(".search-mod .search-input").blur(function (){
			$(document).off("keyup");
		});	
		
		sBtn.on("click", function(){
			searchAction();
		});
		
		function searchAction (){
			var target = $(".search-mod .search-input").attr("data-target");
			var inputVal = $(".search-mod .search-input").val();

			//跳转至匹配页面
			switch (target) {
				//追溯码
				case "1":
					if(inputVal == ""){
						alert("追溯码不能为空！");
					} else {
						// $.ajax({
						// 	type: "GET",
						// 	dataType: 'JSON',
						// 	url: config.APIUrl + "rest/v1/query/tracedata/query.do?tagSn=" + inputVal,
						// 	success: function (result) {
						// 		if(result.type == "CONNECTED"){
						// 			window.location.href = "traceCode.html?tagSn=" + inputVal;
						// 		} else {
						// 			window.location.href = "traceCodeList.html?tagSn=" + inputVal;
						// 		}
						// 	},
						// 	error: function (error) {
						// 		console.info("Data Error!");
						// 	}
						// });
                        window.location.href = "product.html?param=" + inputVal;
					}
					break;
				case "2":
					if(inputVal == ""){
						alert("条码不能为空！");
					} else {
						// window.location.href = "barCode.html?barcode=" + inputVal + "&step=1";
                        window.location.href = "product.html?param2=" + inputVal;
					}
					break;
				case "3":
					if(inputVal == ""){
						alert("品名不能为空！");
					} else {
						// window.location.href = "productsName.html?name=" + inputVal + "&step=1";
                        window.location.href = "product.html?param3=" + inputVal;
					}
					break;
			}			
		}
	},
	
	//banner高度
	bannerHFn : function() {
		var bodyW = $(window).width();
		var bodyH = $(window).height();
		var bannerH;
		
		if(bodyW <= "1366"){
			bannerH = eval(bodyH) - 326;
		} else {
			bannerH = eval(bodyH) - 629;
		}
		
		$(".home-banner").css("height", bannerH + "px");
	},
	
	//app-items高度
	appItemsHFn : function() {
		var bodyH = $(window).height();
		var headH = $(".header").height();
		var navH = $(".app-nav").height();
		var itemH = eval(bodyH - headH - navH) - 73;
		var itemsH = itemH / 3;

		$(".app-items").find(".items").css("height", itemsH + "px");		
	},
	
	//“我的”菜单事件
	mineFn : function() {
		var dom = $(".navigation .lists");
		
		$(document).on("click", function() {
			dom.hide();
		});
		
		$('#mine').on("click", function(e){
			if(dom.is(':hidden')){
				dom.show();
			} else {
				dom.hide();
			}
			e.stopPropagation();
		});
		
		$('#version').on("click", function() {
			alert("版本：v1.0");
		});
		
//		$('#zfjg').on("click", function() {
//			alert("正在建设, 即将完成");
//		});
	}
};


$(function() {
	index.tagsFn();
	index.searchLinksFn();
	index.bannerHFn();
	index.appItemsHFn();
	index.mineFn();

});


window.onresize = function() {
	index.bannerHFn();
	index.appItemsHFn();	
}