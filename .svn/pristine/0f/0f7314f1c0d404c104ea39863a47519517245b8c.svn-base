package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.CityDao;
import com.hniois.monitor.entity.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("cityDaoImpl")
public class CityDaoImpl implements CityDao {

    @Autowired
    private DaoSupport dao;

    private String mapper="CityMapper";

    @Override
    public void save(City e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<City> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(City e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(City e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(City e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(City e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public City find(City e) throws Exception {
        return (City)dao.find(mapper+".find",e);
    }

    @Override
    public List<City> findList(City e) throws Exception {
        return  (List<City> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(City e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(City e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

    @Override
    public List<City> findCitys(City e) throws Exception {
        return (List<City> )dao.findList(mapper+".findCity",e);
    }

    @Override
    public List<City> findArea(City e) throws Exception {
        return (List<City> )dao.findList(mapper+".findArea",e);
    }

    @Override
    public List<City> findNum(City e) throws Exception {
        return (List<City> )dao.findList(mapper+".findNum",e);
    }
}
