package com.hniois.web.trace;

import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.*;
import com.hniois.monitor.service.*;
import com.hniois.trace.entity.Batch_Material;
import com.hniois.trace.entity.QRcodeNew;
import com.hniois.trace.service.BatchManage;
import com.hniois.trace.service.OrderManage;
import com.hniois.trace.service.QRcodeNewManage;
import com.hniois.util.DateUtil;
import com.hniois.util.UuidUtil;
import net.sf.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 手机扫描二维码
 */
@RestController
@RequestMapping("/webService")
public class queryTraceWeb extends BaseController{


    //手机扫描二维码
    @Resource(name="scanService")
    private ScanManage scanService;

    @Resource(name="qRcodeNewService")
    private QRcodeNewManage qRcodeService;

    //扫描二维码首次进入接口

    @RequestMapping("/first")
    public String first(QRcodeNew e)throws Exception{
        QRcodeNew qRcode = qRcodeService.find(e);
        JSONObject js = JSONObject.fromObject(qRcode);
        return js.toString();
    }


    //随机防伪码接口
    @RequestMapping(value="/random")
    public String checkRandom(QRcodeNew e,Scan e2)throws Exception{
        ScanRandom random = scanService.checkRandom(e, e2);
        JSONObject js = JSONObject.fromObject(random);
        return js.toString();
    }

    /**
     * 扫描二维码获取产品信息接口
     * @return
     */
    @RequestMapping(value = "/query",method = RequestMethod.POST )
    public String showPage(QRcodeNew e, Scan e2)throws Exception{
        Map<String, Object> map = scanService.getInfo(e, e2);
        JSONObject jt = JSONObject.fromObject(map);
        return jt.toString();
    }
}
