package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.OutputDao;
import com.hniois.monitor.entity.Approve;
import com.hniois.monitor.entity.Output;
import com.hniois.monitor.service.ApproveManage;
import com.hniois.monitor.service.OutputService;
import com.hniois.util.SessionManager;
import com.hniois.util.UuidUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/12/3  9:14
 *  基地准出  ServiceImpl
 */
@Service(value = "outputService")
public class OutputServiceImpl extends ServiceSupport<Output, OutputDao> implements OutputService {

    @Resource(name = "outputDao")
    @Override
    public void setDao(OutputDao dao) {
        this.dao = dao;
    }

    @Resource(name="approveService")
    private ApproveManage approveService;//准出审批

    @Override
    public void newSave(Output e) throws Exception{
        //先不增加系统主动判断当前产品之前的审批情况了,如果有需要后续再增加
        String uid=UuidUtil.get32UUID();
            e.setP_id(uid);
            dao.save(e);
         //同时新增监管机构的申请
        Approve approve=new Approve();
        approve.setCrop_name(e.getCrop_name());
        approve.setP_id(uid);
        approve.setApply_time(e.getApply_time());
        approve.setAid(UuidUtil.get32UUID());
        approve.setFarm_id(e.getFarm_id());
        approve.setFarm_name(SessionManager.getFarmName());
        approve.setOutfit_id(e.getOutfit_id());
        approve.setOutfit_name(e.getOutfit_name());
        approve.setReport_num(e.getReport_num());
        approveService.save(approve);
    }

    @Override
    public void newDelete(Output e)throws Exception {
            dao.delete(e);
            //同时删除监管机构的申请信息
            Approve approve=new Approve();
            approve.setP_id(e.getP_id());
            if(approveService.findCount(approve)>0){
                //说明监管机构的申请信息还在,则同步删除
                approve=approveService.find(approve);
                approveService.delete(approve);
            }

    }
}
