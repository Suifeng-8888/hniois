package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.TransDao;
import com.hniois.trace.entity.Transport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("transDaoImpl")
public class TransDaoImpl implements TransDao {

    @Resource
    private DaoSupport dao;

    private String mapper = "TransMapper";

    @Override
    public void save(Transport e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Transport> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Transport e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Transport e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Transport e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Transport e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Transport find(Transport e) throws Exception {
        return (Transport)dao.find(mapper+".find",e);
    }

    @Override
    public List<Transport> findList(Transport e) throws Exception {
        return  (List<Transport> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Transport e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Transport e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
