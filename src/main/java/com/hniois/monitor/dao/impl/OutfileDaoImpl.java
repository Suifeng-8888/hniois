package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.OutfileDao;
import com.hniois.monitor.entity.Outfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("outfileDaoImpl")
public class OutfileDaoImpl implements OutfileDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "OutfileMapper";

    @Override
    public void save(Outfile e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Outfile> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Outfile e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Outfile e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Outfile e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Outfile e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Outfile find(Outfile e) throws Exception {
        return (Outfile)dao.find(mapper+".find",e);
    }

    @Override
    public List<Outfile> findList(Outfile e) throws Exception {
        return  (List<Outfile> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Outfile e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Outfile e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

}
