package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.ScanDao;
import com.hniois.monitor.entity.Scan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("scanDaoImpl")
public class ScanDaoImpl implements ScanDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "ScanMapper";

    @Override
    public void save(Scan e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Scan> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Scan e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Scan e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Scan e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Scan e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Scan find(Scan e) throws Exception {
        return (Scan)dao.find(mapper+".find",e);
    }

    @Override
    public List<Scan> findList(Scan e) throws Exception {
        return  (List<Scan> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Scan e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Scan e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }

    /**
     * 扫码区域统计
     * @param e
     * @return
     * @throws Exception
     */
    @Override
    public List<Scan> areaNum(Scan e)throws Exception {
        return (List<Scan> )dao.findList(mapper+".areaNum",e);
    }

    @Override
    public List<Scan> cropNum(Scan e) throws Exception {
        return (List<Scan> )dao.findList(mapper+".cropNum",e);
    }

    @Override
    public Scan others(Scan e) throws Exception {
        return (Scan)dao.find(mapper+".otherNum",e);
    }

    @Override
    public List<Map<String, Object>> scanHot() throws Exception {
        return (List<Map<String, Object>>) dao.findList(mapper + ".scanHot", "");
    }

    //产品分类扫码量占比
    @Override
    public List<Scan> scanType(Scan e) throws Exception {
        return (List<Scan> )dao.findList(mapper+".typeNum",e);
    }

    @Override
    public List<Scan> scanNum(Scan e) throws Exception {
        return (List<Scan> )dao.findList(mapper+".scanNum",e);
    }


}
