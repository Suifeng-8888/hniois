package com.hniois.trace.controller;

import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Harvest;
import com.hniois.monitor.entity.Providers;
import com.hniois.monitor.entity.Recall;
import com.hniois.monitor.entity.Report;
import com.hniois.monitor.service.HarvestManage;
import com.hniois.monitor.service.RecallService;
import com.hniois.monitor.service.ReportManage;
import com.hniois.monitor.service.impl.ProvidersService;
import com.hniois.trace.entity.Order;
import com.hniois.trace.service.OrderManage;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 综合查询  追溯信息查询
 * Create By javaMan
 * 2018/10/10  16:33
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController extends BaseController {

    @Resource(name = "providersService")
    private ProvidersService providersService; // 经营主体(生产企业)

    private String search_index = "trace/search/trace_search";

    @Resource(name="harvestService")
    private HarvestManage harvestService; // 采摘

    @Resource(name="orderService")
    private OrderManage orderService; // 订单

    @Resource(name="reportService")
    private ReportManage reportService; // 检测报告

    @Resource(name="recallService")
    private RecallService recallService;//  召回

    /**
     * 进入追溯信息查询页
     * @return
     */
    @RequestMapping(value = "/index")
    public ModelAndView index() {
        ModelAndView mv = getModelAndView();
        mv.setViewName(search_index);
        return mv;
    }

    /**
     * @param batch 产品批次
     * @return
     */
    @RequestMapping("/getdata")
    @ResponseBody
    public Map<String,Object> getData(String batch) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();  // 返回数据

        return map;
    }
}
