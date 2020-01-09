package com.hniois.monitor.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Providers;
import com.hniois.monitor.entity.Soil;
import com.hniois.monitor.service.ProvidersManage;
import com.hniois.monitor.service.SoilManage;
import com.hniois.util.*;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/soil")
public class SoilAction extends BaseController {

    @Resource(name = "soilService")
    private SoilManage soilService;

    private  String soil_list="monitor/soil/soil_list";
    private  String soil_edit="monitor/soil/soil_edit";
    private  String crop_talbe="monitor/soil/crop_table";

    @Resource(name="providersService")
    private ProvidersManage providersService;

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(soil_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Soil e)throws Exception{
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = soilService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 编辑
     * @param
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Soil e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Soil soil=new Soil();
        if(StringUtils.isNotEmpty(e.getId())){
            soil=soilService.find(e);
        }
        soil.setCode(e.getCode());
        mv.addObject("soil",soil);
         mv.setViewName(soil_edit);
        return mv;
    }


    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Soil e)throws  Exception{
        JSONObject obj=getMsg();
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        if(!StringUtils.isNotEmpty(e.getId())){
            //判断客户是从产品列表选择的产品还是直接手动输入的产品
            if(StringUtils.isNotEmpty(e.getCrop_id())){
                //说明是从产品列表选择的产品
                soilService.save(e);
            }else{
                setMsg(obj,"error","请从列表选择产品");
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
    public String update(Soil e)throws Exception{
        JSONObject obj=getMsg();
       if(StringUtils.isNotEmpty(e.getId())){
           Soil soil=new Soil();
           soil.setId(e.getId());
           if(soilService.findCount(soil)>0){
               soilService.update(e);
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
    public String delete(Soil e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getId()!=null) {
            soilService.delete(e);
        }else {
            setMsg(obj, "error", "删除失败");
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
    public String deletes(Soil e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            soilService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
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
    public void doExport(Soil e) throws Exception {
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        //导出工具
        ExportExcelUtil<Soil> export = new ExportExcelUtil<Soil>();
        //文件名称
        String filename = "soilList" + DateUtil.getTimes();
        //导出数据信息
        List list = soilService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }


    /**
     * 选择作物
     * @param e
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView chose(Soil e){
        ModelAndView mv=getModelAndView();
        mv.setViewName(crop_talbe);
        return mv;
    }
}
