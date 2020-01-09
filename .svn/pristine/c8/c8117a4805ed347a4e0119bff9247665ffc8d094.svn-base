/**
 * 初始化
 *
 * */

$(function() {
    //分页查询
    findPage();
    //绑定按钮事件
});

//分页总数
var page_count = 0;
//分页查询
function findPage(page,limit){
    //请求数据
    var limit2=5;
    $.ajax({
        type: "post",
        dataType: 'JSON',
        //查询路径
        url: BaseUrl + "article/list.do",
        //查询参数
        data: {
            "page":page, //当前页数
            "limit":limit2//分页大小
        },
        success: function (result) {
            page_count = result.count; //总条数
            if(page_count>0){
                $("#itemList").html("");
                //组装查询结果Html
                for(var i=0;i<result.data.length;i++){
                    createMyHtmlData(result.data[i]);
                    $("#itemList").append($("#search-show-list").html());
                }
            }else{
                $("#itemList").html("<span class='pText'>没有找到符合条件的结果！</span>");
                $("#itemList").attr("class","row searchPrompt");
            }
        },
        error: function (error) {
            $("#itemList").html("<span class='pText'>系统连接异常！</span>");
            $("#itemList").attr("class","row searchPrompt");
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

