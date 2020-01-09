package com.hniois.monitor.dao.impl;


import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.entity.statistics.StatisicsCount;
import com.hniois.monitor.dao.BuyDao;
import com.hniois.monitor.entity.Buy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *  Buy DaoImpl
 */
@Repository("BuyDaoImpl")
public class BuyDaoImpl implements BuyDao {
    @Autowired
    private DaoSupport dao;

    private String mapper = "BuyMapper";

    @Override
    public void save(Buy e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Buy> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Buy e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Buy e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Buy e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Buy e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Buy find(Buy e) throws Exception {
        return (Buy)dao.find(mapper+".find",e);
    }

    @Override
    public List<Buy> findList(Buy e) throws Exception {
        return  (List<Buy> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Buy e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Buy e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
    @Override
    public List<StatisicsCount> countWeek(Buy e) throws Exception {
        return (List<StatisicsCount>)dao.findList(mapper+".countWeek",e);
    }

    @Override
    public List<StatisicsCount> countMonth(Buy e) throws Exception {
        return (List<StatisicsCount>)dao.findList(mapper+".countMonth",e);
    }

    /**
     * 采购支出统计分页
     * @param e
     * @return
     * @throws Exception
     */
    @Override
    public Page findAmountPage(Buy e) throws Exception{
        return (Page)dao.findPage(mapper+".findAmonutPage",mapper+".findAmonutCount",e);
    }

    /**
     * 按供应商统计支出
     * @param e
     * @return
     * @throws Exception
     */
    @Override
    public Page findSalePage(Buy e) throws Exception {
       return (Page)dao.findPage(mapper+".findSalePage",mapper+".findSaleCount",e);
    }


}
