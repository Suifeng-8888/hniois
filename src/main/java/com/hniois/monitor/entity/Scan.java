package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * 二维码扫描记录对象
 */
public class Scan extends Page {
    //
    private String scan_id;//序号ID
    private String crop_id;//扫描产品ID
    private String crop_name;//扫描产品
    private String scan_time;//扫描时间
    private String user_city;//扫描城市
    private String user_long;//经度
    private String user_lat;//纬度
    private String crop_source;//扫描产品溯源码
    private String scan_nums;//随机码查询次数
    //*******************临时调用一下
    private String other;


    public String getScan_id() {
        return scan_id;
    }

    public void setScan_id(String scan_id) {
        this.scan_id = scan_id;
    }

    public String getScan_time() {
        return scan_time;
    }

    public void setScan_time(String scan_time) {
        this.scan_time = scan_time;
    }

    public String getUser_city() {
        return user_city;
    }

    public void setUser_city(String user_city) {
        this.user_city = user_city;
    }

    public String getUser_long() {
        return user_long;
    }

    public void setUser_long(String user_long) {
        this.user_long = user_long;
    }

    public String getUser_lat() {
        return user_lat;
    }

    public void setUser_lat(String user_lat) {
        this.user_lat = user_lat;
    }

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

    public String getOther() {
        return "其他";
    }

    public void setOther(String other) {
        this.other = other;
    }

    public String getCrop_source() {
        return crop_source;
    }

    public void setCrop_source(String crop_source) {
        this.crop_source = crop_source;
    }

    public String getScan_nums() {
        return scan_nums;
    }

    public void setScan_nums(String scan_nums) {
        this.scan_nums = scan_nums;
    }
}
