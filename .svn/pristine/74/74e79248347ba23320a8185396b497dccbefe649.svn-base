package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.GoodsDao;
import com.hniois.trace.entity.Goods;
import com.hniois.trace.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/11/28  16:07
 * 供应商产品 serviceImpl
 */
@Service("goodsService")
public class GoodsServiceImpl extends ServiceSupport<Goods,GoodsDao> implements GoodsService {
    @Resource(name = "goodsDao")
    @Override
    public void setDao(GoodsDao dao) {
        this.dao = dao;
    }
}
