package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.PoisonDao;
import com.hniois.monitor.entity.Poison;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("poisonDaoImpl")
public class PoisonDaoImpl implements PoisonDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "PoisonMapper";

    @Override
    public void save(Poison e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Poison> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Poison e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Poison e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Poison e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Poison e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Poison find(Poison e) throws Exception {
        return (Poison)dao.find(mapper+".find",e);
    }

    @Override
    public List<Poison> findList(Poison e) throws Exception {
        return  (List<Poison> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Poison e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Poison e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

}
