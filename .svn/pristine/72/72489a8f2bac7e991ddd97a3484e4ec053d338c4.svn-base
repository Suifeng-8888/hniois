package com.hniois.monitor.controller;

import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Scan;
import com.hniois.monitor.service.ComplainService;
import com.hniois.monitor.service.ScanManage;
import net.sf.json.JSONArray;
import org.apache.james.mime4j.io.LimitedInputStream;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 手机扫描/大数据统计
 */
@Controller
@RequestMapping("/scan")
public class ScanAction extends BaseController {

    @Resource(name="scanService")
    private ScanManage scanService;

    @Resource(name="complainService")
    private ComplainService complainService; // 投诉建议


    //统计页面
    String count_page = "count/countPage";
    String bigData = "count/bigData";

    /**
     * 监管机构统计页面
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/statistics")
    public ModelAndView login_count() throws Exception{
        ModelAndView mv = this.getModelAndView();
        mv.setViewName(bigData);
        return mv;
    }

    /**
     * 手机扫描区域数据统计
     * @param e
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/area")
    public String areaNum(Scan e) throws Exception{
        List<Scan> list = scanService.areaNum(e);

        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 产品手机扫描量前5位接口与其他数据并封装到list集合中
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/crop")
    public String cropNum(Scan e)throws Exception{
        List<Scan> list = scanService.cropNum(e);
        Scan scan = scanService.others(e);
        scan.setCrop_name(scan.getOther());
        list.add(scan);
        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 投诉建议图形统计
     * @return
     *//*
    @ResponseBody
    @RequestMapping("/complainChart")
    public List<Map<String,Object>> complainCount() throws Exception {
        List<Map<String, Object>> list = complainService.statistics();
        return list;
    }*/

    /**
     * 投诉建议图形统计
     * @return
     */
    @ResponseBody
    @RequestMapping("/complainChart")
    public String warnAndAdvice() throws Exception {
        List<Map<String, Object>> list = complainService.statistics();
        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 热门产品图形显示
     * @return
     */
    @ResponseBody
    @RequestMapping("/hot")
    public List<Map<String,Object>> scanHot() throws Exception {
        return scanService.scanHot();
    }

    /**
     * 产品分类扫码量占比
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/type")
    @ResponseBody
    public String scanType(Scan e)throws Exception{
        List<Scan> list = scanService.scanType(e);
        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }


    /**
     * 手机扫码总量月度走势图
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/num")
    @ResponseBody
    public String scanNum(Scan e) throws Exception{
        List<Scan> list = scanService.scanNum(e);
        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }
}
