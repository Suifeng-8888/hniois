package com.hniois.web.supervise;

import com.hniois.monitor.entity.Approve;
import com.hniois.monitor.service.impl.ApproveService;
import com.hniois.util.Const;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**  监管机构   准出审核
 * Create By javaMan
 * 2018/12/21  16:42
 */
@RestController
@RequestMapping(value = "/webService/approve")
public class ApproveWebService {

    @Resource(name = "approveService")
    private ApproveService approveService;

    /**
     * 单个准出审核详情
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Approve getArticle(@PathVariable("id") String id) throws Exception {
        Approve approve = new Approve();
        approve.setAid(id);
        return approveService.find(approve);
    }

    /**
     * 监管部门  准出审核列表
     * @param approve
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public List<Approve> getApproveList(Approve approve, String bz, String dept_id) throws Exception {
        List<Approve> approves = new ArrayList<Approve>();
        if(Const.OUTFIT_ADMIN.equals(bz)) {
            approve.setFarm_id(dept_id);
            approves =  approveService.findList(approve);
        }
        return approves;
    }

    /**
     * 更新    准出审核
     * @param approve
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message updateApprove(Approve approve) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(approve.getAid())) {
            try {
                approveService.update(approve);
                message.setCode(0);
                message.setMsg("审核成功！");
            } catch (Exception e) {
                e.printStackTrace();
                message.setCode(1);
                message.setMsg("更新审核失败！");
            }
        } else {
            message.setCode(1);
            message.setMsg("参数不能为空！");
        }
        return message;
    }
}
