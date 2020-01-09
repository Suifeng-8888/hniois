package com.hniois.web.sys;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Register;
import com.hniois.monitor.service.RegisterManage;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.SessionManager;
import com.hniois.web.Message;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@RestController
@RequestMapping("/webService/register")
public class RegisterActionWeb extends BaseController {

    @Resource(name="registerService")
    private RegisterManage registerService;

    /**
     *  企业注册保存
     * @param e
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveComplain(Register e){
         JSONObject obj=getMsg();
         e.setAly_time(DateUtil.getDay());
        try {
            registerService.save(e);
        } catch (Exception e1) {
           setMsg(obj,"error","注册失败");
        }
        return obj.toString();
    }

    /**
     * 企业公示分页显示
     * @param e
     * @return
     */
    @RequestMapping("/list")
    public String showPage(Register e)throws Exception{
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = registerService.findPage(e);
        return JSON.toJSONString(page);
    }

}
