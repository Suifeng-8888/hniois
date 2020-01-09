package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.RegisterDao;
import com.hniois.monitor.entity.Register;
import com.hniois.monitor.service.RegisterManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("registerService")
public class RegisterService extends ServiceSupport<Register,RegisterDao> implements RegisterManage {

    @Resource(name="registerDaoImpl")
    @Override
    public void setDao(RegisterDao dao) {
        this.dao=dao;
    }
}
