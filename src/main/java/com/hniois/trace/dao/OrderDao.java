package com.hniois.trace.dao;

import com.hniois.common.dao.Dao;
import com.hniois.common.page.Page;
import com.hniois.entity.statistics.OrderCount;
import com.hniois.trace.entity.Order;

import java.util.List;

public interface OrderDao extends Dao<Order> {
    List<OrderCount> countWeek(Order e) throws Exception;

    List<OrderCount> countMonth(Order e) throws Exception;

    /**
     * 订单产品收入统计
     */
    Page findCropPage(Order e) throws Exception;

    /**
     * 销售商交易额统计
     */
    Page findSalePage(Order e) throws Exception;
}
