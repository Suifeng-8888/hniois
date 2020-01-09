package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

public class Buy extends Page {
    private String farm_id;//生产基地ID
    private String b_category;//采购类别 1、化肥 2、种子3、农药4、其他
    private String provide_id;//供应商id
    private String b_provider;//供应商
    private String b_name;//物品名
    private String b_spec;//物品规格
    private String b_number;//采购数量
    private Double b_price;//采购单价
    private String b_time;//采购时间
    private String b_buyer;//采购人
    private Double total_cost;//采购总花费


    //*************************************临时调用
    private String btime;//开始日期 统计时筛选时间段用
    private String etime;//结束日期
    private String cost;//总费用

    public String getProvide_id() {
        return provide_id;
    }

    public void setProvide_id(String provide_id) {
        this.provide_id = provide_id;
    }

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }

    public String getB_category() {
        return b_category;
    }

    public void setB_category(String b_category) {
        this.b_category = b_category;
    }

    public String getB_provider() {
        return b_provider;
    }

    public void setB_provider(String b_provider) {
        this.b_provider = b_provider;
    }

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public String getB_spec() {
        return b_spec;
    }

    public void setB_spec(String b_spec) {
        this.b_spec = b_spec;
    }

    public String getB_number() {
        return b_number;
    }

    public void setB_number(String b_number) {
        this.b_number = b_number;
    }

    public Double getB_price() {
        return b_price;
    }

    public void setB_price(Double b_price) {
        this.b_price = b_price;
    }

    public String getB_time() {
        return b_time;
    }

    public void setB_time(String b_time) {
        this.b_time = b_time;
    }

    public String getB_buyer() {
        return b_buyer;
    }

    public void setB_buyer(String b_buyer) {
        this.b_buyer = b_buyer;
    }

    public Double getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(Double total_cost) {
        this.total_cost = total_cost;
    }

    public String getBtime() {
        return btime;
    }

    public void setBtime(String btime) {
        this.btime = btime;
    }

    public String getEtime() {
        return etime;
    }

    public void setEtime(String etime) {
        this.etime = etime;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }
}
