package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.InspectDao;
import com.hniois.monitor.entity.Inspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("inspectDaoImpl")
public class InspectDaoImpl implements InspectDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "InspectMapper";
    @Override
    public void save(Inspect e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Inspect> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Inspect e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Inspect e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Inspect e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Inspect e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Inspect find(Inspect e) throws Exception {
        return (Inspect)dao.find(mapper+".find",e);
    }

    @Override
    public List<Inspect> findList(Inspect e) throws Exception {
        return  (List<Inspect> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Inspect e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Inspect e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
