package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.QRcodeNewDao;
import com.hniois.trace.entity.QRcodeNew;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("qRcodeNewDaoImpl")
public class QRcodeNewDaoImpl implements QRcodeNewDao {

    @Resource
    private DaoSupport dao;
    private String mapper="QRcodeNewMapper";

    @Override
    public void save(QRcodeNew e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<QRcodeNew> e) throws Exception {
        dao.batchSave(mapper+".saveBatch",e);
    }

    @Override
    public void delete(QRcodeNew e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(QRcodeNew e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(QRcodeNew e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(QRcodeNew e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public QRcodeNew find(QRcodeNew e) throws Exception {
        return (QRcodeNew)dao.find(mapper+".find",e);
    }

    @Override
    public List<QRcodeNew> findList(QRcodeNew e) throws Exception {
        return  (List<QRcodeNew> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(QRcodeNew e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(QRcodeNew e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

    //重写批量更新方法
    @Override
    public void changeBatch(List e) throws Exception {
        dao.update(mapper+".changeBatch",e);
    }
}
