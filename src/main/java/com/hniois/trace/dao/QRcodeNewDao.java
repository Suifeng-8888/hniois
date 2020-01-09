package com.hniois.trace.dao;

import com.hniois.common.dao.Dao;
import com.hniois.trace.entity.QRcodeNew;

import java.util.List;

public interface QRcodeNewDao extends Dao<QRcodeNew> {

    //重写批量更新方法
    void changeBatch(List e)throws Exception;
}
