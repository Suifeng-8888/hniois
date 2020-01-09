package com.hniois.monitor.dao;

import com.hniois.common.dao.Dao;
import com.hniois.monitor.entity.Scan;

import java.util.List;
import java.util.Map;

public interface ScanDao extends Dao<Scan> {

    //扫码区域分布接口
    public List<Scan> areaNum(Scan e)throws Exception;

    //产品扫码量前四位统计
    public List<Scan> cropNum(Scan e) throws Exception;

    //产品扫码量其他统计
    public Scan others(Scan e)throws Exception;
    //热点产品统计
    List<Map<String,Object>> scanHot() throws Exception;
    //产品分类扫码量占比
    public List<Scan> scanType(Scan e)throws Exception;

    //最近半年月度产品扫码总量走势
    public List<Scan> scanNum(Scan e)throws Exception;
}
