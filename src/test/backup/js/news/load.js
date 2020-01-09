$(function(){
    $("img.lazy").lazyload({effect: "fadeIn"});

    $("#J-nav-search").click(function(){
        $(".scbar").slideToggle();
    });

    $("#search").click(function(){

        var keyword=$("#scbar_txt").val();
        if (keyword=="" || keyword==undefined){
            layer.open({
                content: '请先输入关键词再进行搜索'
                ,btn: '我知道了'
            });
            return false;
        }

        if ($('#swz').is(':checked')==true){
            location.href="/search/news?keyword="+keyword
            return false;
        }
        if ($('#sgs').is(':checked')==true){
            location.href="/search/zl?keyword="+keyword
            return false;
        }
        if ($('#sjm').is(':checked')==true){
            location.href="/search/jm?keyword="+keyword
            return false;
        }

        return false;
    });
});

var _hmt = _hmt || [];
(function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?ce0293b8a0e89b21499ab9863dbfcd8d";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);

    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https') {
        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
    }
    else {
        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
    }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
