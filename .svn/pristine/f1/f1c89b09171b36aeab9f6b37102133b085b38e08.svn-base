package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.OutfileDao;
import com.hniois.monitor.entity.Outfile;
import com.hniois.monitor.service.OutfileManage;
import com.hniois.util.delObjImg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service("outfileService")
public class OutfileService extends ServiceSupport<Outfile,OutfileDao> implements OutfileManage {

    @Resource(name="outfileDaoImpl")

    @Override
    public void setDao(OutfileDao dao) {
        this.dao=dao;
    }

    @Override
    public void newDel(Outfile e, HttpServletRequest request) throws Exception {
        delObjImg.deleteImgs(dao.find(e).getCrop_img(),request);
        dao.delete(e);
    }

    @Override
    public void newDelBatch(Outfile e, HttpServletRequest request) throws Exception {
        //删除对象中附带的图片
        for(int i=0;i<e.getData().size();i++){
            Outfile sd=new Outfile();
            sd.setFid((String) e.getData().get(i));
            delObjImg.deleteImgs(dao.find(sd).getCrop_img(),request);
        }
        dao.deleteBatch(e);
    }
}
