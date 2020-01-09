package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.City;

import java.util.List;

public interface CityManage extends Service<City> {

    //通过省份查询所属市
    List<City> findCitys(City e)throws Exception;

    //通过市查询所属区
    List<City> findArea(City e) throws Exception;

    //通过市查询下辖各区生产基地个数
    List<City> findNum(City e) throws Exception;
}
