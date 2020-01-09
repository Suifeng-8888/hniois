package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * 随机防伪码次数统计表
 */
public class ScanRandom extends Page {
    private String random_id;//序号ID
    private String crop_id;//扫描产品ID
    private String crop_name;//扫描产品
    private String scan_time;//扫描时间
    private String crop_source;//扫描产品溯源码
    private String scan_nums;//随机码查询次数

    public String getRandom_id() {
        return random_id;
    }

    public void setRandom_id(String random_id) {
        this.random_id = random_id;
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

    public String getScan_time() {
        return scan_time;
    }

    public void setScan_time(String scan_time) {
        this.scan_time = scan_time;
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
