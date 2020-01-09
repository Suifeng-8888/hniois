package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

public class Chemical extends Page {

    private String id;//施肥编号
    private  String crop;//作物名称
    private String crop_id;//作物ID
    private String cname;//化肥名称
    private String buy_id;//采购ID
    private String c_time;//施肥时间
    private String method;//施肥方法 0机器 1人工
    private String person;//施肥负责人人
    private String farm_id;//生产基地ID
    private String c_img;//施肥图片

   //*********************临时调用
    private String c_path;//临时使用


    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getC_time() {
        return c_time;
    }

    public void setC_time(String c_time) {
        this.c_time = c_time;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getC_img() {
        return c_img;
    }

    public void setC_img(String c_img) {
        this.c_img = c_img;
    }

    public String getC_path() {
        return c_path;
    }

    public void setC_path(String c_path) {
        this.c_path = c_path;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getCrop() {
        return crop;
    }

    public void setCrop(String crop) {
        this.crop = crop;
    }

    public String getCrop_id() {
        return crop_id;
    }

    public void setCrop_id(String crop_id) {
        this.crop_id = crop_id;
    }

    public String getBuy_id() {
        return buy_id;
    }

    public void setBuy_id(String buy_id) {
        this.buy_id = buy_id;
    }
}
