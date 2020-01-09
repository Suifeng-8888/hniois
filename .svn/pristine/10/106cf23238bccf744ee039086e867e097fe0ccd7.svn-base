package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.TransDao;
import com.hniois.trace.entity.Transport;
import com.hniois.trace.service.TransManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("transService")
public class TransService extends ServiceSupport<Transport,TransDao> implements TransManage {

    @Resource(name="transDaoImpl")

    @Override
    public void setDao(TransDao dao) {
        this.dao=dao;
    }

}
