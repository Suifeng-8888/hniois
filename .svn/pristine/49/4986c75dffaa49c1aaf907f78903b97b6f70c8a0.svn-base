package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.PoisonDao;
import com.hniois.monitor.entity.Poison;
import com.hniois.monitor.service.PoisonManage;
import com.hniois.util.delObjImg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service("poisonService")
public class PoisonService extends ServiceSupport<Poison,PoisonDao> implements PoisonManage {

    @Resource(name="poisonDaoImpl")
    @Override
    public void setDao(PoisonDao dao) {
        this.dao=dao;
    }

    @Override
    public void newDel(Poison e, HttpServletRequest request) throws Exception {
        delObjImg.deleteImgs(dao.find(e).getP_img(),request);
        dao.delete(e);
    }

    @Override
    public void newDelBatch(Poison e, HttpServletRequest request) throws Exception {
        //删除对象中附带的图片
        for(int i=0;i<e.getData().size();i++){
            Poison sd=new Poison();
            sd.setPid((String) e.getData().get(i));
            delObjImg.deleteImgs(dao.find(sd).getP_img(),request);
        }
        dao.deleteBatch(e);
    }
}
