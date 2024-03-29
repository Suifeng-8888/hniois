package com.hniois.web.supervise;

import com.hniois.monitor.entity.Recall;
import com.hniois.monitor.service.RecallService;
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
 * 2018/11/22  14:46
 * 产品召回接口
 */
@RestController
@RequestMapping(value = "/webService/recall")
public class RecallWebService {

    @Resource(name = "recallService")
    private RecallService recallService;

    /**
     * 产品召回详情
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Recall getRecall(@PathVariable("id") String id) throws Exception {
        Recall recall = new Recall();
        recall.setR_id(id);
        return recallService.find(recall);
    }

    /**
     * 产品召回列表
     * @param recall
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public List<Recall> getRecallList(Recall recall) throws Exception {
        return recallService.findList(recall);
    }

    /**
     * 更新产品召回信息
     * @param recall
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message updateRecall(Recall recall) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(recall.getR_id())) {
            try {
                recallService.update(recall);
                message.setCode(0);
                message.setMsg("更新成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("更新失败!");
                e.printStackTrace();
            }
        }
        return message;
    }

    /**
     * 删除产品召回信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{r_id}", method = RequestMethod.GET)
    public Message delRecall(@PathVariable("r_id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Recall recall = new Recall();
            recall.setR_id(id);
            try {
                recallService.delete(recall);
                message.setCode(0);
                message.setMsg("删除成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("删除失败!");
                e.printStackTrace();
            }
        }
        return message;
    }

    /**
     * 新增
     * @param recall
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Message saveRecall(Recall recall) {
        Message message = new Message(0, "添加成功!", "");
        try {
            recallService.save(recall);
        } catch (Exception e) {
            message.setCode(1);
            message.setMsg("添加失败!");
            e.printStackTrace();
        }
        return message;
    }

}
