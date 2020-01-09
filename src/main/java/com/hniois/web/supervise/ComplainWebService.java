package com.hniois.web.supervise;

import com.hniois.monitor.entity.Complain;
import com.hniois.monitor.entity.Crops;
import com.hniois.monitor.entity.Providers;
import com.hniois.monitor.service.ComplainService;
import com.hniois.monitor.service.CropsManage;
import com.hniois.monitor.service.ProvidersManage;
import com.hniois.trace.entity.QRcodeNew;
import com.hniois.trace.service.QRcodeNewManage;
import com.hniois.util.DateUtil;
import com.hniois.web.Message;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/9/19  17:58
 *
 * 投诉建议提交 接口
 */
@RequestMapping(value = "/webService/complain")
@RestController
public class ComplainWebService {

    @Resource(name = "complainService")
    private ComplainService complainService;

    @Resource(name="qRcodeNewService")
    private QRcodeNewManage qcodeService;

    @Resource(name="providersService")
    private ProvidersManage providerService;

    @Resource(name="cropService")
    private CropsManage cropService;
    /**
     *  投诉建议提交
     * @param complain
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Message saveComplain(Complain complain) {
        Message message = new Message(0, "添加成功!", "");
        try {
            String time=DateUtil.getDay();
            complain.setPut_time(time);
            //通过溯源码确定产品id,通过产品id确定生产基地ID和名称
            QRcodeNew qRcode=new QRcodeNew();
            qRcode.setSource_code(complain.getSource_code());
            qRcode=qcodeService.find(qRcode);
            Crops crop=new Crops();
            crop.setCrop_id(qRcode.getCrop_id());
            crop=cropService.find(crop);
            complain.setCrop_name(crop.getCrop_name());
            complain.setFarm_id(crop.getFarm_id());
            //通过农场农场id拿到农场名
            Providers p=new Providers();
            p.setP_id(crop.getFarm_id());
            p=providerService.find(p);
            complain.setFarm_name(p.getP_name());
            complainService.save(complain);
        } catch (Exception e) {
            message.setCode(1);
            message.setMsg("添加失败!");
            e.printStackTrace();
        }
        return message;
    }

    //判断当前追溯码是否存在
    @RequestMapping("/exist")
    public String exist(QRcodeNew e)throws Exception{
        int num = qcodeService.findCount(e);
        return String.valueOf(num);
    }
}
