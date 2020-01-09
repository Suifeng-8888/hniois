package com.hniois.web.monitor;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Breed;
import com.hniois.monitor.service.BreedManage;
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
@RequestMapping("/webService/breed")
public class BreedActionWeb extends BaseController {

    @Resource(name="breedService")
    private BreedManage breedService;

    /**
     * 分页查找数据
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Breed e)throws Exception{
        //当前页
        int curPage=getThisPage(e.getPage());
        //每页显示条数
        int limit=getThisLimit(e.getLimit());
        //设置偏移量
        e.setOffset((curPage-1)*limit);
        e.setPageSize(limit);
        Page page = breedService.findPage(e);

        return JSON.toJSONString(page);
    }


    /**
     * 查询所有数据
     */
    @RequestMapping("/findList")
    public String getAll(Breed e)throws Exception{
        List<Breed> list = breedService.findList(e);
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
    public String find(Breed e) throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getBreed_id())){
            Breed bred = breedService.find(e);
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
    public String findCount(Breed e)throws Exception{
        Integer count = breedService.findCount(e);
        return String.valueOf(count);
    }

    /**
     * 新增养殖批次
     * @param e
     * @return
     */
    @RequestMapping("/add")
    public String add(Breed e)throws Exception{
        JSONObject obj=getMsg();
        //判断当前对象是否已存在
        if(StringUtils.isNotEmpty(e.getBreed_id())){
            Breed bd=new Breed();
            bd.setBreed_id(e.getBreed_id());
            if(breedService.findCount(bd)>0){
                setMsg(obj,"error","对象已存在");
            }
        }else{
            String sid= UuidUtil.get32UUID();
            e.setBreed_id(sid);
            String sbatch= DateUtil.getTimes();
            e.setB_batch(sbatch);
            breedService.save(e);
        }
        return obj.toString();
    }

    /**
     * 更改养殖批次
     * @param e
     * @return
     */
    @RequestMapping("/update")
    public String update(Breed e)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getBreed_id())){
            breedService.update(e);
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
    public String delete(Breed e)throws Exception{
        JSONObject obj=getMsg();
        if (StringUtils.isNotEmpty(e.getBreed_id())){
            breedService.delete(e);
        }else{
            setMsg(obj,"error","ID不能为空");
        }
        return obj.toString();
    }
}
