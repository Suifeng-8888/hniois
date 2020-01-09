package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Goods;
import com.hniois.trace.service.GoodsService;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/11/29  8:43
 * 供应商供应产品 Controller
 */
@Controller
@RequestMapping(value = "/goods")
public class GoodsController extends BaseController {

    @Resource(name = "goodsService")
    private GoodsService goodsService; // 供应商产品 service

    private String goods_list = "trace/provide/goods_list";
    private String goods_edit = "trace/provide/goods_edit";

    /**
     * 进入list 分页页面
     * @param p_id
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(String p_id) {
        ModelAndView mv = getModelAndView();
        mv.addObject("p_id", p_id); // 设置供应商id
        mv.setViewName(goods_list);
        return mv;
    }

    /**
     *  iframe 分页 请求
     * @param goods
     * @return
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Goods goods) throws Exception {
        // 当前页
        int currPage = getThisPage(goods.getPage());
        // 每页显示条数
        int limit = getThisLimit(goods.getLimit());
        goods.setOffset((currPage-1)*limit);
        goods.setPageSize(limit);
        Page page = goodsService.findPage(goods);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 Or 修改 页面
     * @param goods
     * @return
     */
    @RequestMapping(value = "/toEdit")
    public ModelAndView toAorU(Goods goods) throws Exception {
        ModelAndView mv = getModelAndView();
        Goods gs = new Goods();
        if(StringUtils.isNotEmpty(goods.getId())) {
            gs = goodsService.find(goods);
        }
        gs.setCode(goods.getCode());//判断：0查询 or 1 增加/修改
        gs.setP_id(goods.getP_id());
        mv.addObject("goods", gs);
        mv.setViewName(goods_edit);
        return mv;
    }

    /**
     * 新增供应商产品
     * @param goods
     * @return
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(Goods goods) {
        JSONObject obj = getMsg();//返回信息
        try {
            goodsService.save(goods);
        } catch (Exception e) {
            setMsg(obj, "error", "新增供应商产品异常。。。");
            e.printStackTrace();
        }
        return obj.toString();
    }

    /**
     * 供应商产品修改
     * @param goods
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(Goods goods) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(goods.getId())) {
            goodsService.update(goods);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 单个删除
     * @param goods
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Goods goods) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(goods.getId())) {
            goodsService.delete(goods);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param goods
     * @return
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(Goods goods) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(goods.getData() != null && goods.getData().size() > 0) {
            goodsService.deleteBatch(goods);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

}
