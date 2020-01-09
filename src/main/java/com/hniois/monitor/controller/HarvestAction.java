package com.hniois.monitor.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Harvest;
import com.hniois.monitor.entity.Soil;
import com.hniois.monitor.service.HarvestManage;
import com.hniois.monitor.service.SoilManage;
import com.hniois.util.*;
import com.sun.scenario.effect.impl.state.HVSeparableKernel;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/pick")
public class HarvestAction extends BaseController {

    @Resource(name="harvestService")
    private HarvestManage harvestService;

    @Resource(name="soilService")
    private SoilManage soilService;

    String hart_list="monitor/harvest/harvest_list";
    String hart_edit="monitor/harvest/harvest_edit";
    String harvest_img="monitor/harvest/harvest_img";
    String crop_table="monitor/harvest/crop_table";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(hart_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Harvest e)throws Exception{
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = harvestService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Harvest e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Harvest hart=new Harvest();
        if(StringUtils.isNotEmpty(e.getHid())){
            hart=harvestService.find(e);
        }
        hart.setCode(e.getCode());
        mv.addObject("hart",hart);
        mv.setViewName(hart_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Harvest e)throws  Exception{
        JSONObject obj=getMsg();
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        if(!StringUtils.isNotEmpty(e.getHid())){
            String uid= UuidUtil.get32UUID();
            e.setHid(uid);
            //自动生成采摘批次
            String batch=DateUtil.getTimes()+ Tools.getRandomNum();
            e.setBatch(batch);
            if(StringUtils.isNotEmpty(e.getCrop_id())){
                harvestService.save(e);
            }else{
                setMsg(obj,"error","请从列表中选数据");
            }

        }else{
            setMsg(obj,"error","新增失败");
        }
        return obj.toString();
    }

    /**
     * 编辑保存
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Harvest e) throws Exception{
        JSONObject obj=getMsg();
       if(StringUtils.isNotEmpty(e.getHid())){
           Harvest hv=new Harvest();
           hv.setHid(e.getHid());
           if(harvestService.findCount(hv)>0){
               harvestService.update(e);
           }else{
               setMsg(obj,"error","对象不存在");
           }
        }else{
            setMsg(obj,"error","ID不能为空");
        }
        return obj.toString();
    }


    /**
     * 单个删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Harvest e, HttpServletRequest request)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getHid())) {
            harvestService.newDel(e,request);
        }else {
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
    public String deletes(Harvest e,HttpServletRequest request)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            harvestService.newDelBatch(e,request);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 选择采摘作物
     * @param e
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView chose1(Harvest e){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(crop_table);
        return mv;
    }

    /**
     * 导出
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Harvest e) throws Exception {
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        //导出工具
        ExportExcelUtil<Harvest> export = new ExportExcelUtil<Harvest>();
        //文件名称
        String filename = "harvestList" + DateUtil.getTimes();
        //导出数据信息
        List list = harvestService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 施肥图片
     * @param e 学校信息
     */
    @RequestMapping(value="/toEditImgs")
    public ModelAndView toEditImgs(Harvest e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Harvest hv = new Harvest();
        if(StringUtils.isNotEmpty(e.getHid())){
            hv = harvestService.find(e);
        }
        mv.addObject("hart",hv);
        mv.setViewName(harvest_img);
        return mv;
    }

}
