package com.hniois.monitor.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Approve;
import com.hniois.monitor.service.ApproveManage;
import com.hniois.util.*;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * 监管机构审批
 */
@Controller
@RequestMapping("/approve")
public class ApproveAction extends BaseController {


    @Resource(name = "approveService")
    private ApproveManage approveService;

    private String approve_list="monitor/approve/approve_list";//审批列表页面
    private String approve_edit="monitor/approve/approve_edit";//审批编辑页面

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(approve_list);
        String outfit_id=SessionManager.getFarmID();
        mv.addObject("outfit_id",outfit_id);
        return mv;
    }

    /**
     * 分页查询
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Approve e) throws Exception{
        /*if(Const.OUTFIT_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }*/
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = approveService.findPage(e);
        return JSON.toJSONString(page);
    }


    /**
     * 跳转
     * @param e          参数
     * @return           新增 or 保存页面
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(Approve e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Approve approve = new Approve();
        if(StringUtils.isNotEmpty(e.getAid())){
            approve = approveService.find(e);
        }
        approve.setCode(e.getCode());
        mv.addObject("approve",approve);
        mv.setViewName(approve_edit);
        return mv;
    }


    /**
     * 修改
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value="/update")
    @ResponseBody
    public String update(Approve e) throws Exception {
        JSONObject obj = getMsg();
        if(StringUtils.isNotEmpty(e.getAid())){
            Approve p = new Approve();
            p.setAid(e.getAid());
            if(approveService.findCount(p)>0){
                approveService.newUpdate(e);
            }else{
                setMsg(obj,"error","对象不存在");
            }
        }else{
            setMsg(obj,"error","ID不能为空");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value="/delete")
    @ResponseBody
    public String delete(Approve e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(e.getAid())){
            approveService.delete(e);
        }else{
            setMsg(obj,"error","ID不能为空");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(Approve e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e.getData().size()>0){
            approveService.deleteBatch(e);
        }else{
            setMsg(obj,"error","操作失败!");
        }
        return obj.toString();
    }

    /**
     * 导出
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Approve e) throws Exception {
        if(Const.OUTFIT_ADMIN.equals(SessionManager.getUserType())){
            e.setOutfit_id(SessionManager.getFarmID());
        }
        //导出工具
        ExportExcelUtil<Approve> export = new ExportExcelUtil<Approve>();
        //文件名称
        String filename = "approveList" + DateUtil.getTimes();
        //导出数据信息
        List list = approveService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 跳转
     * @param e          参数
     * @return           新增 or 保存页面
     */
    @RequestMapping(value="/look")
    public ModelAndView lookUp(Approve e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Approve approve = approveService.find(e);
        approve.setCode(e.getCode());
        mv.addObject("approve",approve);
        mv.setViewName(approve_edit);
        return mv;
    }
}
