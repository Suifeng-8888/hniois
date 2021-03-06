package com.hniois.monitor.dao;

import com.hniois.common.dao.Dao;
import com.hniois.monitor.entity.Complain;

import java.util.List;
import java.util.Map;

/**
 * Create By javaMan
 * 2018/8/28  12:01
 */
public interface ComplainDao extends Dao<Complain> {

    List<Map <String,Object>> statistics() throws Exception;
    //重新写的获取投诉建议的方法
    List<Complain> warnAndAdvice()throws Exception;
}
