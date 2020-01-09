package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.ChemicalDao;
import com.hniois.monitor.entity.Chemical;
import com.hniois.monitor.service.ChemicalManage;
import com.hniois.util.delObjImg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 *  Chemical Service
 */
@Service("chemicalService")
public class ChemicalService extends ServiceSupport<Chemical,ChemicalDao> implements ChemicalManage {

    @Resource(name="chemicalDaoImpl")
    @Override
    public void setDao(ChemicalDao dao) {
        this.dao = dao;
    }

    @Override
    public void newDel(Chemical e, HttpServletRequest request) throws Exception {
        delObjImg.deleteImgs(dao.find(e).getC_img(),request);
        dao.delete(e);
    }

    @Override
    public void newDelBatch(Chemical e, HttpServletRequest request) throws Exception {
        //删除对象中附带的图片
        for(int i=0;i<e.getData().size();i++){
            Chemical sd=new Chemical();
            sd.setId((String) e.getData().get(i));
            delObjImg.deleteImgs(dao.find(sd).getC_img(),request);
        }
        dao.deleteBatch(e);
    }
}
