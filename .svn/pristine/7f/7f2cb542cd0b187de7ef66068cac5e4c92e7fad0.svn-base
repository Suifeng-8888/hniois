package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.VaccineDao;
import com.hniois.monitor.entity.Vaccine;
import com.hniois.monitor.service.VaccineManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("vaccineService")
public class VaccineService extends ServiceSupport<Vaccine,VaccineDao> implements VaccineManage {

    @Resource(name="vaccineDaoImpl")
    @Override
    public void setDao(VaccineDao dao) {
        this.dao=dao;
    }
}
