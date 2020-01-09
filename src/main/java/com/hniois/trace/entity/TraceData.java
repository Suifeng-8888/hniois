package com.hniois.trace.entity;

import com.hniois.common.page.Page;

import java.util.Map;

/**
 * 追溯对象信息(填报数据)
 */
public class TraceData extends Page {
    private String dat_id;//追溯填报序号
    private String page_id;//包装材料id
    private String batch_id;//所属产品批次id
    private String data_name;//包装材料名称
    private String mat_sup;//包装材料供应商
    private String sup_id;//供应商ID
    private String use_num;//用料数量
    private String farm_id;//农场ID

    public String getPage_id() {
        return page_id;
    }

    public void setPage_id(String page_id) {
        this.page_id = page_id;
    }

    public String getMat_sup() {
        return mat_sup;
    }

    public void setMat_sup(String mat_sup) {
        this.mat_sup = mat_sup;
    }

    public String getUse_num() {
        return use_num;
    }

    public void setUse_num(String use_num) {
        this.use_num = use_num;
    }

    public String getDat_id() {
        return dat_id;
    }

    public void setDat_id(String dat_id) {
        this.dat_id = dat_id;
    }

    public String getBatch_id() { return batch_id; }

    public void setBatch_id(String batch_id) {
        this.batch_id = batch_id;
    }

    public String getData_name() {
        return data_name;
    }

    public void setData_name(String data_name) {
        this.data_name = data_name;
    }

    public String getSup_id() {
        return sup_id;
    }

    public void setSup_id(String sup_id) {
        this.sup_id = sup_id;
    }

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }
}
