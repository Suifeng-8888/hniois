package com.hniois.web.monitor;

import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Report;
import com.hniois.monitor.service.ReportManage;
import com.hniois.util.UuidUtil;
import com.hniois.web.Message;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import sun.plugin.util.UIUtil;

import javax.annotation.Resource;
import java.util.List;

/**
 * 检验报告 接口
 */
@RestController
@RequestMapping("/webService/report")
public class ReportActionWeb extends BaseController{

    @Resource(name="reportService")
    private ReportManage reportService;

    /**
     * 检验报告 新增
     * @param report
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Report report) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(report.getFarm_id())) {
            try {
                report.setRid(UuidUtil.get32UUID());
                reportService.save(report);
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
     *  检验报告  删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Report report = new Report();
            report.setRid(id);
            try {
                reportService.delete(report);
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
     *  检验报告 更新
     * @param report
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Report report) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(report.getRid())) {
            try {
                reportService.update(report);
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
     * 检验报告 详情
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Report report = new Report();
            report.setRid(id);
            try {
                Report rt = reportService.find(report);
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
     * 检验报告 列表
     * @param report
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Report report) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(report.getFarm_id())) {
            try {
                List<Report> provideList = reportService.findList(report);
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
