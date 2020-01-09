package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

public class Seed extends Page {
    //s_id,s_name,s_time,state,nums,sup_id,tool,people,soil_id,bz
    private String s_id;//播种ID
    private String crop;//作物名称
    private String crop_id;//作物ID
    private String s_name;//种子名称
    private String buy_id;//采购编号
    private String s_time;//播种时间
    private String tool;//所用工具 0 机器 1人工
    private String s_img;//生长状况
    private String s_descr;//图片信息描述
    private String people;//播种负责人
    private String farm_id;//生产基地ID
    private String bz;//备注


    //*********************临时调用
    private String s_path;//临时调用
    private String des_temp;//更改图片时临时使用

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_time() {
        return s_time;
    }

    public void setS_time(String s_time) {
        this.s_time = s_time;
    }

    public String getTool() {
        return tool;
    }

    public void setTool(String tool) {
        this.tool = tool;
    }

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getS_img() {
        return s_img;
    }

    public void setS_img(String s_img) {
        this.s_img = s_img;
    }

    public String getS_path() {
        return s_path;
    }

    public void setS_path(String s_path) {
        this.s_path = s_path;
    }

    public String getS_descr() {
        return s_descr;
    }

    public void setS_descr(String s_descr) {
        this.s_descr = s_descr;
    }

    public String getDes_temp() {
        return des_temp;
    }

    public void setDes_temp(String des_temp) {
        this.des_temp = des_temp;
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
