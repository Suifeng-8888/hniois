package com.hniois.web.monitor;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Butcher;
import com.hniois.monitor.service.ButcherManage;
import com.hniois.util.DateUtil;
import com.hniois.util.UuidUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/webService/butcher")
public class ButcherActionWeb extends BaseController {

    @Resource(name="butcherService")
    private ButcherManage butcherService;


    /**
     * 分页查找数据
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Butcher e)throws Exception{
        //当前页
        int curPage=getThisPage(e.getPage());
        //每页显示条数
        int limit=getThisLimit(e.getLimit());
        //设置偏移量
        e.setOffset((curPage-1)*limit);
        e.setPageSize(limit);
        Page page = butcherService.findPage(e);

        return JSON.toJSONString(page);
    }


    /**
     * 查询所有数据
     */
    @RequestMapping("/findList")
    public String getAll(Butcher e)throws Exception{
        List<Butcher> list = butcherService.findList(e);
        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 查询单个对象
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/find")
    public String find(Butcher e) throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getBut_id())){
            Butcher bred = butcherService.find(e);
            return JSON.toJSONString(bred);
        }else{
            setMsg(obj,"error","ID不能为空");
            return obj.toString();
        }
    }

    /**
     * 查询总数
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/count")
    public String findCount(Butcher e)throws Exception{
        Integer count = butcherService.findCount(e);
        return String.valueOf(count);
    }

    /**
     * 新增养殖批次
     * @param e
     * @return
     */
    @RequestMapping("/add")
    public String add(Butcher e)throws Exception{
        JSONObject obj=getMsg();
        //判断当前对象是否已存在
        if(StringUtils.isNotEmpty(e.getBut_id())){
            Butcher bt=new Butcher();
            bt.setBut_id(e.getBut_id());
            if(butcherService.findCount(bt)>0){
                setMsg(obj,"error","对象已存在");
            }
        }else{
            String sid= UuidUtil.get32UUID();
            e.setBut_id(sid);
            String sbatch= DateUtil.getTimes();
            e.setBut_batch(sbatch);
            butcherService.save(e);
        }
        return obj.toString();
    }

    /**
     * 更改养殖批次
     * @param e
     * @return
     */
    @RequestMapping("/update")
    public String update(Butcher e)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getBut_id())){
            butcherService.update(e);
        }else{
            setMsg(obj,"error","ID不能为空");
        }
        return obj.toString();
    }
    /**
     * 删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    public String delete(Butcher e)throws Exception{
        JSONObject obj=getMsg();
        if (StringUtils.isNotEmpty(e.getBut_id())){
            butcherService.delete(e);
        }else{
            setMsg(obj,"error","ID不能为空");
        }
        return obj.toString();
    }
}
