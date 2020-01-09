package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * Create By javaMan
 * 2018/8/28  11:55
 * 投诉建议  Entity
 */
public class Complain extends Page {

    private String put_name;//  投诉人姓名
    private String put_phone;// 联系电话
    private String put_content;//   投诉/建议内容
    private String put_time;//  提交时间
    private String reply_way;//    回复方式  短信/电话/电子邮件
    private String reply_time;//    回复时间
    private String reply_content;// 处理结果
    private String status;//   状态  1 未回复 2 已回复未解决 3 已解决

    private String p_type;//投诉或检验 0投诉 1建议
    private String source_code;//相关产品追溯码
    private String crop_name;//产品名称

    private String farm_id;//基地ID
    private String farm_name;//基地名称

    //*************临时使用
    private String advice;//建议
    private String warn;//警告

    public String getPut_name() {
        return put_name;
    }

    public void setPut_name(String put_name) {
        this.put_name = put_name;
    }

    public String getPut_phone() {
        return put_phone;
    }

    public void setPut_phone(String put_phone) {
        this.put_phone = put_phone;
    }

    public String getPut_content() {
        return put_content;
    }

    public void setPut_content(String put_content) {
        this.put_content = put_content;
    }

    public String getPut_time() {
        return put_time;
    }

    public void setPut_time(String put_time) {
        this.put_time = put_time;
    }

    public String getReply_time() {
        return reply_time;
    }

    public void setReply_time(String reply_time) {
        this.reply_time = reply_time.substring(0, reply_time.length() - 2);
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getP_type() {
        return p_type;
    }

    public void setP_type(String p_type) {
        this.p_type = p_type;
    }

    public String getSource_code() {
        return source_code;
    }

    public void setSource_code(String source_code) {
        this.source_code = source_code;
    }

    public String getCrop_name() {
        return crop_name;
    }

    public void setCrop_name(String crop_name) {
        this.crop_name = crop_name;
    }

    public String getReply_way() {
        return reply_way;
    }

    public void setReply_way(String reply_way) {
        this.reply_way = reply_way;
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

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    public String getWarn() {
        return warn;
    }

    public void setWarn(String warn) {
        this.warn = warn;
    }
}
