package com.hniois.web.monitor;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Crops;
import com.hniois.monitor.service.CropsManage;
import com.hniois.monitor.service.impl.CropsService;
import com.hniois.util.UuidUtil;
import com.hniois.web.Message;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**     基地产品web接口
 * Create By javaMan
 * 2018/12/26  16:55
 */
@RestController
@RequestMapping(value="/webService/crop")
public class CropsActionWeb extends BaseController{

    @Resource(name = "cropService")
    private CropsManage cropsService;

    /**
     * 分页查询
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public Page list(Crops e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());
        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = cropsService.findPage(e);
        return page;
    }

    /**
     * 基地产品新增
     * @param crop
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Message add(Crops crop) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(crop.getFarm_id())) {
            String c_id = UuidUtil.get32UUID();
            crop.setCrop_id(c_id);
            try {
                String mark=cropsService.getMark();
                crop.setCrop_mark(mark);
                cropsService.save(crop);
                message.setCode(0);
                message.setMsg("新增成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,新增失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("登录用户非本基地管理人员!!");
        }
        return message;
    }

    /**
     * 基地产品删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delete(@PathVariable(value = "id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Crops crop = new Crops();
            crop.setCrop_id(id);
            try {
                cropsService.delete(crop);
                message.setCode(0);
                message.setMsg("删除成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,删除失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(0);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 基地产品修改
     * @param crops
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message update(Crops crops) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(crops.getCrop_id())) {
            try {
                cropsService.update(crops);
                message.setCode(0);
                message.setMsg("修改成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,修改失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 单个查询
     * @param id
     * @return
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Message find(@PathVariable("id") String id) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(id)) {
            Crops crops = new Crops();
            crops.setCrop_id(id);
            try {
                Crops cp = cropsService.find(crops);
                message.setCode(0);
                message.setMsg("查询成功!");
                message.setData(cp);
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,查询失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空!");
        }
        return message;
    }

    /**
     * 基地产品列表查询
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public Message findList(Crops crops) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(crops.getFarm_id())) {
            try {
                List<Crops> cropsList = cropsService.findList(crops);
                message.setCode(0);
                message.setMsg("列表查询成功!");
                message.setData(cropsList);
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("系统异常,查询失败!");
                message.setData(e.getMessage());
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空！");
        }
        return message;
    }
}
