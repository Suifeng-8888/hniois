package com.hniois.web.trace;

import com.hniois.trace.entity.Retailer;
import com.hniois.trace.service.RetailerService;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/9/25  17:28
 * 销售商管理接口
 */
@RequestMapping(value = "/webService/retailer")
@RestController
public class RetailerWebService {

    @Resource(name = "retailerService")
    private RetailerService retailerService;

    /**
     *  销售商  新增
     * @param retailer
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Retailer retailer) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(retailer.getFarm_id())) {
            try {
                retailerService.save(retailer);
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
     *  销售商  删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable (value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Retailer retailer = new Retailer();
            retailer.setId(id);
            try {
                retailerService.delete(retailer);
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
     * 销售商  修改
     * @param retailer
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Retailer retailer) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(retailer.getId())) {
            try {
                retailerService.update(retailer);
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
     * 销售商 详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Retailer retailer = new Retailer();
            retailer.setId(id);
            try {
                Retailer rt = retailerService.find(retailer);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(rt);
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
     * 销售商 列表
     * @param retailer
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Retailer retailer) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(retailer.getFarm_id())) {
            try {
                List<Retailer> provideList = retailerService.findList(retailer);
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
