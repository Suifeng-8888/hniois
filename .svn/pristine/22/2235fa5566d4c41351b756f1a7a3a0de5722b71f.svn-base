package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Report;

import javax.servlet.http.HttpServletRequest;

public interface ReportManage extends Service<Report> {

    //删除对象中附带的图片
    public void newDel(Report e, HttpServletRequest request) throws Exception;

    //批量删除对象时删除附带图片
    public void newDelBatch(Report e,HttpServletRequest request) throws Exception;
}
