package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Providers;
import com.hniois.monitor.service.ProvidersManage;
import com.hniois.trace.entity.QRcodeNew;
import com.hniois.trace.entity.temp.Temp;
import com.hniois.trace.entity.temp.newTemp;
import com.hniois.trace.service.QRcodeNewManage;
import com.hniois.util.*;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/qCode")
public class QRcodeNewAction extends BaseController {

    @Resource(name = "qRcodeNewService")
    private QRcodeNewManage qRcodeNewService;

    @Resource(name = "providersService")
    private ProvidersManage providersService;

    private String qcode_list="trace/qcode/qcode_list";
    private String qcode_edit="trace/qcode/qcode_edit";
    private String qcode_add="trace/qcode/qcode_add";
    private String crop_table="trace/qcode/crop_table";
    String q_print="trace/qcode/print";
    String error="error";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(qcode_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(QRcodeNew e)throws Exception{
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
           e.setFarm_id(SessionManager.getFarmID());
        }
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = qRcodeNewService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(QRcodeNew e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        QRcodeNew rcode=new QRcodeNew();
       if(StringUtils.isNotEmpty(e.getCode_id())){//编辑页面
           rcode=qRcodeNewService.find(e);
           mv.addObject("QRcode",rcode);
           mv.setViewName(qcode_edit);
       }else{//新增页面
           mv.setViewName(qcode_add);
       }
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(QRcodeNew e)throws Exception{
        JSONObject obj=getMsg();
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
            e.setFarm_name(SessionManager.getFarmName());
        }
        if (!StringUtils.isNotEmpty(e.getCode_id())){

            String btch=DateUtil.getSecondTimes();
            //获取国际标准编码,暂时用毫秒时间戳代替
            String rule=qRcodeNewService.getRuleCode();
            e.setRule_code(rule);
            //顺序码
            int qcode =0;
            int begin=Integer.parseInt(e.getBegin());
            int end=Integer.parseInt(e.getEnd());
            if(StringUtils.isNotEmpty(e.getCrop_id())){
                List<QRcodeNew> list=new ArrayList<>();

                for(int i=0;i<end-begin+1;i++){
                    QRcodeNew qNew=new QRcodeNew();
                    qNew.setFarm_name(e.getFarm_name());
                    qNew.setFarm_id(e.getFarm_id());
                    qNew.setCrop(e.getCrop());
                    qNew.setCrop_id(e.getCrop_id());
                    qNew.setRule_code(e.getRule_code());
                    qNew.setC_nums("0");
                    //获取随机防伪码
                    String random=qRcodeNewService.getRandomCode();
                    qNew.setC_random(random);
                    //获取二维码ID
                    String uid= UuidUtil.get32UUID();
                    qNew.setCode_id(uid);
                    //获取顺序码
                    qcode=begin+i;
                    qNew.setQ_code(String.valueOf(qcode));
                    //获取二维码唯一追溯码
                    String source_code=e.getSource_code()+qRcodeNewService.getSourceCode(qcode);
                    qNew.setSource_code(source_code);
                    list.add(qNew);
                }
                qRcodeNewService.saveBatch(list);
            }else{
                setMsg(obj,"error","请从产品列表选择数据");
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
   /* @RequestMapping("/update")
    @ResponseBody
    public String update(QRcodeNew e)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getCode_id())){
            QRcodeNew qnew=new QRcodeNew();
            qnew.setCode_id(e.getCode_id());
            if(qRcodeNewService.findCount(qnew)>0){
                qRcodeNewService.update(e);
            }else{
                setMsg(obj,"error","对象不存在");
            }
        }else{
            setMsg(obj,"error","ID不能为空");
        }
        return obj.toString();
    }*/


    /**
     * 单个删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(QRcodeNew e)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getCode_id())){
            qRcodeNewService.delete(e);
        }else{
            setMsg(obj,"error","ID不能为空");
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
    public String deletes(QRcodeNew e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            qRcodeNewService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 导出选择的数据
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(HttpServletRequest request, QRcodeNew e) throws Exception {
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        //导出工具
        ExportExcelUtil<QRcodeNew> export = new ExportExcelUtil<QRcodeNew>();
        //文件名称
        String filename = "QRcodeNewList" + DateUtil.getTimes();
        //导出数据信息
        List list = qRcodeNewService.findPage(e).getData();
        doExport(filename,list,export);
        //更改导出过的数据标记为1
        //qRcodeNewService.changeBatch(list);
    }


    /**
     * 导出全部
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doAllExport")
    @ResponseBody
    public void doExportAll(HttpServletRequest request, QRcodeNew e) throws Exception {
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
            e.setC_nums("0");//只导出未导过的数据
        }
        //导出工具
        ExportExcelUtil<QRcodeNew> export = new ExportExcelUtil<QRcodeNew>();
        //文件名称
        String filename = "QRcodeNewList" + DateUtil.getTimes();
        //导出数据信息
        List list = qRcodeNewService.findList(e);
        doExport(filename,list,export);
        //更改导出过的数据标记为1
        qRcodeNewService.changeBatch(list);
    }

    /**
     * 选择产品
     * @param e
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView choseCrop(QRcodeNew e){
        ModelAndView mv=getModelAndView();
        mv.setViewName(crop_table);
        return mv;
    }

    /**
     * 跳转打印
     * @param e
     * @return
     */
    @RequestMapping("/toPrint")
    public ModelAndView toPrint(QRcodeNew e,HttpServletRequest request)throws Exception{
        ModelAndView mv=getModelAndView();
        //判断当前用户是否是生产基地
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            List<newTemp> list = qRcodeNewService.goPrint(e,request);
            //根据二维码获二维码对象
            mv.addObject("list",list);
            mv.addObject("count",list.size());
            mv.setViewName(q_print);
        }else{
            mv.setViewName(error);
        }
        return mv;
    }
}
