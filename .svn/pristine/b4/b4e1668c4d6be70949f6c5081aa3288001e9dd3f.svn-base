package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.HarvestDao;
import com.hniois.monitor.entity.Harvest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("harvestDaoImpl")
public class HarvestDaoImpl implements HarvestDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "HarvestMapper";

    @Override
    public void save(Harvest e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Harvest> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Harvest e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Harvest e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Harvest e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Harvest e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Harvest find(Harvest e) throws Exception {
        return (Harvest)dao.find(mapper+".find",e);
    }

    @Override
    public List<Harvest> findList(Harvest e) throws Exception {
        return  (List<Harvest> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Harvest e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Harvest e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
