package com.hniois.web.trace;

import com.hniois.trace.entity.Order;
import com.hniois.trace.service.OrderManage;
import com.hniois.util.DateUtil;
import com.hniois.util.Tools;
import com.hniois.util.UuidUtil;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 订单管理  接口
 */
@RestController
@RequestMapping("/webService/order")
public class OrderActionWeb {

    @Resource(name="orderService")
    private OrderManage orderService;

    /**
     * 订单   新增
     * @param order
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Order order) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(order.getFarm_id())) {
            try {
                order.setOrder_id(UuidUtil.get32UUID());
                String orderNum= DateUtil.getSecondTimes()+ Tools.getRandomNum();
                order.setOrder_num(orderNum);
                orderService.save(order);
                message.setCode(0);
                message.setMsg("添加成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,添加失败!");
                message.setData(e.getClass());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 订单  删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Order order = new Order();
            order.setOrder_id(id);
            try {
                orderService.delete(order);
                message.setCode(0);
                message.setMsg("删除成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,删除失败!");
                message.setData(e.getClass());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 订单 更新
     * @param order
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Order order) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(order.getOrder_id())) {
            try {
                orderService.update(order);
                message.setCode(0);
                message.setMsg("修改成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg(e.getMessage());
            }
        }
        return message;
    }

    /**
     * 订单 详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Order order = new Order();
            order.setOrder_id(id);
            try {
                Order der = orderService.find(order);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(der);
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 订单 列表
     * @param order
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Order order) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(order.getFarm_id())) {
            try {
                List<Order> provideList = orderService.findList(order);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(provideList);
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

}
