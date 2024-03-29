package com.hniois.web.trace;

import com.hniois.trace.entity.Batch_Material;
import com.hniois.trace.service.BatchManage;
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
 *  批次包装  接口
 */
@RestController
@RequestMapping("/webService/batch")
public class BatchActionWeb {
    @Resource(name ="batchService")
    private BatchManage batchService;

    /**
     * 批次包装 新增
     * @param batchMaterial
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Batch_Material batchMaterial) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(batchMaterial.getFarm_id())) {
            try {
                batchMaterial.setBatch_id(UuidUtil.get32UUID());
                batchMaterial.setBatch(DateUtil.getTimes()+ Tools.getRandomNum());
                batchService.save(batchMaterial);
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
     *  批次包装  删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Batch_Material batchMaterial = new Batch_Material();
            batchMaterial.setBatch_id(id);
            try {
                batchService.delete(batchMaterial);
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
     *  批次包装 更新
     * @param batchMaterial
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Batch_Material batchMaterial) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(batchMaterial.getBatch_id())) {
            try {
                batchService.update(batchMaterial);
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
     * 批次包装 详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Batch_Material batchMaterial = new Batch_Material();
            batchMaterial.setBatch_id(id);
            try {
                Batch_Material bm = batchService.find(batchMaterial);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(bm);
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
     * 批次包装 列表
     * @param batchMaterial
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Batch_Material batchMaterial) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(batchMaterial.getFarm_id())) {
            try {
                List<Batch_Material> provideList = batchService.findList(batchMaterial);
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

