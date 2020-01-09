package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * 准出审批
 */
public class Approve extends Page {
    private String aid;//审批ID
    private String farm_id;// 基地ID
    private String farm_name;// 基地名称
    private String apply_time;//申请时间
    private String p_id;// 申请ID
    private String crop_name;// 产品名称
    private String report_num;// 检测报告编号
    private String outfit_id;// 审核机构ID
    private String outfit_name;// 审核机构
    private String approver;// 审批人
    private String approve_time;// 审批时间
    private String p_state;// 审批状态  1待审批  2 通过  3 未通过
    private String contents;//审批注释


    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
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

    public String getCrop_name() {
        return crop_name;
    }

    public void setCrop_name(String crop_name) {
        this.crop_name = crop_name;
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

    public String getOutfit_name() {
        return outfit_name;
    }

    public void setOutfit_name(String outfit_name) {
        this.outfit_name = outfit_name;
    }

    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }

    public String getApprove_time() {
        return approve_time;
    }

    public void setApprove_time(String approve_time) {
        this.approve_time = approve_time;
    }

    public String getP_state() {
        return p_state;
    }

    public void setP_state(String p_state) {
        this.p_state = p_state;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getApply_time() {
        return apply_time;
    }

    public void setApply_time(String apply_time) {
        this.apply_time = apply_time;
    }
}
