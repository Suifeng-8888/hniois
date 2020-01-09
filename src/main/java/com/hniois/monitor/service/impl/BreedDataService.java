package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.BreedDataDao;
import com.hniois.monitor.entity.Breed;
import com.hniois.monitor.entity.BreedData;
import com.hniois.monitor.service.BreedDataManage;
import com.hniois.monitor.service.BreedManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("breedDataService")
public class BreedDataService extends ServiceSupport<BreedData,BreedDataDao> implements BreedDataManage {

    @Resource(name="breedDataImpl")
    @Override
    public void setDao(BreedDataDao dao) {
        this.dao=dao;
    }

    @Resource(name="breedService")
    private BreedManage breedService;

    @Override
    public void newSave(BreedData e) throws Exception {
        dao.save(e);
        Breed bd=new Breed();
        bd.setBreed_id(e.getBreed_id());
        bd=breedService.find(bd);
        String nums=bd.getB_nums();
        String newNums=String.valueOf(Integer.parseInt(nums)+1);
        bd.setB_nums(newNums);
        breedService.update(bd);
    }

    @Override
    public void newDelete(BreedData e) throws Exception {
        BreedData bdata = dao.find(e);
        Breed bd=new Breed();
        bd.setBreed_id(bdata.getBreed_id());
        bd=breedService.find(bd);
        String nums=bd.getB_nums();
        String newNums=String.valueOf(Integer.parseInt(nums)-1);
        bd.setB_nums(newNums);
        breedService.update(bd);
        dao.delete(e);
    }
}
