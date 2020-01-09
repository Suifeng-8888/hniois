package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

import java.lang.reflect.Field;
/**
 *  Providers Bean
 */
public class Providers extends Page{
    /**基础字段
     ************************************************************/
    private String p_id; //基地id
    private String p_name; //基地名称
    private String p_form; //组织形式
    private String p_industry; //所属行业 种植业/畜禽业/水产业
    private String p_category; //企业类型  龙头企业/家庭农场/专业合作社/其他
    private String p_register; //营业执照代码
    private String p_time; //营业期限
    private String p_address; //详细地址
    private String p_phone; //电话号码
    private String p_area;//所属区域
    private String p_city;//所属区域
    private String p_province;//所属区域
    private String p_longitude; //经度
    private String p_latitude; //纬度
    private String p_qualifications; //企业资质
    private String p_person;// 基地法人

    private String p_certificate; // 备用

    private String p_path;//临时使用

//    2018-11-28 添加字段
    private String brief; // 企业简介
    private String website; // 企业网址

    public String getP_phone() {
        return p_phone;
    }

    public void setP_phone(String p_phone) {
        this.p_phone = p_phone;
    }

    public String getP_person() {
        return p_person;
    }

    public void setP_person(String p_person) {
        this.p_person = p_person;
    }

    public String getP_path() {
        return p_path;
    }

    public void setP_path(String p_path) {
        this.p_path = p_path;
    }

    public String getP_longitude() {
        return p_longitude;
    }

    public void setP_longitude(String p_longitude) {
        this.p_longitude = p_longitude;
    }

    public String getP_latitude() {
        return p_latitude;
    }

    public void setP_latitude(String p_latitude) {
        this.p_latitude = p_latitude;
    }

    public String getP_qualifications() {
        return p_qualifications;
    }

    public void setP_qualifications(String p_qualifications) {
        this.p_qualifications = p_qualifications;
    }

    /*************************************************************/

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_form() {
        return p_form;
    }

    public void setP_form(String p_form) {
        this.p_form = p_form;
    }

    public String getP_industry() {
        return p_industry;
    }

    public void setP_industry(String p_industry) {
        this.p_industry = p_industry;
    }

    public String getP_category() {
        return p_category;
    }

    public void setP_category(String p_category) {
        this.p_category = p_category;
    }

    public String getP_certificate() {
        return p_certificate;
    }

    public void setP_certificate(String p_certificate) {
        this.p_certificate = p_certificate;
    }

    public String getP_register() {
        return p_register;
    }

    public void setP_register(String p_register) {
        this.p_register = p_register;
    }

    public String getP_time() {
        return p_time;
    }

    public void setP_time(String p_time) {
        this.p_time = p_time;
    }

    public String getP_address() {
        return p_address;
    }

    public void setP_address(String p_address) {
        this.p_address = p_address;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getP_area() {
        return p_area;
    }

    public void setP_area(String p_area) {
        this.p_area = p_area;
    }

    public String getP_city() {
        return p_city;
    }

    public void setP_city(String p_city) {
        this.p_city = p_city;
    }

    public String getP_province() {
        return p_province;
    }

    public void setP_province(String p_province) {
        this.p_province = p_province;
    }
}
