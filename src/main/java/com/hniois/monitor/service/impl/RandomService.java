package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.RandomDao;
import com.hniois.monitor.entity.ScanRandom;
import com.hniois.monitor.service.RandomManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("randomService")
public class RandomService extends ServiceSupport<ScanRandom,RandomDao> implements RandomManage {

   @Resource(name="randomDaoImpl")
    @Override
    public void setDao(RandomDao dao) {
        this.dao=dao;
    }
}
