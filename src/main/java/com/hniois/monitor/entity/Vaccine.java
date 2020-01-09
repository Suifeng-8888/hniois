package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * 家畜疫苗表
 */
public class Vaccine extends Page {

    //va_id,var_name,var_time,var_doctor,breed_id
    private String va_id;//疫苗编号
    private String var_name;//疫苗名称
    private String var_time;//打疫苗时间
    private String var_num;//注射量
    private String var_doctor;//打疫苗的兽医
    private String breed_id;//家畜编号

    public String getVa_id() {
        return va_id;
    }

    public void setVa_id(String va_id) {
        this.va_id = va_id;
    }

    public String getVar_name() {
        return var_name;
    }

    public String getVar_num() {
        return var_num;
    }

    public void setVar_num(String var_num) {
        this.var_num = var_num;
    }

    public void setVar_name(String var_name) {
        this.var_name = var_name;
    }

    public String getVar_time() {
        return var_time;
    }

    public void setVar_time(String var_time) {
        this.var_time = var_time;
    }

    public String getVar_doctor() {
        return var_doctor;
    }

    public void setVar_doctor(String var_doctor) {
        this.var_doctor = var_doctor;
    }

    public String getBreed_id() {
        return breed_id;
    }

    public void setBreed_id(String breed_id) {
        this.breed_id = breed_id;
    }
}
