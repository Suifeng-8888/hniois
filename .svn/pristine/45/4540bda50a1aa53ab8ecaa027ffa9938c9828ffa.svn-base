package com.hniois.monitor.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.*;
import com.hniois.monitor.service.*;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/12/3  9:18
 * 基地准出   controller
 */
@Controller
@RequestMapping(value = "/output")
public class OutputController extends BaseController {

    @Resource(name = "outputService")
    private OutputService outputService; // 基地准出  service

    private String list = "monitor/output/output_list";  // 基地准出页面
    private String edit = "monitor/output/output_edit";  // 基地准出查看,新增,修改页面
    private String crop_table = "monitor/output/crop_table";  // 农产品
    private String report_table = "monitor/output/report_table";  // 检测报告
    private String outfit_table = "monitor/output/outfit_table";  // 监管机构


    /**
     * 进入分页列表页面
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(list);
        return mv;
    }

    /**
     * 分页数据
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String pageList(Output e) throws Exception {
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());
        e.setOffset((currPage-1) * limit);
        e.setPageSize(limit);
        Page page = outputService.findPage(e);
        return JSON.toJSONString(page);
    }


    /**
     * 新增 or 修改    页面
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView addORUpd(Output e) throws Exception {
        ModelAndView mv = getModelAndView();
        Output op = new Output();
        if (StringUtils.isNotEmpty(e.getP_id())) {
            op = outputService.find(e);
        }
        op.setCode(e.getCode());  // 判断：0查看 or 1 增加/修改
        mv.addObject("output", op);
        mv.setViewName(edit);
        return mv;
    }

    /**
     * 基地准出申请添加
     * @param e
     * @return
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(Output e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        if(!StringUtils.isNotEmpty(e.getP_id())){
            outputService.newSave(e);
        }else{
            setMsg(obj,"error","新增失败");
        }
        return obj.toString();
    }


    /**
     * 基地准出删除
     * @param output
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Output output) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(output.getP_id())) {
            if(output.getMsg().equals("0")){//未审批之前的删除
                outputService.newDelete(output);
            }else if(output.getMsg().equals("1")){//审批之后的删除
                outputService.delete(output);
            }
        } else {
            setMsg(obj, "error", "ID不能为空");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param e
     * @return
     */
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(Output e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            outputService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 选择产品
     * @return
     */
    @RequestMapping("/toCrops")
    public ModelAndView choseCrops(){
      ModelAndView mv=getModelAndView();
      mv.setViewName(crop_table);
      return mv;
    }

    /**
     * 选择检测报告
     * @return
     */
    @RequestMapping("/toReports")
    public ModelAndView choseReport(@RequestParam(required = false) String crop_id){
        ModelAndView mv=getModelAndView();
        mv.setViewName(report_table);
        mv.addObject("crop_id",crop_id);
        return mv;
    }

    /**
     * 选择监管机构
     * @return
     */
    @RequestMapping("/toApprove")
    public ModelAndView choseApprove(){
        ModelAndView mv=getModelAndView();
        mv.setViewName(outfit_table);
        return mv;
    }
}
