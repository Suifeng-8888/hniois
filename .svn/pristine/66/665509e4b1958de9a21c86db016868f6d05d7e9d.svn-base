package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.CityDao;
import com.hniois.monitor.entity.City;
import com.hniois.monitor.service.CityManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("cityService")
public class CityService extends ServiceSupport<City,CityDao> implements CityManage {

    @Resource(name="cityDaoImpl")
    @Override
    public void setDao(CityDao dao) {
        this.dao=dao;
    }

    @Override
    public List<City> findCitys(City e) throws Exception {
        return dao.findCitys(e);
    }

    @Override
    public List<City> findArea(City e) throws Exception {
        return dao.findArea(e);
    }

    @Override
    public List<City> findNum(City e) throws Exception {
        return dao.findNum(e);
    }
}
