package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.CropsDao;
import com.hniois.monitor.entity.Crops;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("cropDaoImpl")
public class CropsDaoImpl implements CropsDao {
    @Autowired
    private DaoSupport dao;

    private String mapper="CropMapper";

    @Override
    public void save(Crops e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Crops> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Crops e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Crops e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Crops e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Crops e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Crops find(Crops e) throws Exception {
        return (Crops)dao.find(mapper+".find",e);
    }

    @Override
    public List<Crops> findList(Crops e) throws Exception {
        return  (List<Crops> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Crops e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Crops e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
