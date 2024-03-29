package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.CropsDao;
import com.hniois.monitor.entity.Crops;
import com.hniois.monitor.entity.Seed;
import com.hniois.monitor.service.CropsManage;
import com.hniois.util.delObjImg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Random;

@Service("cropService")
public class CropsService extends ServiceSupport<Crops,CropsDao> implements CropsManage {

    @Resource(name="cropDaoImpl")
    @Override
    public void setDao(CropsDao dao) {
        this.dao=dao;
    }


    /**
     * 随机生成八位数验证码
     * @return
     */
    public  String getRandomNum(){
        return String.valueOf((int)(Math.random()*(99999999-10000000)+10000000));
    }

    public String getMark()throws Exception{
        //获取产品标记码
        String mark=null;
        while(1>0){
            mark=this.getRandomNum();
            Crops c=new Crops();
            c.setCrop_mark(mark);
            if(dao.findCount(c)>0){
                continue;
            }else{
                break;
            }
        }
        return mark;
    }

    @Override
    public void newDel(Crops e, HttpServletRequest request) throws Exception {
        delObjImg.deleteImgs(dao.find(e).getCrop_img(),request);
        delObjImg.deleteImgs(dao.find(e).getType_img(),request);
        dao.delete(e);
    }

    @Override
    public void newDelBatch(Crops e, HttpServletRequest request) throws Exception {
        //删除对象中附带的图片
        for(int i=0;i<e.getData().size();i++){
           Crops sd = new Crops();
            sd.setCrop_id((String) e.getData().get(i));
            delObjImg.deleteImgs(dao.find(sd).getCrop_img(),request);
            delObjImg.deleteImgs(dao.find(sd).getType_img(),request);
        }
        dao.deleteBatch(e);
    }

}
