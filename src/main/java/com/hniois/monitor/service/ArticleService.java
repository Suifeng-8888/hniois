package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Article;

import java.util.List;

/**
 * Create By javaMan
 * 2018/9/13  15:12
 */
public interface ArticleService extends Service<Article> {
    List<Article> articleWeb(Article article) throws Exception;
}
