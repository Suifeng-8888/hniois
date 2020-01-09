package com.hniois.util;

import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;

public class delObjImg {

    //删除追溯系统中附带图片的方法
    public static void deleteImgs(String imgs,HttpServletRequest request){
        if(StringUtils.isNotEmpty(imgs)) {
            String strImg = imgs.substring(0,imgs.length()-1);
            String[] arr = strImg.split(",");
            for (String img : arr) {
                String savePath = request.getRealPath("/") + img;
                FileUtil.deleteFile(savePath);
            }
        }
    }
}
