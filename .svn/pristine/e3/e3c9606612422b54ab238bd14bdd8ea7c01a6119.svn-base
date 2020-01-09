package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Poison;

import javax.servlet.http.HttpServletRequest;

public interface PoisonManage extends Service<Poison> {
    //删除对象中附带的图片
    public void newDel(Poison e, HttpServletRequest request) throws Exception;

    //批量删除对象时删除附带图片
    public void newDelBatch(Poison e,HttpServletRequest request) throws Exception;
}
