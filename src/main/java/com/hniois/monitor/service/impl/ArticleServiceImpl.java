package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.ArticleDao;
import com.hniois.monitor.entity.Article;
import com.hniois.monitor.service.ArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/9/13  15:25
 */
@Service(value = "articleService")
public class ArticleServiceImpl extends ServiceSupport<Article, ArticleDao> implements ArticleService {

    @Resource(name = "articleDao")
    @Override
    public void setDao(ArticleDao dao) {
        this.dao = dao;
    }

    /**
     * web 端 文章  前三条 时间排序
     * @param article
     * @return
     * @throws Exception
     */
    @Override
    public List<Article> articleWeb(Article article) throws Exception {
        return dao.articleWeb(article);
    }
}
