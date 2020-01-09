package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * Create By javaMan
 * 2018/8/24  9:57
 * 监管机构
 */
public class Outfit extends Page{

    private String name;// 监管机构名称
    private String number;//  监管机构代码
    private String grade;// 监管机构级别 1乡/镇 2县/区 3 市
    private String area;//  所属区域
    private String site;//  详细地址
    private String charge;// 负责人
    private String phone;// 负责人电话

    //后续添加的字段属性
    private String p_city;//所属市

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getP_city() {
        return p_city;
    }

    public void setP_city(String p_city) {
        this.p_city = p_city;
    }

}
