package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.OutfitDao;
import com.hniois.monitor.entity.Outfit;
import com.hniois.monitor.service.OutfitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/8/24  10:38
 * 监管部门 Service
 */
@Service(value = "outfitService")
public class OutfitServiceImpl extends ServiceSupport<Outfit, OutfitDao> implements OutfitService{

    @Resource(name = "outfitDao")
    @Override
    public void setDao(OutfitDao dao) {
        this.dao = dao;
    }
}
