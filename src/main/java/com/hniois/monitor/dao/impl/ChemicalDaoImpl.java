package com.hniois.monitor.dao.impl;


import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.ChemicalDao;
import com.hniois.monitor.entity.Chemical;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *  Chemical DaoImpl
 */
@Repository("chemicalDaoImpl")
public class ChemicalDaoImpl implements ChemicalDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "ChemicalMapper";

    @Override
    public void save(Chemical e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Chemical> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Chemical e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Chemical e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Chemical e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Chemical e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Chemical find(Chemical e) throws Exception {
        return (Chemical)dao.find(mapper+".find",e);
    }

    @Override
    public List<Chemical> findList(Chemical e) throws Exception {
        return  (List<Chemical> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Chemical e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Chemical e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

}
