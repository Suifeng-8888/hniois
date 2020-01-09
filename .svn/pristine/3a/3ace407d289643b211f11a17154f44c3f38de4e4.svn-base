package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.VaccineDao;
import com.hniois.monitor.entity.Vaccine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("vaccineDaoImpl")
public class VaccineDaoImpl implements VaccineDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "VaccineMapper";
    @Override
    public void save(Vaccine e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Vaccine> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Vaccine e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Vaccine e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Vaccine e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Vaccine e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Vaccine find(Vaccine e) throws Exception {
        return (Vaccine)dao.find(mapper+".find",e);
    }

    @Override
    public List<Vaccine> findList(Vaccine e) throws Exception {
        return  (List<Vaccine> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Vaccine e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Vaccine e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
