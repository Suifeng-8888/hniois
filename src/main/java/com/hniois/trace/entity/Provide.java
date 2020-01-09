package com.hniois.trace.entity;

import com.hniois.common.page.Page;

/**
 * Create By javaMan
 * 2018/6/28  10:33
 *  追溯  供应商 entity...
 */
public class Provide extends Page{

    private String name;
    private String licence;
    private String organization;
    private String site;
    private String phone;
    private String email;
    private String contact;
    private String provide_img;
    private String farm_id;//生产基地ID

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }

    public String getProvide_img() {
        return provide_img;
    }

    public void setProvide_img(String provide_img) {
        this.provide_img = provide_img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLicence() {
        return licence;
    }

    public void setLicence(String licence) {
        this.licence = licence;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
}
