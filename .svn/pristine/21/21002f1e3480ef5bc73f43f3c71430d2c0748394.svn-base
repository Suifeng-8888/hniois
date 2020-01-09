package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.ButcherDao;
import com.hniois.monitor.entity.Butcher;
import com.hniois.monitor.service.ButcherManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("butcherService")
public class ButcherService extends ServiceSupport<Butcher,ButcherDao> implements ButcherManage {

   @Resource(name="butcherDaoImpl")
    @Override
    public void setDao(ButcherDao dao) {
        this.dao=dao;
    }
}
