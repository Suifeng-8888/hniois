package com.hniois.web.monitor;

import com.hniois.monitor.entity.Harvest;
import com.hniois.monitor.service.HarvestManage;
import com.hniois.util.DateUtil;
import com.hniois.util.Tools;
import com.hniois.util.UuidUtil;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 采摘 web
 */
@RestController
@RequestMapping("/webService/harvest")
public class HarvestActionWeb {

    @Resource(name="harvestService")
    private HarvestManage harvestService;

    /**
     * 采摘新增
     * @param harvest
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Harvest harvest) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(harvest.getFarm_id())) {
            try {
                harvest.setHid(UuidUtil.get32UUID());
                //自动生成采摘批次
                String batch= DateUtil.getTimes()+ Tools.getRandomNum();
                harvest.setBatch(batch);
                if(StringUtils.isNotEmpty(harvest.getCrop_id())){
                    harvestService.save(harvest);
                    message.setCode(0);
                    message.setMsg("添加成功!");
                }else{
                    message.setCode(1);
                    message.setMsg("请从产品列表选择产品!");
                }

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
     * 采摘  删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{hid}", method = RequestMethod.GET)
    public Message delete(@PathVariable(value = "hid") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Harvest harvest = new Harvest();
            harvest.setHid(id);
            try {
                harvestService.delete(harvest);
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
     * 采摘 更新
     * @param harvest
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Harvest harvest) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(harvest.getHid())) {
            try {
                harvestService.update(harvest);
                message.setCode(0);
                message.setMsg("修改成功!");
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
     * 采摘 详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{hid}", method = RequestMethod.GET)
    public Message find(@PathVariable(value = "hid") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Harvest harvest = new Harvest();
            harvest.setHid(id);
            try {
                Harvest ht = harvestService.find(harvest);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(ht);
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
     * 采摘 列表
     * @param harvest
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Harvest harvest) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(harvest.getFarm_id())) {
            try {
                List<Harvest> provideList = harvestService.findList(harvest);
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
