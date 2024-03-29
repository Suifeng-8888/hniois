package com.hniois.web.trace;

import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.TraceData;
import com.hniois.trace.service.TdataManage;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/webService/tdata")
public class TdataActionWeb extends BaseController {

    @Resource(name = "tdataService")
    private TdataManage tdataService;

    /**
     * 查找对象
     *
     * @param e
     * @return
     */
    @RequestMapping("/find")
    public String find(TraceData e)throws Exception{

        JSONObject json = getMsg();
        if(StringUtils.isNotEmpty(e.getDat_id())){
            TraceData da=new TraceData();
            da.setDat_id(e.getDat_id());
            if(tdataService.findCount(da)>0){
                TraceData data=tdataService.find(e);
                JSONObject js = JSONObject.fromObject(data);
                return js.toString();
            }else{
                setMsg(json,"error","对象不存在");
            }
        }else{
            setMsg(json,"error","ID不能为空");
        }
        return json.toString();
    }
    /**
     * 查询list
     * @param e
     * @return
     */
    @RequestMapping("/findList")
    public String findlist(TraceData e) throws Exception{
        List<TraceData> list=new ArrayList<>();
            list = tdataService.findList(e);
        JSONArray js = JSONArray.fromObject(list);
        return js.toString();
    }



    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    public String add(TraceData e)throws  Exception{
        JSONObject obj=getMsg();
            if(StringUtils.isNotEmpty(e.getDat_id())){
               TraceData td=new TraceData();
               td.setBatch_id(e.getBatch_id());
               if(tdataService.findCount(td)>0){
                   setMsg(obj,"error","当前对象已存在");
               }else{
                   tdataService.save(e);
               }
            } else {

                tdataService.save(e);
            }
        return obj.toString();
    }

    /**
     * 编辑保存
     * @param e
     * @return
     */
    @RequestMapping("/update")
    public String update(TraceData e)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getDat_id())){
            TraceData da=new TraceData();
            da.setDat_id(e.getDat_id());
            if(tdataService.findCount(da)>0){
                tdataService.update(e);
            }else{
                setMsg(obj,"error","对象不存在");
            }
        }else {
            setMsg(obj,"error","ID不能为空");
        }
        return obj.toString();
    }


    /**
     * 单个删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    public String delete(TraceData e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getDat_id()!=null) {
            tdataService.delete(e);
        }else {
            setMsg(obj, "error", "删除失败");
        }
        return obj.toString();
    }


}
