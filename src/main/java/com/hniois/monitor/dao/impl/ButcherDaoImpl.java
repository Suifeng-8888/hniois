package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.ButcherDao;
import com.hniois.monitor.entity.Butcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("butcherDaoImpl")
public class ButcherDaoImpl implements ButcherDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "ButcherMapper";
    @Override
    public void save(Butcher e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Butcher> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Butcher e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Butcher e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Butcher e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Butcher e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Butcher find(Butcher e) throws Exception {
        return (Butcher)dao.find(mapper+".find",e);
    }

    @Override
    public List<Butcher> findList(Butcher e) throws Exception {
        return  (List<Butcher> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Butcher e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Butcher e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
