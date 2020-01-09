package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.RecallDao;
import com.hniois.monitor.entity.Recall;
import com.hniois.monitor.service.RecallService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/10/15  14:35
 * 产品召回ServiceImpl
 */
@Service(value = "recallService")
public class RecallServiceImpl extends ServiceSupport<Recall, RecallDao> implements RecallService {

    @Override
    @Resource(name = "recallDao")
    public void setDao(RecallDao dao) {
        this.dao = dao;
    }
}
