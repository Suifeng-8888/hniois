package com.hniois.trace.entity;

import com.hniois.common.page.Page;

/**
 * trace_qcode 表对象
 */
public class QRcodeNew extends Page {

    private String code_id;//二维码ID
    private String source_code;//溯源码
    private String farm_id;//基地ID
    private String farm_name;//基地名称
    private String crop;//产品名称
    private String crop_id;//产品ID
    private String c_random;//随机防伪码
    private String rule_code;//国家编码
    private String q_code;//顺序码
    private String c_nums;//是否已导出 0未导出 1 已导出

    //**********************临时调用
    private String ck_select;//存放导出时选择的数据
    private String begin;//开始码
    private String end;//结束码

    public String getCode_id() {
        return code_id;
    }

    public void setCode_id(String code_id) {
        this.code_id = code_id;
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

    public String getC_random() {
        return c_random;
    }

    public void setC_random(String c_random) {
        this.c_random = c_random;
    }

    public String getRule_code() {
        return rule_code;
    }

    public void setRule_code(String rule_code) {
        this.rule_code = rule_code;
    }

    public String getQ_code() {
        return q_code;
    }

    public void setQ_code(String q_code) {
        this.q_code = q_code;
    }

    public String getC_nums() {
        return c_nums;
    }

    public void setC_nums(String c_nums) {
        this.c_nums = c_nums;
    }

    public String getBegin() {
        return begin;
    }

    public void setBegin(String begin) {
        this.begin = begin;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getCk_select() {
        return ck_select;
    }

    public void setCk_select(String ck_select) {
        this.ck_select = ck_select;
    }

    public String getSource_code() {
        return source_code;
    }

    public void setSource_code(String source_code) {
        this.source_code = source_code;
    }
}
