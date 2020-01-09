package com.hniois.trace.service;

import com.hniois.common.service.Service;
import com.hniois.trace.entity.Batch_Material;

import javax.servlet.http.HttpServletRequest;

public interface BatchManage extends Service<Batch_Material> {

    //重写删除和批量删除方法

    public void newDel(Batch_Material e,HttpServletRequest request)throws Exception;
}
