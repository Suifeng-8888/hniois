package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.SoilDao;
import com.hniois.monitor.entity.Soil;
import com.hniois.monitor.service.SoilManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("soilService")
public class SoilService extends ServiceSupport<Soil,SoilDao> implements SoilManage {

    @Resource(name="soilDaoImpl")
    @Override
    public void setDao(SoilDao dao) {
        this.dao=dao;
    }

}
