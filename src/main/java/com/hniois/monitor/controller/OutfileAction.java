package com.hniois.monitor.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Approve;
import com.hniois.monitor.entity.Outfile;
import com.hniois.monitor.entity.Output;
import com.hniois.monitor.entity.Providers;
import com.hniois.monitor.service.ApproveManage;
import com.hniois.monitor.service.OutfileManage;
import com.hniois.monitor.service.OutputService;
import com.hniois.monitor.service.ProvidersManage;
import com.hniois.util.*;
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
@RequestMapping("/outfile")
public class OutfileAction extends BaseController {

    @Resource(name="outfileService")
    private OutfileManage outfileService;//生成准出信息

    @Resource(name = "outputService")
    private OutputService outputService; // 申请准出

    @Resource(name="providersService")
    private ProvidersManage providersService;//生产基地

    @Resource(name = "approveService")
    private ApproveManage approveService;//机构审批

    String outfile_list="monitor/outfile/outfile_list";
    String outfile_edit="monitor/outfile/outfile_edit";
    String outfile_img="monitor/outfile/outfile_img";
    String error="error";
    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(outfile_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Outfile e)throws Exception{
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = outfileService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     *  编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Outfile e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Outfile outfile=new Outfile();
        if(StringUtils.isNotEmpty(e.getFid())){
            outfile=outfileService.find(e);
        }
        outfile.setCode(e.getCode());
        mv.addObject("outfile",outfile);
        mv.setViewName(outfile_edit);
        return mv;
    }

    /**
     * 新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public ModelAndView add(Outfile e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
        Outfile outfile=new Outfile();
        //通过申请id获取申请信息,通过p_id获得审批信息
        Output op=new Output();//申请对象
        op.setP_id(e.getP_id());
        op=outputService.find(op);
        outfile.setFarm_id(op.getFarm_id());
        outfile.setPro_name(op.getCrop_name());
        outfile.setGovernment(op.getOutfit_name());
        outfile.setReport_num(op.getReport_num());
        Providers pp=new Providers();//生产基地
        pp.setP_id(op.getFarm_id());
        pp= providersService.find(pp);
        outfile.setCompany(pp.getP_name());
        outfile.setAddress(pp.getP_address());
        outfile.setPhone(pp.getP_phone());
        Approve app=new Approve();//审批对象
        app.setP_id(e.getP_id());
        app.setOutfit_id(e.getOutfit_id());
        app=approveService.find(app);
        outfile.setApprover(app.getApprover());
        outfile.setOut_time(app.getApprove_time());
        outfile.setCode(1);
        mv.addObject("outfile",outfile);
        mv.setViewName(outfile_edit);
        }else{
            mv.setViewName(error);
        }
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public String save(Outfile e)throws  Exception{
        JSONObject obj=getMsg();
        e.setFid(UuidUtil.get32UUID());
        outfileService.save(e);
        return obj.toString();
    }

    /**
     * 编辑保存
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Outfile e)throws Exception{
        JSONObject obj=getMsg();
        if (StringUtils.isNotEmpty(e.getFid())){
            Outfile ct=new Outfile();
            ct.setFid(e.getFid());
            if(outfileService.findCount(ct)>0){
                outfileService.update(e);
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
    public String delete(Outfile e, HttpServletRequest request)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getFid())) {
            outfileService.newDel(e,request);
        }else {
            setMsg(obj, "error", "ID不能为空");
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
    public void doExport(Outfile e) throws Exception {
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        //导出工具
        ExportExcelUtil<Outfile> export = new ExportExcelUtil<Outfile>();
        //文件名称
        String filename = "outfileList" + DateUtil.getTimes();
        //导出数据信息
        List list = outfileService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 打药图片
     * @param e 学校信息
     */
    @RequestMapping(value="/toEditImgs")
    public ModelAndView toEditImgs(Outfile e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Outfile outfile = new Outfile();
        if(StringUtils.isNotEmpty(e.getFid())){
            outfile = outfileService.find(e);
        }
        mv.addObject("outfile",outfile);
        mv.setViewName(outfile_img);
        return mv;
    }


}
