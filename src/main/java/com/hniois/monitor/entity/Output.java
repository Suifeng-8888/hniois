package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * Create By javaMan
 * 2018/12/3  9:00
 *  准出申请  entity
 */
public class Output extends Page {

    private String p_id;//申请ID
    private String farm_id;// 基地ID
    private String crop_id;// 产品ID
    private String crop_name;// 产品名称
    private String report_num;// 检测报告编号
    private String outfit_id;// 审核机构ID
    private String outfit_name;// 审核机构
    private String applyer;// 申请人
    private String apply_time;// 申请时间
    private String p_status;// 审批状态  1待审批  2 通过  3 未通过

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }

    public String getP_status() {
        return p_status;
    }

    public void setP_status(String p_status) {
        this.p_status = p_status;
    }

    public String getOutfit_name() {
        return outfit_name;
    }

    public void setOutfit_name(String outfit_name) {
        this.outfit_name = outfit_name;
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

    public String getReport_num() {
        return report_num;
    }

    public void setReport_num(String report_num) {
        this.report_num = report_num;
    }

    public String getOutfit_id() {
        return outfit_id;
    }

    public void setOutfit_id(String outfit_id) {
        this.outfit_id = outfit_id;
    }

    public String getApply_time() {
        return apply_time;
    }

    public void setApply_time(String apply_time) {
        this.apply_time = apply_time;
    }

    public String getApplyer() {
        return applyer;
    }

    public void setApplyer(String applyer) {
        this.applyer = applyer;
    }
}


