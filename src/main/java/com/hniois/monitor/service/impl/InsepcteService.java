package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.InspectDao;
import com.hniois.monitor.entity.Inspect;
import com.hniois.monitor.service.InspectManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("inspectService")
public class InsepcteService extends ServiceSupport<Inspect,InspectDao> implements InspectManage {

    @Resource(name="inspectDaoImpl")
    @Override
    public void setDao(InspectDao dao) {
        this.dao=dao;
    }
}
