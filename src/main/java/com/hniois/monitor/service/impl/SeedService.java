package com.hniois.monitor.service.impl;


import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.SeedDao;
import com.hniois.monitor.entity.Seed;
import com.hniois.monitor.service.SeedManage;
import com.hniois.util.delObjImg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 *  Seed Service
 */
@Service("seedService")
public class SeedService extends ServiceSupport<Seed,SeedDao> implements SeedManage {

    @Resource(name="seedDaoImpl")
    @Override
    public void setDao(SeedDao dao) {
        this.dao = dao;
    }


    @Override
    public String getNesStr(String st, String str)throws Exception {
        String old=st+",";
        if(old.equals(str)){
            return "";
        }else{
            return str.replace(old,"");
        }
    }

    @Override
    public void newDel(Seed e, HttpServletRequest request) throws Exception {
        delObjImg.deleteImgs(dao.find(e).getS_img(),request);
        dao.delete(e);
    }

    @Override
    public void newDelBatch(Seed e, HttpServletRequest request) throws Exception {
        //删除对象中附带的图片
        for(int i=0;i<e.getData().size();i++){
            Seed sd=new Seed();
            sd.setS_id((String) e.getData().get(i));
            delObjImg.deleteImgs(dao.find(sd).getS_img(),request);
        }
        dao.deleteBatch(e);
    }
}
