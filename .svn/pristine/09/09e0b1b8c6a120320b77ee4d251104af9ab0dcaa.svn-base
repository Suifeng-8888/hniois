package com.hniois.web.monitor;


import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Chemical;
import com.hniois.monitor.service.ChemicalManage;
import com.hniois.util.UuidUtil;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 施肥 管理接口
 */
@RestController
@RequestMapping(value="/webService/chemical")
public class ChemicalActionWeb extends BaseController {
    //Chemical
    @Resource(name = "chemicalService")
    private ChemicalManage chemicalService;

    /**
     * 施肥 新增
     * @param chemical
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Chemical chemical) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(chemical.getFarm_id())) {
            String uuid = UuidUtil.get32UUID();
            chemical.setId(uuid);
            try {
                chemicalService.save(chemical);
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
     * 施肥  删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Chemical chemical = new Chemical();
            chemical.setId(id);
            try {
                chemicalService.delete(chemical);
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
     * 施肥  更新
     * @param chemical
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Chemical chemical) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(chemical.getId())) {
            try {
                chemicalService.update(chemical);
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
     * 施肥 详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable("id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Chemical chemical = new Chemical();
            chemical.setId(id);
            try {
                Chemical ch = chemicalService.find(chemical);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(ch);
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
     * 施肥 列表
     * @param chemical
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Chemical chemical) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(chemical.getFarm_id())) {
            try {
                List<Chemical> buyList = chemicalService.findList(chemical);
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