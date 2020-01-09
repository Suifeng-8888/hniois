package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.entity.Providers;
import com.hniois.monitor.service.ProvidersManage;
import com.hniois.trace.dao.QRcodeNewDao;
import com.hniois.trace.entity.QRcodeNew;
import com.hniois.trace.entity.temp.Temp;
import com.hniois.trace.entity.temp.newTemp;
import com.hniois.trace.service.QRcodeNewManage;
import com.hniois.util.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service("qRcodeNewService")
public class QRcodeNewService extends ServiceSupport<QRcodeNew,QRcodeNewDao> implements QRcodeNewManage{

    @Resource(name="qRcodeNewDaoImpl")

    @Override
    public void setDao(QRcodeNewDao dao) {
        this.dao=dao;
    }

    //农场
    @Resource(name="providersService")
    private ProvidersManage providersService;

    //获取国家规则码
    @Override
    public String getRuleCode() throws Exception {
        return UUID.randomUUID().toString();
    }

    //获取当前生产基地信息
    @Override
    public Providers getInfo() throws Exception {
        Providers p=new Providers();
        p.setP_id(SessionManager.getFarmID());
        return providersService.find(p);
    }

    //获取四位随机数
    @Override
    public String getRandomCode() {
        //获取100到1000之间的随机数
        String random=String.valueOf ((int)(Math.random()*1000+100));
        if(random.length()<4){//不够四位的前面补0
            random=0+random;
        }
        return random;
    }

    //根据顺序码获取追溯码
    @Override
    public String getSourceCode(int i) {

        //获取[10,100)之间的整数
        String st=String.valueOf((int)(Math.random()*90+10));
        String str=st+i;
        String sourceCode=this.getQRcode(str);
        return sourceCode;
    }

    //自动补成9位数
    @Override
    public String getQRcode(String num) {
        //判断当前字符串是否是9位数,不是的话前面补0
        switch(num.length()){
            case 2:num="0000000"+num;
                break;
            case 3:num="000000"+num;
                break;
            case 4:num="00000"+num;
                break;
            case 5:num="0000"+num;
                break;
            case 6:num="000"+num;
                break;
            case 7:num="00"+num;
                break;
            case 8:num="0"+num;
                break;
            default:num=num;
                break;
        }
        return num;
    }

    @Override
    public List<newTemp> goPrint(QRcodeNew e,HttpServletRequest request) throws Exception {
        //获取基地其他信息
        Providers p = this.getInfo();
        List<newTemp> list=new ArrayList<>();
        for(int i=0;i<e.getData().size();i++){
            String content = Const.H5Path;//图片内容
            newTemp nt=new newTemp();
            QRcodeNew qn=new QRcodeNew();
            String nid=(String) e.getData().get(i);
            if(nid.contains("?")){
               nid= nid.substring(0,nid.indexOf("?"));
            }
            qn.setCode_id(nid);
            qn=dao.find(qn);
            content+=qn.getRule_code()+"&q_code="+qn.getQ_code()+"&source_code="+qn.getSource_code();
            //生产二维码图片并返回图片保存路径
            String imgUrl=  this.createPic(request, Tools.getRandomNum()+qn.getQ_code(),content);
            nt.setMark(qn.getQ_code());
            nt.setWebsite(qn.getSource_code());
            nt.setName(p.getP_name());
            nt.setRandom(qn.getC_random());
            nt.setRule_code(qn.getRule_code());
            nt.setTel(p.getP_phone());
            nt.setImg(imgUrl);
            list.add(nt);
        }
        return list;
    }

    @Override
    public void changeBatch(List e) throws Exception {
        dao.changeBatch(e);
    }


    /**
     * 根据图片路径/格式/生成二维码图片
     */
    public String createPic(HttpServletRequest request, String pic_name, String content){
        //获取路径
        String path  =  request.getRealPath("") + "/temp/"+DateUtil.getDays()+"/";
        String savePath  =  request.getContextPath() + "temp/"+DateUtil.getDays()+"/";
        File dirFile = new File(path);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        //图片路径
        String imgPath =  path +pic_name + ".png";
        String imgPath2 =  savePath + pic_name + ".png";
        //二维码
        TwoDimensionCode handle = new TwoDimensionCode();
        String type = "png";
        handle.encoderQRCode(content,imgPath,type);
        return imgPath2;
    }
}
