package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.HarvestDao;
import com.hniois.monitor.entity.Harvest;
import com.hniois.monitor.service.HarvestManage;
import com.hniois.util.delObjImg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service("harvestService")
public class HarvestService extends ServiceSupport<Harvest,HarvestDao> implements HarvestManage {

    @Resource(name="harvestDaoImpl")
    @Override
    public void setDao(HarvestDao dao) {
        this.dao=dao;
    }

    @Override
    public void newDel(Harvest e, HttpServletRequest request) throws Exception {
        delObjImg.deleteImgs(dao.find(e).getH_img(),request);
        dao.delete(e);
    }

    @Override
    public void newDelBatch(Harvest e, HttpServletRequest request) throws Exception {
        //删除对象中附带的图片
        for(int i=0;i<e.getData().size();i++){
            Harvest sd=new Harvest();
            sd.setHid((String) e.getData().get(i));
            delObjImg.deleteImgs(dao.find(sd).getH_img(),request);
        }
        dao.deleteBatch(e);
    }
}
