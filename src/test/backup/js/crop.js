/**
 * 初始化
 * 生产基地产品的js(取代了product.js)
 * */

$(function() {
    //获取查询参数
    var param = main.getUrlString("param");
    //分页查询
    findPage(param);
    //绑定按钮事件
    searchBtnFn();
    //绑定事件:返回顶部
    main.backTopFn();
    //绑定事件:二维码
    main.picCodeFn();
});

//分页总数
var page_count = 0;
//分页查询
function findPage(param,page,limit){
    //初始化查询框内容
    $(".search-mod .search-input").val(param);
    //请求数据
    $.ajax({
        type: "post",
        dataType: 'JSON',
        //查询路径
        url: BaseUrl + "crop/list.do",
        //查询参数
        data: {
            "crop_name":param,
            "page":page, //当前页数
            "limit":limit, //分页大小
        },
        success: function (result) {
            page_count = result.count; //总条数
            if(page_count>0){
                $("#itemList").html("");
                //组装查询结果Html
                for(var i=0;i<result.data.length;i++){
                    if(result.data[i].crop_img===null){
                        createMyHtmlData(result.data[i])
                        $("#itemList").append($("#search-show-list").html());
                    }else{
                        createMyHtmlData(result.data[i])
                        var len=result.data[i].crop_img.indexOf(",");
                        var url=imgPath+result.data[i].crop_img.substring(0, len)
                        $("#search-show-list .items  #img2").attr("src",url);
                        $("#itemList").append($("#search-show-list").html());
                    }

                }
            }else{
                $("#itemList").html("<span class='pText'>没有找到符合条件的结果！</span>");
                $("#itemList").attr("class","row searchPrompt");
            }

            //初始化分页
            if(!(page||limit)){
                //分页控件
                findListPageFoot();
            }
        },
        error: function (error) {
            $("#itemList").html("<span class='pText'>系统连接异常！</span>");
            $("#itemList").attr("class","row searchPrompt");
        }
    });
}

//分页控件
function findListPageFoot(){
    var laypage = layui.laypage;
    console.log("page_count:"+page_count);
    //执行一个laypage实例
    laypage.render({
        elem: 'findListPageFoot' //注意，这里的 test1 是 ID，不用加 # 号
        ,count: page_count //数据总数，从服务端得到
        ,jump: function(obj, first){
            //obj包含了当前分页的所有参数，比如：
            console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
            console.log(obj.limit); //得到每页显示的条数
            //首次不执行
            if(!first){
                var param = main.getUrlString("param");
                //alert(obj.curr);
                findPage(param,obj.curr,obj.limit);
            }
        }
    });
}

// 组装数据
function createMyHtmlData(res) {
    $("#search-show-list").find(".hniois-data").each(function () {
        //清空数值
        $(this).html("");
        //赋值
        $(this).html(res[$(this).attr("name")]);
    })
}

//绑定按钮事件
function searchBtnFn(){
    var sBtnPc = $(".pc-search").find(".sBtn");
    var sBtnApp = $(".app-search-2").find(".sBtn");

    //绑定回车事件
    $(".pc-search .search-input").focus(function (){
        $(document).off("keyup");
        $(document).on("keyup", function (event){
            if (event.keyCode == 13) {
                searchAction("pc");
            }
        });
    });

    $(".pc-search .search-input").blur(function (){
        $(document).off("keyup");
    });

    sBtnPc.on("click", function(){
        searchAction("pc");
    });

    sBtnApp.on("click", function(){
        searchAction("app");
    });

    function searchAction (dev){
        var inputVal;

        if (dev === "pc"){
            inputVal = $(".pc-search").find(".search-input").val();
        } else {
            inputVal = $(".app-search-2").find(".search-input").val();
        }

        if(inputVal == ""){
            alert("产品名不能为空！");
        } else {
            window.location.href = "product.html?param=" + inputVal;
        }
    }
}

