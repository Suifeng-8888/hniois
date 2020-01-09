package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.BreedDao;
import com.hniois.monitor.entity.Breed;
import com.hniois.monitor.entity.BreedData;
import com.hniois.monitor.entity.Vaccine;
import com.hniois.monitor.service.BreedDataManage;
import com.hniois.monitor.service.BreedManage;
import com.hniois.monitor.service.VaccineManage;
import com.hniois.util.FileUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service("breedService")
public class BreedService extends ServiceSupport<Breed,BreedDao> implements BreedManage {

    @Resource(name="breedDaoImpl")
    @Override
    public void setDao(BreedDao dao) {
        this.dao=dao;
    }

    @Resource(name="breedDataService")
    private BreedDataManage breedDataService;

    @Resource(name="vaccineService")
    private VaccineManage vaccineService;

    @Override
    public void newDelete(Breed e,HttpServletRequest request) throws Exception{

        //删除附带的每头家畜信息
        BreedData bdata=new BreedData();
        bdata.setBreed_id(e.getBreed_id());
        breedDataService.delete(bdata);
        //同时删除附带的疫苗信息
        Vaccine vacine=new Vaccine();
        vacine.setBreed_id(e.getBreed_id());
        vaccineService.delete(vacine);
        //删除养殖批次附带的图片
        deleteImgs(dao.find(e).getBreed_img(),request);
        dao.delete(e);
    }

    @Override
    public void newDeleteBatch(Breed e,HttpServletRequest request) throws Exception {
        for(int i=0;i<e.getData().size();i++){
            //删除附带的疫苗信息
            Vaccine vacine=new Vaccine();
            vacine.setBreed_id((String) e.getData().get(i));
            vaccineService.delete(vacine);
            //删除附带的每头家畜信息
            BreedData bdata=new BreedData();
            bdata.setBreed_id((String) e.getData().get(i));
            breedDataService.delete(bdata);
            //删除养殖批次附带的图片
            Breed br=new Breed();
            br.setBreed_id((String) e.getData().get(i));
            deleteImgs(dao.find(br).getBreed_img(),request);

        }
        dao.deleteBatch(e);
    }

    //删除图片的方法
    public void deleteImgs(String imgs,HttpServletRequest request){
        if(StringUtils.isNotEmpty(imgs)) {
            String strImg=imgs.substring(0,imgs.length()-1);
            String[] arr=strImg.split(",");
            for (String img:arr) {
                String savePath = request.getRealPath("/") + img;
                FileUtil.deleteFile(savePath);
            }
        }
    }
}
