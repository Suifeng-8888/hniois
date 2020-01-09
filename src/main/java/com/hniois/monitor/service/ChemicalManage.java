package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Chemical;

import javax.servlet.http.HttpServletRequest;

/**
 *  Chemical Manage
 */
public interface ChemicalManage extends Service<Chemical>{

    //删除对象中附带的图片
    public void newDel(Chemical e, HttpServletRequest request) throws Exception;

    //批量删除对象时删除附带图片
    public void newDelBatch(Chemical e,HttpServletRequest request) throws Exception;
}
