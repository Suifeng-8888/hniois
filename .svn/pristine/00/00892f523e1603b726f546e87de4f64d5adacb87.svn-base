package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Seed;

import javax.servlet.http.HttpServletRequest;

/**
 *  Seed Manage
 */
public interface SeedManage extends Service<Seed>{

    //将str中的st字符串去掉
    String getNesStr(String st, String str)throws Exception;

    //删除对象中附带的图片
    void newDel(Seed e, HttpServletRequest request) throws Exception;

    //批量删除对象时删除附带图片
    void newDelBatch(Seed e,HttpServletRequest request) throws Exception;
}
