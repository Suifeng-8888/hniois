package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.BatchDao;
import com.hniois.trace.entity.Batch_Material;
import com.hniois.trace.entity.TraceData;
import com.hniois.trace.service.BatchManage;
import com.hniois.trace.service.TdataManage;
import com.hniois.util.delObjImg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service("batchService")
public class BatchService extends ServiceSupport<Batch_Material,BatchDao> implements BatchManage {

    @Resource(name = "batchDaoImpl")
    @Override
    public void setDao(BatchDao dao) {
        this.dao=dao;
    }
    //包装材料
    @Resource(name = "tdataService")
    private TdataManage tdataService;

    //重写删除方法
    @Override
    public void newDel(Batch_Material e,HttpServletRequest request)throws Exception {
        delObjImg.deleteImgs(dao.find(e).getBat_img(),request);
        //删除相关的包装材料信息
        TraceData td=new TraceData();
        td.setBatch_id(e.getBatch_id());
        tdataService.delete(td);
        //删除批次对象
        dao.delete(e);
    }


}
