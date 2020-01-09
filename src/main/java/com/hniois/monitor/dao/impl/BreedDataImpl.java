package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.BreedDataDao;
import com.hniois.monitor.entity.BreedData;
import com.hniois.monitor.entity.Harvest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("breedDataImpl")
public class BreedDataImpl implements BreedDataDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "BreedDataMapper";

    @Override
    public void save(BreedData e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<BreedData> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(BreedData e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(BreedData e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(BreedData e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(BreedData e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public BreedData find(BreedData e) throws Exception {
        return (BreedData)dao.find(mapper+".find",e);
    }

    @Override
    public List<BreedData> findList(BreedData e) throws Exception {
        return  (List<BreedData> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(BreedData e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(BreedData e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
