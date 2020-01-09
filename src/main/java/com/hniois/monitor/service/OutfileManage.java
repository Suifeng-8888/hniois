package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Outfile;

import javax.servlet.http.HttpServletRequest;

public interface OutfileManage extends Service<Outfile> {

    //删除对象中附带的图片
    public void newDel(Outfile e, HttpServletRequest request) throws Exception;

    //批量删除对象时删除附带图片
    public void newDelBatch(Outfile e,HttpServletRequest request) throws Exception;
}
