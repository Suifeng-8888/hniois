package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.ComplainDao;
import com.hniois.monitor.entity.Complain;
import com.hniois.monitor.service.ComplainService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Create By javaMan
 * 2018/8/28  14:39
 * 投诉建议Service
 */
@Service(value = "complainService")
public class ComplainServiceImpl extends ServiceSupport<Complain, ComplainDao> implements ComplainService {


    @Resource(name = "complainDao")
    @Override
    public void setDao(ComplainDao dao) {
        this.dao = dao;
    }

    @Override
    public List<Map<String, Object>> statistics() throws Exception {
        return dao.statistics();
    }

    @Override
    public List<Complain> warnAndAdvice() throws Exception {
        return dao.warnAndAdvice();
    }
}
