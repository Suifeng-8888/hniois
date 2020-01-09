package com.hniois.monitor.dao;

import com.hniois.common.dao.Dao;
import com.hniois.common.page.Page;
import com.hniois.entity.statistics.StatisicsCount;
import com.hniois.monitor.entity.Buy;

import java.util.List;

/**
 *  Buy Dao
 */
public interface BuyDao extends Dao<Buy> {

    List<StatisicsCount> countWeek(Buy e) throws Exception;

    List<StatisicsCount> countMonth(Buy e) throws Exception;

    /*
    *按采购商品统计支出费用表
    * */
    Page findAmountPage(Buy e) throws Exception;

    /**
     * 按供应商统计支出费用表
     * @param e
     * @return
     * @throws Exception
     */
    Page findSalePage(Buy e) throws Exception;
}