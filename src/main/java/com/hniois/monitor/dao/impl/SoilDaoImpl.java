package com.hniois.monitor.dao.impl;


import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.SoilDao;
import com.hniois.monitor.entity.Soil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("soilDaoImpl")
public class SoilDaoImpl implements SoilDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "SoilMapper";

    @Override
    public void save(Soil e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Soil> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Soil e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Soil e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Soil e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Soil e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Soil find(Soil e) throws Exception {
        return (Soil)dao.find(mapper+".find",e);
    }

    @Override
    public List<Soil> findList(Soil e) throws Exception {
        return  (List<Soil> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Soil e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Soil e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
