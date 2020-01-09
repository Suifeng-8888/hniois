package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

public class Crops extends Page {
    //crop_id crop_name farm_id crop_type type_img crop_img crop_desc
    private String crop_id;//产品Id
    private String crop_name;//产品名称
    private String crop_mark;//产品标记
    private String farm_id;//基地ID
    private String crop_type;//产品三品一标分类
    private String type_img;//资质证书
    private String crop_img;//产品图片
    private String crop_desc;//产品描述
    private String ctype;//产品分类 蔬菜/水果/中草药/食用菌/其他


    //*********************临时使用属性
    private String type_path;
    private String crop_path;
    private String p_name;//基地名称

    public String getCrop_id() {
        return crop_id;
    }

    public void setCrop_id(String crop_id) {
        this.crop_id = crop_id;
    }

    public String getCrop_name() {
        return crop_name;
    }

    public void setCrop_name(String crop_name) {
        this.crop_name = crop_name;
    }

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }

    public String getCrop_type() {
        return crop_type;
    }

    public void setCrop_type(String crop_type) {
        this.crop_type = crop_type;
    }

    public String getType_img() {
        return type_img;
    }

    public void setType_img(String type_img) {
        this.type_img = type_img;
    }

    public String getCrop_img() {
        return crop_img;
    }

    public void setCrop_img(String crop_img) {
        this.crop_img = crop_img;
    }

    public String getCrop_desc() {
        return crop_desc;
    }

    public void setCrop_desc(String crop_desc) {
        this.crop_desc = crop_desc;
    }

    public String getType_path() {
        return type_path;
    }

    public void setType_path(String type_path) {
        this.type_path = type_path;
    }

    public String getCrop_path() {
        return crop_path;
    }

    public void setCrop_path(String crop_path) {
        this.crop_path = crop_path;
    }

    public String getCrop_mark() {
        return crop_mark;
    }

    public void setCrop_mark(String crop_mark) {
        this.crop_mark = crop_mark;
    }

    public String getCtype() {
        return ctype;
    }

    public void setCtype(String ctype) {
        this.ctype = ctype;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }
}
