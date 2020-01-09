package com.hniois.web.monitor;

import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Seed;
import com.hniois.monitor.service.SeedManage;
import com.hniois.util.UuidUtil;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 播种管理 接口
 */
@RestController
@RequestMapping(value="/webService/seed")
public class SeedActionWeb extends BaseController{
    //Seed
    @Resource(name="seedService")
    private SeedManage seedService;

    /**
     * 播种 新增
     * @param seed
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Seed seed) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(seed.getFarm_id())) {
            String uuid = UuidUtil.get32UUID();
            seed.setS_id(uuid);
            try {
                seedService.save(seed);
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
     *  播种 删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Seed seed = new Seed();
            seed.setS_id(id);
            try {
                seedService.delete(seed);
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
     * 播种 更新
     * @param seed
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Seed seed) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(seed.getS_id())) {
            try {
                seedService.update(seed);
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
     * 播种 详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable("id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Seed seed = new Seed();
            seed.setS_id(id);
            try {
                Seed sd = seedService.find(seed);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(sd);
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
     * 播种 列表
     * @param seed
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Seed seed) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(seed.getFarm_id())) {
            try {
                List<Seed> buyList = seedService.findList(seed);
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