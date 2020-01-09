package com.hniois.web.monitor;

import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Buy;
import com.hniois.monitor.service.BuyManage;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 采购  接口
 */
@RestController
@RequestMapping(value="/webService/buy")
public class BuyActionWeb extends BaseController {
    //Buy
    @Resource(name = "BuyService")
    private BuyManage buyService;

    /**
     *  采购新增
     * @param buy
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Buy buy) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(buy.getFarm_id())) {
            try {
                double total = Integer.parseInt(buy.getB_number()) * buy.getB_price();
                buy.setTotal_cost(total);
                buyService.save(buy);
                message.setCode(0);
                message.setMsg("新增成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,新增失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为为空!");
        }
        return message;
    }

    /**
     * 采购 删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Buy buy = new Buy();
            buy.setId(id);
            try {
                buyService.delete(buy);
                message.setCode(0);
                message.setMsg("删除成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,删除失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(0);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 采购 更新
     * @param buy
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Buy buy) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(buy.getId())) {
            try {
                buyService.update(buy);
                message.setCode(0);
                message.setMsg("修改成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,修改失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 采购 详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable("id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Buy buy = new Buy();
            buy.setId(id);
            try {
                Buy b = buyService.find(buy);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(b);
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,查询失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     *  采购 列表
     * @param buy
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Buy buy) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(buy.getFarm_id())) {
            try {
                List<Buy> buyList = buyService.findList(buy);
                message.setCode(0);
                message.setMsg("列表查询成功!");
                message.setData(buyList);
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,查询失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空！");
        }
        return message;
    }
}