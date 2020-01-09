package com.hniois.monitor.controller;


import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Buy;
import com.hniois.monitor.service.BuyManage;
import com.hniois.trace.dao.GoodsDao;
import com.hniois.trace.entity.Goods;
import com.hniois.trace.entity.Provide;
import com.hniois.trace.service.GoodsService;
import com.hniois.trace.service.ProvideService;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value="/buy")
public class BuyAction extends BaseController{
    //Buy
    @Resource(name="BuyService")
    private BuyManage BuyService;

    @Resource(name="provideService")
    private ProvideService provideService;  // 供应商

    @Resource(name="goodsService")
    private GoodsService goodsService; // 供应商产品

    private String buy_list = "monitor/buy/buy_list";
    private String buy_edit = "monitor/buy/buy_edit";
    private String buy_table = "monitor/buy/buy_table";
    private String out_name_list = "monitor/bill/out_name_list";
    private String out_pro_list = "monitor/bill/out_pro_list";
    private String buy_goods = "monitor/buy/buy_goods"; // 供应商产品选择页面

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(buy_list);
        return mv;
    }

    /**
     * 选择供应商
     * @param e
     * @return
     */
    @RequestMapping(value="/toTable")
    public ModelAndView toTable(Buy e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(buy_table);
        return mv;
    }

    /**
     * 选择供应商产品
     * @param p_id
     * @return
     */
    @RequestMapping(value="/toGoods")
    public ModelAndView toGoods(String p_id){
        ModelAndView mv = getModelAndView();
        mv.addObject("p_id", p_id);
        mv.setViewName(buy_goods);
        return mv;
    }

    /**
     * 分页查询
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Buy e) throws Exception{
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = BuyService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 跳转
     * @param e          参数
     * @return           新增 or 保存页面
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(Buy e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Buy buy = new Buy();
        if(StringUtils.isNotEmpty(e.getId())){
            buy = BuyService.find(e);
        }
        buy.setCode(e.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("Buy",buy);
        mv.setViewName(buy_edit);
        return mv;
    }

    /**
     * 保存
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(Buy e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
//        判断供应商是否存在
     /*   Provide provide = new Provide();
        provide.setName(e.getB_provider());
        provide.setFarm_id(SessionManager.getFarmID());
        Provide pd = provideService.find(provide);

        if(pd != null){
            // 供应商存在  判断供应商产品是否存在
            Goods goods = new Goods();
            goods.setP_id(pd.getId());
            goods.setName(e.getB_name());
            int count = goodsService.findCount(goods);
            if(count == 0) {
//                供应产品不存在 添加供应产品
                goods.setPrice(e.getB_price());
                goods.setUnit(e.getB_spec());
                goodsService.save(goods);
            }
        } else {
//            供应商不存在 添加 供应商 和  供应商产品
            provideService.save(provide);

//            添加供应产品
            Goods goods = new Goods();
            goods.setP_id(provideService.find(provide).getId());
            goods.setName(e.getB_name());
            goods.setPrice(e.getB_price());
            goods.setUnit(e.getB_spec());
            goodsService.save(goods);
        }*/
        Double total_cost=Double.parseDouble(e.getB_number())*e.getB_price();
        e.setTotal_cost(total_cost);
        BuyService.save(e);
        return obj.toString();
    }

    /**
     * 修改
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value="/update")
    @ResponseBody
    public String update(Buy e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(e.getId())) {
            Double total_cost=Double.parseDouble(e.getB_number())*e.getB_price();
            e.setTotal_cost(total_cost);
            BuyService.update(e);
        } else {
            setMsg(obj,"error","参数不能为空!");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value="/delete")
    @ResponseBody
    public String delete(Buy e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        BuyService.delete(e);
        return obj.toString();
    }

    /**
     * 删除
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(Buy e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        BuyService.deleteBatch(e);
        return obj.toString();
    }


    /**
     * 采购模块导出
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doExports")
    @ResponseBody
    public void doExports(Buy e) throws Exception {
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        //导出工具
        ExportExcelUtil<Buy> export = new ExportExcelUtil<Buy>();


        String filename = "buyList" + DateUtil.getTimes();
            //导出数据信息
        List list = BuyService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 台账统计模块导出
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Buy e) throws Exception {
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        //导出工具
        ExportExcelUtil<Buy> export = new ExportExcelUtil<Buy>();
        String filename=null;
        List list=new ArrayList();
        if(e.getMsg().equals("1")){//采购供应商数据统计
            //文件名称
            filename = "supplyList" + DateUtil.getTimes();
            //导出数据信息
            list = BuyService.findSalePage(e).getData();
        }else{//采购产品数据统计
            //文件名称
             filename = "buyCountList" + DateUtil.getTimes();
            //导出数据信息
             list = BuyService.findAmountPage(e).getData();
        }
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 商品费用页面
     * @param e
     * @return
     */
    @RequestMapping(value="/toBill")
    public ModelAndView toBill(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(out_name_list);
        return mv;
    }
    /**
     * 采购商品费用统计分页查询
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value = "/outList")
    @ResponseBody
    public String outlist(Buy e) throws Exception{
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        if(!StringUtils.isNotEmpty(e.getBtime())){
            e.setBtime(null);
        }
        if(!StringUtils.isNotEmpty(e.getEtime())){
            e.setEtime(null);
        }
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = BuyService.findAmountPage(e);
        return JSON.toJSONString(page);
    }


    /**
     * 供应商费用页面
     * @param e
     * @return
     */
    @RequestMapping(value="/toSup")
    public ModelAndView toSupply(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(out_pro_list);
        return mv;
    }
    /**
     * 采购供应产品费用统计
     * @param e          参数
     * @return           json字符串
     * */
    @RequestMapping(value = "/outSupList")
    @ResponseBody
    public String outSupplylist(Buy e) throws Exception{
        if(Const.PROVIDER_ADMIN.equals(SessionManager.getUserType())){
            e.setFarm_id(SessionManager.getFarmID());
        }
        if(!StringUtils.isNotEmpty(e.getBtime())){
            e.setBtime(null);
        }
        if(!StringUtils.isNotEmpty(e.getEtime())){
            e.setEtime(null);
        }
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = BuyService.findSalePage(e);
        return JSON.toJSONString(page);
    }
}