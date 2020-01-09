package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.ApproveDao;
import com.hniois.monitor.entity.Approve;
import com.hniois.monitor.entity.Output;
import com.hniois.monitor.service.ApproveManage;
import com.hniois.monitor.service.OutputService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("approveService")
public class ApproveService extends ServiceSupport<Approve,ApproveDao> implements ApproveManage {

    @Resource(name="approveDaoImpl")

    @Override
    public void setDao(ApproveDao dao) {
        this.dao=dao;
    }

    @Resource(name="outputService")
    private OutputService outService;

    @Override
    public void newUpdate(Approve e) throws Exception {
        dao.update(e);
        //更改申请表中的状态
        Output op=new Output();
        op.setP_id(e.getP_id());
        op.setP_status(e.getP_state());
        outService.update(op);
    }
}
