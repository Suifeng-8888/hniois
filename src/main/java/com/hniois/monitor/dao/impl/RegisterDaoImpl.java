package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.RegisterDao;
import com.hniois.monitor.entity.Register;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("registerDaoImpl")
public class RegisterDaoImpl implements RegisterDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "RegisterMapper";

    @Override
    public void save(Register e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Register> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Register e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Register e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Register e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Register e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Register find(Register e) throws Exception {
        return (Register)dao.find(mapper+".find",e);
    }

    @Override
    public List<Register> findList(Register e) throws Exception {
        return  (List<Register> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Register e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Register e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
