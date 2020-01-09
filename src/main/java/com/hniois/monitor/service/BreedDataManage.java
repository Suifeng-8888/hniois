package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.BreedData;

public interface BreedDataManage extends Service<BreedData> {

    public void newSave(BreedData e)throws Exception;
    public void newDelete(BreedData e)throws Exception;
}
