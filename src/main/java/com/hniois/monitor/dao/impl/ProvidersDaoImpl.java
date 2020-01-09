package com.hniois.monitor.dao.impl;


import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.ProvidersDao;
import com.hniois.monitor.entity.Providers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *  Providers DaoImpl
 */
@Repository("providersDaoImpl")
public class ProvidersDaoImpl implements ProvidersDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "ProvidersMapper";

    @Override
    public void save(Providers e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Providers> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Providers e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Providers e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Providers e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Providers e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Providers find(Providers e) throws Exception {
        return (Providers)dao.find(mapper+".find",e);
    }

    @Override
    public List<Providers> findList(Providers e) throws Exception {
        return  (List<Providers> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Providers e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Providers e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

}
