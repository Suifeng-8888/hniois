package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.RandomDao;
import com.hniois.monitor.entity.ScanRandom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("randomDaoImpl")
public class RandomDaoImpl implements RandomDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "RandomMapper";

    @Override
    public void save(ScanRandom e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<ScanRandom> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(ScanRandom e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(ScanRandom e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(ScanRandom e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(ScanRandom e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public ScanRandom find(ScanRandom e) throws Exception {
        return (ScanRandom)dao.find(mapper+".find",e);
    }

    @Override
    public List<ScanRandom> findList(ScanRandom e) throws Exception {
        return  (List<ScanRandom> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(ScanRandom e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(ScanRandom e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
