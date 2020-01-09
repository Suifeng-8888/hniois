package com.hniois.web.supervise;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Article;
import com.hniois.monitor.service.ArticleService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Create By javaMan
 * 2018/9/19  11:04
 */
@RestController
@RequestMapping(value = "/webService/article")
public class ArticleWebService extends BaseController {

    @Resource(name = "articleService")
    private ArticleService articleService;


    @RequestMapping(value = "/list")
    public String pageList(Article article) throws Exception {
        // 当前页
        int currPage = getThisPage(article.getPage());
        // 每页显示条数
        int limit = getThisLimit(article.getLimit());
        article.setOffset((currPage-1) * limit);
        article.setPageSize(limit);
        Page page = articleService.findPage(article);
        return JSON.toJSONString(page);
    }

    /**
     * 单篇文章详情
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Article getArticle(@PathVariable("id") Integer id) throws Exception {
        Article article = new Article();
        article.setId(id.toString());
        return articleService.find(article);
    }

    /**
     * 新闻公告  文章 List 列表
     * @param article
     * @return
     * @throws Exception
     */
//    @TODO     文章列表处理有待改进...  1,返回数据带有 Page对象(无用).2,全部取出发送前端数据量大
//     @TODO    改进 1,创建Dto数据传输对象. 2,定义返回List数据列表数量，需要更多动态再去获取

    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public List<Article> getArticleList(Article article) throws Exception {
       return articleService.findList(article);
   }

    /**
     * web 端 文章  前三条 时间排序
     * @return
     * @throws Exception
     */
   @RequestMapping(value = "/indexArt", method = RequestMethod.GET)
   public Map<String,Object> getArticleWebIndex() throws Exception {
        Map<String,Object> map = new HashMap<>();
        List<Article> list = articleService.articleWeb(new Article());
        map.put("articleList", list);
        return map;
   }
}
