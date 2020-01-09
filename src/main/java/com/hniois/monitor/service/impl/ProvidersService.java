package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.ProvidersDao;
import com.hniois.monitor.entity.Providers;
import com.hniois.monitor.service.ProvidersManage;
import com.hniois.util.delObjImg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 *  Providers Service
 */
@Service("providersService")
public class ProvidersService extends ServiceSupport<Providers,ProvidersDao> implements ProvidersManage {

    @Resource(name="providersDaoImpl")
    @Override
    public void setDao(ProvidersDao dao) {
        this.dao = dao;
    }

    @Override
    public void newDel(Providers e, HttpServletRequest request) throws Exception {
        delObjImg.deleteImgs(dao.find(e).getP_qualifications(),request);
        dao.delete(e);
    }

    @Override
    public void newDelBatch(Providers e, HttpServletRequest request) throws Exception {
        //删除对象中附带的图片
        for(int i=0;i<e.getData().size();i++){
            Providers sd=new Providers();
            sd.setP_id((String) e.getData().get(i));
            delObjImg.deleteImgs(dao.find(sd).getP_qualifications(),request);
        }
        dao.deleteBatch(e);
    }
}
