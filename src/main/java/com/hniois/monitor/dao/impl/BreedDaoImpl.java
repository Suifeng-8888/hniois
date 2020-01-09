package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.BreedDao;
import com.hniois.monitor.entity.Breed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("breedDaoImpl")
public class BreedDaoImpl implements BreedDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "BreedMapper";
    @Override
    public void save(Breed e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Breed> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Breed e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Breed e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Breed e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Breed e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Breed find(Breed e) throws Exception {
        return (Breed)dao.find(mapper+".find",e);
    }

    @Override
    public List<Breed> findList(Breed e) throws Exception {
        return  (List<Breed> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Breed e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Breed e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
