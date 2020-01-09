package com.hniois.monitor.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Outfit;
import com.hniois.monitor.entity.Register;
import com.hniois.monitor.service.OutfitService;
import com.hniois.monitor.service.RegisterManage;
import com.hniois.util.Const;
import com.hniois.util.SessionManager;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/register")
public class RegisterAction extends BaseController {

    String register_list="monitor/register/register_list";
    String register_edit="monitor/register/register_edit";
    String register_look="monitor/register/register_look";
    String first_edit="monitor/register/first_edit";
    String register_img="monitor/register/register_img";

    @Resource(name="registerService")
    private RegisterManage registerService;

    @Resource(name="outfitService")
    private OutfitService outfitService;

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(register_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Register e)throws Exception{
        if(Const.OUTFIT_ADMIN.equals(SessionManager.getUserType())){
            //获取当前登录用户监管级别
            Outfit oft=new Outfit();
            oft.setId(SessionManager.getFarmID());
            oft=outfitService.find(oft);
            if(oft.getGrade().equals("2")){//区县级机构
                e.setP_area(oft.getArea());
            }else if(oft.getGrade().equals("3")){//市级机构
                e.setP_city(oft.getP_city());
                e.setState("1");//初级审批通过的注册基地
            }
        }
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = registerService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查看详情
     * @param e
     * @return
     */
    @RequestMapping("/check")
    @ResponseBody
    public ModelAndView check(Register e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Register rgst=new Register();
        if(StringUtils.isNotEmpty(e.getR_id())){
            rgst=registerService.find(e);
        }
        rgst.setCode(e.getCode());
        mv.addObject("register",rgst);
        mv.setViewName(register_look);
        return mv;
    }

    /**
     * 二级审批
     * @param e
     * @return
     */
    @RequestMapping("/twoEdit")
    @ResponseBody
    public ModelAndView edit(Register e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Register rgst=new Register();
        if(StringUtils.isNotEmpty(e.getR_id())){
            rgst=registerService.find(e);
        }
        rgst.setCode(e.getCode());
        mv.addObject("register",rgst);
        mv.setViewName(register_edit);
        return mv;
    }

    /**
     * 初级审批
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView twoEdit(Register e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Register rgst=new Register();
        if(StringUtils.isNotEmpty(e.getR_id())){
            rgst=registerService.find(e);
        }
        rgst.setCode(e.getCode());
        mv.addObject("register",rgst);
        mv.setViewName(first_edit);
        return mv;
    }

    /**
     * 审批结果保存
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Register e)throws Exception{
        JSONObject obj=getMsg();
        if (StringUtils.isNotEmpty(e.getR_id())){
            Register rgst=new Register();
            rgst.setR_id(e.getR_id());
            if(registerService.findCount(rgst)>0){
                registerService.update(e);
            }else{
                setMsg(obj,"error","对象不存在");
            }
        }else{
            setMsg(obj,"error","ID不能为空");
        }
        return obj.toString();
    }


    /**
     * 检验报告图片
     * @param e 学校信息
     */
    @RequestMapping(value="/toEditImgs")
    public ModelAndView toEditImgs(Register e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Register rgst = new Register();
        if(StringUtils.isNotEmpty(e.getR_id())){
            rgst = registerService.find(e);
        }
        mv.addObject("register",rgst);
        mv.setViewName(register_img);
        return mv;
    }
}
