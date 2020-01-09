package com.hniois.monitor.controller;

import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.City;
import com.hniois.monitor.service.CityManage;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/province")
public class CityAction extends BaseController {

    @Resource(name="cityService")
    private CityManage cityService;

    /**
     * 通过省id获取所属市
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/city")
    public String findCitys(City e)throws Exception{
        List<City> list = cityService.findCitys(e);
        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }


    /**
     * 通过市id获取所属区
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/area")
    public String findAreas(City e)throws Exception{
        List<City> list = cityService.findArea(e);
        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 查询市下辖各区的生产基地个数
     * @param e
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/num")
    public String findNum(City e) throws Exception{
        //设置当前城市为平顶山市
        e.setCity_name("平顶山市");
        List<City> list = cityService.findNum(e);
        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }
}
