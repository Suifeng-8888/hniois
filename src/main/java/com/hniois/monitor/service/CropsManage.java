package com.hniois.monitor.service;

import com.hniois.common.service.Service;
import com.hniois.monitor.entity.Crops;
import com.hniois.monitor.entity.Seed;

import javax.servlet.http.HttpServletRequest;
import java.util.Random;

public interface CropsManage extends Service<Crops> {
    /**
     * 随机生成六位数验证码
     * @return
     */
    String getRandomNum();

    String getMark()throws Exception;

    //删除对象中附带的图片
    void newDel(Crops e, HttpServletRequest request) throws Exception;

    //批量删除对象时删除附带图片
    void newDelBatch(Crops e,HttpServletRequest request) throws Exception;
}
