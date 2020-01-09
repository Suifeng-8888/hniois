package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Transport;
import com.hniois.trace.service.TransManage;
import com.hniois.util.SessionManager;
import com.hniois.util.UuidUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/trans")
public class TransportAction extends BaseController {

    @Resource(name="transService")
    private TransManage transService;


    private String trans_edit="trace/transport/trans_edit";


    /**
     * 分页查询
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public String showlist(Transport e)throws Exception{

        //或取当前页
        int currpage =getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((currpage-1)*limit);
        e.setPageSize(limit);
        Page page=transService.findPage(e);
        return JSON.toJSONString(page);
    }
    /**
     * 查询list
     * @param e
     * @return
     */
    @RequestMapping("/findlist")
    @ResponseBody
    public String findlist(Transport e) throws Exception{
        List<Transport> list= transService.findList(e);
        JSONArray js=JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Transport e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Transport trans=new Transport();
        trans.setOrder_id(e.getOrder_id());
        if(StringUtils.isNotEmpty(e.getTrans_id())){
            trans=transService.find(e);
        }
        mv.addObject("trans",trans);
        mv.setViewName(trans_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Transport e)throws Exception{
        JSONObject obj=getMsg();
        if(!StringUtils.isNotEmpty(e.getTrans_id())){
            String tid= UuidUtil.get32UUID();
            e.setTrans_id(tid);
            transService.save(e);
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
    public String update(Transport e)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getTrans_id())){
            transService.update(e);
        }else{
            setMsg(obj,"error","编辑失败");
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
    public String delete(Transport e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getTrans_id()!=null) {
            transService.delete(e);
        }else {
            setMsg(obj, "error", "删除失败");
        }
        return obj.toString();
    }
}
