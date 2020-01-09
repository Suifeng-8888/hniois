package com.hniois.web.trace;

import com.hniois.trace.entity.Goods;
import com.hniois.trace.service.GoodsService;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**供应商产品 接口
 * Create By javaMan
 * 2018/12/27  11:30
 */
@RestController
@RequestMapping(value = "/webService/goods")
public class GoodsWebAction {

    @Resource(name = "goodsService")
    private GoodsService goodsService;

    /**
     * 供应商产品新增
     * @param goods
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Goods goods) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(goods.getP_id())) {
            try {
                goodsService.save(goods);
                message.setCode(0);
                message.setMsg("新增成功！");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,新增失败！");
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 供应商产品  删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message detele(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Goods goods = new Goods();
            goods.setId(id);
            try {
                goodsService.delete(goods);
                message.setCode(0);
                message.setMsg("删除成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常, 删除失败！");
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空！");
        }
        return message;
    }

    /**
     * 供应商产品 修改
     * @param goods
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Goods goods) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(goods.getId())) {
            try {
                goodsService.update(goods);
                message.setCode(0);
                message.setMsg("修改成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常, 修改失败!");
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 供应商产品  详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Goods gs = new Goods();
            gs.setId(id);
            try {
                Goods goods = goodsService.find(gs);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(goods);
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常, 查询失败!");
            }
        } else {
            message.setCode(1);
            message.setMsg("参数为空,无数据!");
        }
        return message;
    }

    /**
     *  供应商产品  列表
     * @param goods
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Goods goods) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(goods.getP_id())) {
            try {
                List<Goods> goodsList = goodsService.findList(goods);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(goodsList);
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常, 查询失败!");
            }
        } else {
            message.setCode(1);
            message.setMsg("参数为空, 无数据");
        }
        return message;
    }
}
