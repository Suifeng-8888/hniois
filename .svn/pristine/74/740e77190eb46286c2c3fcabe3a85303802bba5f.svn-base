package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Harvest;

import javax.servlet.http.HttpServletRequest;

public interface HarvestManage extends Service<Harvest> {

    //删除对象中附带的图片
    public void newDel(Harvest e, HttpServletRequest request) throws Exception;

    //批量删除对象时删除附带图片
    public void newDelBatch(Harvest e,HttpServletRequest request) throws Exception;
}
