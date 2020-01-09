package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * Create By javaMan
 * 2018/10/15  13:44
 * 产品召回信息
 */
public class Recall extends Page {

    private String r_id;// 召回ID
    private String crop_name;// 召回产品
    private String crop_id;// 产品ID
    private String farm_id;//生产基地ID
    private String farm_name;//生产基地名称
    private String cause;// 召回原因
    private String time;// 发布时间
    private String status;// 召回状态
    private String org_name;// 召回发布机构
    private String org_id;// 发布机构ID
    private String rank;// 发布机构等级
    private String r_num;//召回数量


    public String getR_id() {
        return r_id;
    }

    public void setR_id(String r_id) {
        this.r_id = r_id;
    }

    public String getCrop_name() {
        return crop_name;
    }

    public void setCrop_name(String crop_name) {
        this.crop_name = crop_name;
    }

    public String getCrop_id() {
        return crop_id;
    }

    public void setCrop_id(String crop_id) {
        this.crop_id = crop_id;
    }

    public String getOrg_id() {
        return org_id;
    }

    public void setOrg_id(String org_id) {
        this.org_id = org_id;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public String getOrg_name() {
        return org_name;
    }

    public void setOrg_name(String org_name) {
        this.org_name = org_name;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }

    public String getFarm_name() {
        return farm_name;
    }

    public void setFarm_name(String farm_name) {
        this.farm_name = farm_name;
    }

    public String getR_num() {
        return r_num;
    }

    public void setR_num(String r_num) {
        this.r_num = r_num;
    }
}
