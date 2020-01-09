package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.ReportDao;
import com.hniois.monitor.entity.Report;
import com.hniois.monitor.service.ReportManage;
import com.hniois.util.delObjImg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service
public class ReportService extends ServiceSupport<Report,ReportDao> implements ReportManage {

    @Resource(name="reportDaoImpl")
    @Override
    public void setDao(ReportDao dao) {
        this.dao=dao;
    }

    @Override
    public void newDel(Report e, HttpServletRequest request) throws Exception {
        delObjImg.deleteImgs(dao.find(e).getReport_img(),request);
        dao.delete(e);
    }

    @Override
    public void newDelBatch(Report e, HttpServletRequest request) throws Exception {
        //删除对象中附带的图片
        for(int i=0;i<e.getData().size();i++){
            Report sd=new Report();
            sd.setRid((String) e.getData().get(i));
            delObjImg.deleteImgs(dao.find(sd).getReport_img(),request);
        }
        dao.deleteBatch(e);
    }
}
