package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.ScanDao;
import com.hniois.monitor.entity.*;
import com.hniois.monitor.service.*;
import com.hniois.trace.entity.QRcodeNew;
import com.hniois.trace.service.OrderManage;
import com.hniois.trace.service.QRcodeNewManage;
import com.hniois.util.DateUtil;
import com.hniois.util.UuidUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("scanService")
public class ScanService extends ServiceSupport<Scan,ScanDao> implements ScanManage {

    @Resource(name="scanDaoImpl")
    @Override
    public void setDao(ScanDao dao) {
        this.dao=dao;
    }

    @Resource(name="qRcodeNewService")
    private QRcodeNewManage qRcodeService;

    //订单对象
    @Resource(name="orderService")
    private OrderManage orderService;

    //检验报告
    @Resource(name="reportService")
    private ReportManage reportService;

    //采摘信息
    @Resource(name="harvestService")
    private HarvestManage harvestService;

    //打药信息
    @Resource(name="poisonService")
    private PoisonManage poisonService;

    //施肥信息
    @Resource(name="chemicalService")
    private ChemicalManage chemicalService;

    //生产基地
    @Resource(name="providersService")
    private ProvidersManage providersService;

    //播种信息
    @Resource(name="seedService")
    private SeedManage seedService;

    //二维码扫描
    @Resource(name="scanService")
    private ScanManage scanService;

    @Resource(name="randomService")
    private RandomManage randomService;//随机验证码

    /**
     * 手机查询防伪码显示数据接口
     * @return
     */

    public ScanRandom checkRandom(QRcodeNew e, Scan e2)throws Exception{

        ScanRandom random=new ScanRandom();
        if(StringUtils.isNotEmpty(e.getC_random())){
            //如果随机码不为空判断当前随机码是否存在
            if(qRcodeService.findCount(e)>0){
                //获取传过来的追溯码和防伪码
                QRcodeNew qcode = qRcodeService.find(e);
                //保存此次扫描信息
                Scan scan=new Scan();
                //说明随机码正确
                scan.setCrop_source(qcode.getSource_code());
                scan.setScan_time(DateUtil.getDay());
                //扫描产品信息
                scan.setScan_id(UuidUtil.get32UUID());
                scan.setCrop_name(qcode.getCrop());
                scan.setCrop_id(qcode.getCrop_id());
                scan.setUser_city(e2.getUser_city());
                scan.setUser_long(e2.getUser_long());
                scan.setUser_lat(e2.getUser_lat());
                scanService.save(scan);
                //获取随机码对象集合
                random.setCrop_source(e.getSource_code());
                List<ScanRandom> list= randomService.findList(random);

                if(list.size()>0){
                    random=list.get(0);
                    //说明不是第一次查询
                    random.setScan_nums(String.valueOf(Integer.parseInt(random.getScan_nums())+1));
                    randomService.update(random);
                    scan.setMsg("ok");

                }else{
                    //说明是第一次查询防伪码
                    random.setRandom_id(UuidUtil.get32UUID());
                    random.setCrop_id(qcode.getCrop_id());
                    random.setCrop_name(qcode.getCrop());
                    random.setCrop_source(qcode.getSource_code());
                    random.setScan_time(DateUtil.getTime());
                    random.setScan_nums("1");
                    random.setMsg("ok");
                    randomService.save(random);
                }
            }else{
                //说明随机码不正确
                random.setMsg("error");
            }
        }
            return random;
    }
    /**
     * 手机扫描二维码获取详细信息
     * @param e
     * @param e2
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> getInfo(QRcodeNew e, Scan e2)throws Exception {
        Map<String,Object> map=new HashMap<>();
        //根据扫描信息获取当前产品的crop_id;
        QRcodeNew qcode = qRcodeService.find(e);
        //根据扫描产品获取对应的检测信息
        Report rpt=new Report();
        rpt.setCrop_id(qcode.getCrop_id());
        List<Report> reportlist = reportService.findList(rpt);
        if(reportlist.size()>0){
            map.put("report",reportlist.get(0));
        }else{
            map.put("report",rpt);
        }

        //根据产品信息获取采摘信息
        Harvest hv=new Harvest();
        hv.setCrop_id(qcode.getCrop_id());
        List<Harvest> hlist = harvestService.findList(hv);
        if(hlist.size()>0){
            map.put("harvest",hlist.get(0));
        }else{
            map.put("harvest",hv);
        }
        //根据二维码信息获取生成基地信息
        Providers pd=new Providers();
        pd.setP_id(qcode.getFarm_id());
        pd=providersService.find(pd);
        map.put("farm",pd);
        //根据产品ID获取最新的播种信息
        Seed sd=new Seed();
        sd.setCrop_id(qcode.getCrop_id());
        List<Seed> slist = seedService.findList(sd);
        if(slist.size()>0){
            map.put("seed",slist.get(0));
        }else{
            map.put("seed",sd);
        }
        //根据产品ID获取打药信息
        Poison pson=new Poison();
        pson.setCrop_id(qcode.getCrop_id());
        List<Poison> plist=poisonService.findList(pson);
        if(plist.size()>0){
            map.put("poison",plist.get(0));
        }else{
            map.put("poison",pson);
        }
        //获取施肥信息
        Chemical chl=new Chemical();
        chl.setCrop_id(qcode.getCrop_id());
        List<Chemical> clist=chemicalService.findList(chl);
        if (clist.size()>0){
            map.put("chemical",clist.get(0));
        }else{
            map.put("chemical",chl);
        }
        //获取客户扫描信息
        Scan scan=new Scan();
        String sid= UuidUtil.get32UUID();
        scan.setScan_id(sid);
        //扫描时间
        String ntime= DateUtil.getDay();
        scan.setScan_time(ntime);
        //扫描产品信息
        scan.setCrop_name(qcode.getCrop());
        scan.setCrop_id(qcode.getCrop_id());
        scan.setCrop_source(qcode.getSource_code());
        scan.setUser_city(e2.getUser_city());
        scan.setUser_long(e2.getUser_long());
        scan.setUser_lat(e2.getUser_lat());
        dao.save(scan);
        return map;
    }

    //手机扫描区域统计数据
    @Override
    public List<Scan> areaNum(Scan e) throws Exception {
        return dao.areaNum(e);
    }

    //产品手机扫描量前四位统计信息
    @Override
    public List<Scan> cropNum(Scan e) throws Exception {
        return dao.cropNum(e);
    }

    //产品手机扫描量其他统计信息
    @Override
    public Scan others(Scan e) throws Exception {
        return dao.others(e);
    }

    @Override
    public List<Map<String, Object>> scanHot() throws Exception {
        return dao.scanHot();
    }

    @Override
    public List<Scan> scanType(Scan e) throws Exception {
        return dao.scanType(e);
    }

    @Override
    public List<Scan> scanNum(Scan e) throws Exception {
        return dao.scanNum(e);
    }


}
