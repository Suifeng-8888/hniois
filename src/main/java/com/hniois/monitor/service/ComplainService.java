package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Complain;

import java.util.List;
import java.util.Map;

/**
 * Create By javaMan
 * 2018/8/28  14:37
 */
public interface ComplainService extends Service<Complain> {
    List<Map<String,Object>> statistics() throws Exception;

    //重新写的获取投诉建议的方法
    List<Complain> warnAndAdvice()throws Exception;
}
