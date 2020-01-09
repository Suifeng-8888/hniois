package com.hniois.web.trace;

import com.hniois.trace.entity.Provide;
import com.hniois.trace.service.ProvideService;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/9/25  17:00
 * 供应商管理接口
 */
@RequestMapping(value = "/webService/provide")
@RestController
public class ProvideWebService {

    @Resource(name = "provideService")
    private ProvideService provideService;

    /**
     * 供应商 新增
     * @param provide
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Provide provide) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(provide.getFarm_id())) {
            try {
                provideService.save(provide);
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
     * 供应商   删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable (value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Provide provide = new Provide();
            provide.setId(id);
            try {
                provideService.delete(provide);
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
     * 供应商  修改
     * @param provide
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Provide provide) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(provide.getId())) {
            try {
                provideService.update(provide);
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
     * 供应商 查询
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Provide provide = new Provide();
            provide.setId(id);
            try {
                Provide pv = provideService.find(provide);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(pv);
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
     * 供应商  列表
     * @param provide
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Provide provide) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(provide.getFarm_id())) {
            try {
                List<Provide> provideList = provideService.findList(provide);
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
