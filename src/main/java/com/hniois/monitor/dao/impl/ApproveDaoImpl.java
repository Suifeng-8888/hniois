package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.ApproveDao;
import com.hniois.monitor.entity.Approve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("approveDaoImpl")
public class ApproveDaoImpl implements ApproveDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "ApproveMapper";

    @Override
    public void save(Approve e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Approve> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Approve e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Approve e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Approve e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Approve e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Approve find(Approve e) throws Exception {
        return (Approve)dao.find(mapper+".find",e);
    }

    @Override
    public List<Approve> findList(Approve e) throws Exception {
        return  (List<Approve> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Approve e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Approve e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
