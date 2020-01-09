package com.hniois.trace.entity;

import com.hniois.common.page.Page;

/**
 * 订单运输详情
 */

public class Transport extends Page {
    private String trans_id;//运输ID
    private String order_id;//订单ID
    private String company;//运输公司
    private String plate_num;//车牌号
    private String driver ;//司机

    public String getTrans_id() {
        return trans_id;
    }

    public void setTrans_id(String trans_id) {
        this.trans_id = trans_id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPlate_num() {
        return plate_num;
    }

    public void setPlate_num(String plate_num) {
        this.plate_num = plate_num;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }
}
