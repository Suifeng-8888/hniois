package com.hniois.web.supervise;

import com.hniois.monitor.entity.Outfit;
import com.hniois.monitor.service.OutfitService;
import com.hniois.util.Const;
import com.hniois.util.SessionManager;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/9/20  11:15
 * 监管机构web接口
 */
@RequestMapping(value = "/webService/outfit")
@RestController
public class OutfitWebService {

    @Resource(name = "outfitService")
    private OutfitService outfitService;

    /**
     * 监管机构信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Outfit getOutfit(@PathVariable("id") Integer id) throws Exception {
        Outfit outfit = new Outfit();
        outfit.setId(id.toString());
        return outfitService.find(outfit);
    }

    /**
     * 监管机构列表
     * @param outfit
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public List<Outfit> getOutfitList(Outfit outfit) throws Exception {
        if(outfit.getMsg().equals("OUTFIT_ADMIN")){
            //获取当前监管机构对象
            Outfit oft=new Outfit() ;
            oft.setId(SessionManager.getFarmID());//监管机构ID
            oft.setName(SessionManager.getFarmName());//监管机构名称
            oft=outfitService.find(oft);
            //获取监管机构登记
            if(oft.getGrade().equals("2")){//说明是区级机构
                //设置要查询的生产基地区域
                outfit.setArea(oft.getArea());
            }else if(oft.getGrade().equals("3")){//说明是市级机构
                outfit.setP_city(oft.getP_city());
            }
        }
        return outfitService.findList(outfit);
    }

    /**
     * 新增一条监管机构信息
     * @param outfit
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Message saveOutfit(Outfit outfit) {
        Message message = new Message(0, "添加成功!", "");
        try {
            outfitService.save(outfit);
        } catch (Exception e) {
            message.setCode(1);
            message.setMsg("添加失败!");
            e.printStackTrace();
        }
        return message;
    }

    /**
     * 监管机构信息删除
     * @param id
     * @return
     */
//    @RequestMapping(value = "/del/{id}", method = RequestMethod.DELETE)
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delOutfit(@PathVariable("id") Integer id) {
        Message message = new Message();
        if(id != null) {
            Outfit outfit = new Outfit();
            outfit.setId(id.toString());
            try {
                outfitService.delete(outfit);
                message.setCode(0);
                message.setMsg("删除成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("删除失败!");
                e.printStackTrace();
            }
        }
        return message;
    }

    /**
     * 更新监管部门信息
     * @param outfit
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message updateOutfit(Outfit outfit) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(outfit.getId())) {
            try {
                outfitService.update(outfit);
                message.setCode(0);
                message.setMsg("更新成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("更新失败!");
                e.printStackTrace();
            }
        }
        return message;
    }

}
