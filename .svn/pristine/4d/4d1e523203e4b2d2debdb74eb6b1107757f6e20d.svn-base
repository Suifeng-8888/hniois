package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.ReportDao;
import com.hniois.monitor.entity.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("reportDaoImpl")
public class ReportDaoImpl implements ReportDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "ReportMapper";

    @Override
    public void save(Report e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Report> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Report e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Report e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Report e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Report e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Report find(Report e) throws Exception {
        return (Report)dao.find(mapper+".find",e);
    }

    @Override
    public List<Report> findList(Report e) throws Exception {
        return  (List<Report> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Report e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Report e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

}
