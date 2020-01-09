package com.hniois.web.trace;

import com.hniois.trace.entity.QRcodeNew;
import com.hniois.trace.service.QRcodeNewManage;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/** web  追溯码搜索
 * Create By javaMan
 * 2019/1/17  16:26
 */
@RestController
@RequestMapping(value = "/webService/code")
public class codeSearchWeb {

//    二维码service
    @Resource(name = "qRcodeNewService")
    private QRcodeNewManage qRcodeNewService;

    /**
     * web 端 追溯码 搜索框 访问接口
     * @param code
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public Map<String,Object> webCodeSearch(String code) {
        Map<String,Object> map = new HashMap<>();
        if(StringUtils.isNotEmpty(code)) {
            QRcodeNew qrcode = new QRcodeNew();
            qrcode.setSource_code(code);
            map.put("qrcode",qrcode);


        }
        return map;
    }


}
