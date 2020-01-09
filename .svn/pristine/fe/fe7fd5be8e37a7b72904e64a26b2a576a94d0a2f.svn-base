package com.hniois.web.monitor;

import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Soil;
import com.hniois.monitor.service.SoilManage;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 *  土地管理  接口
 */
@RestController
@RequestMapping("/webService/soil")
public class SoilActionWeb extends BaseController {

    @Resource(name = "soilService")
    private SoilManage soilService;

    /**
     *  土地 新增
     * @param soil
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Soil soil) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(soil.getFarm_id())) {
            try {
                soilService.save(soil);
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
     * 土地  删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Soil soil = new Soil();
            soil.setId(id);
            try {
                soilService.delete(soil);
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
     * 土地 更新
     * @param soil
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Soil soil) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(soil.getId())) {
            try {
                soilService.update(soil);
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
     * 土地 详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Soil soil = new Soil();
            soil.setId(id);
            try {
                Soil sl = soilService.find(soil);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(sl);
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
     * 土地 列表
     * @param soil
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Soil soil) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(soil.getFarm_id())) {
            try {
                List<Soil> provideList = soilService.findList(soil);
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
