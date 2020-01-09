package com.hniois.trace.service.impl;

import com.hniois.common.page.Page;
import com.hniois.common.service.ServiceSupport;
import com.hniois.entity.statistics.OrderCount;
import com.hniois.trace.dao.OrderDao;
import com.hniois.trace.entity.Order;
import com.hniois.trace.service.OrderManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("orderService")
public class OrderService extends ServiceSupport<Order,OrderDao> implements OrderManage{
    @Resource(name="orderDaoImpl")
    @Override
    public void setDao(OrderDao dao) {
        this.dao=dao;
    }
    @Override
    public List<OrderCount> countWeek(Order e) throws Exception {
        return dao.countWeek(e);
    }

    @Override
    public List<OrderCount> countMonth(Order e) throws Exception {
        return dao.countMonth(e);
    }
    /**
     * 订单产品收入统计
     */
    @Override
    public Page findCropPage(Order e) throws Exception {
        return dao.findCropPage(e);
    }

    /**
     * 销售商交易额统计
     */
    @Override
    public Page findSalePage(Order e) throws Exception {
        return dao.findSalePage(e);
    }

}
