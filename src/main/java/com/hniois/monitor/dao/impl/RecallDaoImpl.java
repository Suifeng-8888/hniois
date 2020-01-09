package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.RecallDao;
import com.hniois.monitor.entity.Recall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By javaMan
 * 2018/10/15  14:26
 * 产品召回daoImpl
 */
@Repository(value = "recallDao")
public class RecallDaoImpl implements RecallDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "recallMapper";

    @Override
    public void save(Recall e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Recall> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Recall e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Recall e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Recall e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Recall e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Recall find(Recall e) throws Exception {
        return (Recall)dao.find(mapper+".find",e);
    }

    @Override
    public List<Recall> findList(Recall e) throws Exception {
        return  (List<Recall> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Recall e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Recall e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
