package com.hniois.monitor.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Inspect;
import com.hniois.monitor.service.InspectManage;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/inspect")
public class InspectAction extends BaseController {

    @Resource(name="inspectService")
    private InspectManage inspectService;

    String inspect_edit="monitor/butcher_detail/inspect_edit";

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Inspect e)throws Exception{
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = inspectService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Inspect e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Inspect inspect=new Inspect();
        inspect.setBut_id(e.getBut_id());

        if(StringUtils.isNotEmpty(e.getInspcet_id())){
            inspect=inspectService.find(e);
        }
        inspect.setCode(e.getCode());
        mv.addObject("inspect",inspect);
        mv.setViewName(inspect_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Inspect e)throws  Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getInspcet_id())){
            //如果id不为空,则判断对象是否已存在
            Inspect inspect=new Inspect();
            inspect.setInspcet_id(e.getInspcet_id());
            if(inspectService.findCount(inspect)>0){
                setMsg(obj,"error","当前对象已存在");
            }else{
                inspectService.save(e);
            }
        }else{
            inspectService.save(e);
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
    public String update(Inspect e) throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getInspcet_id())){
            inspectService.update(e);
        }else{
            setMsg(obj,"error","ID不能问空");
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
    public String delete(Inspect e)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getInspcet_id())) {
            inspectService.delete(e);
        }else {
            setMsg(obj, "error", "删除失败");
        }
        return obj.toString();
    }



}
