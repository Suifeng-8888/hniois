package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Output;

/**
 * Create By javaMan
 * 2018/12/3  9:12
 *
 * 基地准出 service
 */
public interface OutputService extends Service<Output> {

    //基地新增准出
    public void newSave(Output e)throws Exception;
    //基地删除准出
    public void newDelete(Output e)throws Exception;
}
