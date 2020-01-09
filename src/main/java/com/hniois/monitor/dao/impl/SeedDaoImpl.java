package com.hniois.monitor.dao.impl;


import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.SeedDao;
import com.hniois.monitor.entity.Seed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *  Seed DaoImpl
 */
@Repository("seedDaoImpl")
public class SeedDaoImpl implements SeedDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "SeedMapper";

    @Override
    public void save(Seed e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Seed> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Seed e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Seed e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Seed e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Seed e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Seed find(Seed e) throws Exception {
        return (Seed)dao.find(mapper+".find",e);
    }

    @Override
    public List<Seed> findList(Seed e) throws Exception {
        return  (List<Seed> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Seed e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Seed e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

}
