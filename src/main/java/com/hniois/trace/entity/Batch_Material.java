package com.hniois.trace.entity;

import com.hniois.common.page.Page;

import java.util.List;

/**
 * 批次用料对象，某一产品下的生产记录添加产品批次，然后再为该批次追加用料信息
 */
public class Batch_Material extends Page{
    private String batch_id;//包装ID
    private String crop;//产品名称
    private String crop_id;//产品ID
    private String batch;//包装批次
    private String btime;//加工时间
    private String bat_img;//包装图片
    private String farm_id;//生产基地ID
    private String person;//包装负责人
    private String storage;//存储条件
    private String weight;//净含量
    private String quality_time;//保质期

    //***********************临时使用
    private String bat_path;//临时包装图片路径

    public String getBatch_id() {
        return batch_id;
    }

    public void setBatch_id(String batch_id) {
        this.batch_id = batch_id;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getBtime() {
        return btime;
    }

    public void setBtime(String btime) {
        this.btime = btime;
    }

    public String getBat_img() {
        return bat_img;
    }

    public void setBat_img(String bat_img) {
        this.bat_img = bat_img;
    }

    public String getBat_path() {
        return bat_path;
    }

    public void setBat_path(String bat_path) {
        this.bat_path = bat_path;
    }

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getQuality_time() {
        return quality_time;
    }

    public void setQuality_time(String quality_time) {
        this.quality_time = quality_time;
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
}
