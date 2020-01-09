package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * 打药
 */
public class Poison extends Page {
    private String pid;//主键
    private String crop;//作物名称
    private String crop_id;//作物id
    private String pname;//农药名称
    private String buy_id;//采购ID
    private String p_time;//打药时间
    private String person;//打药人
    private String farm_id;//生产基地ID
    private String p_img;//打药图片

   //***********************临时调用
    private String p_path;//临时使用

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
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

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getBuy_id() {
        return buy_id;
    }

    public void setBuy_id(String buy_id) {
        this.buy_id = buy_id;
    }

    public String getP_time() {
        return p_time;
    }

    public void setP_time(String p_time) {
        this.p_time = p_time;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }

    public String getP_img() {
        return p_img;
    }

    public void setP_img(String p_img) {
        this.p_img = p_img;
    }

    public String getP_path() {
        return p_path;
    }

    public void setP_path(String p_path) {
        this.p_path = p_path;
    }
}
