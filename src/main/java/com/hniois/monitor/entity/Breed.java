package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * 养殖对象
 */
public class Breed extends Page{
    //breed_id,breed_name,breed_ways,growSitu,breeder,feed_num,feed_id,feed_name,begin_time,end_time,farm_id,farm_name,breed_img,check,type
    private String breed_id;//ID uuid
    private String breed_name;//家畜名称
    private String breed_ways;//养殖方法 0散养 1圈养
    private String breeder;//养殖人
    private String feed_name;//喂养饲料名称
    private String begin_time;//入栏时间
    private String end_time;//出栏时间
    private String farm_id;//养殖农场编号
    private String breed_img;//生长情况 上传图片
    private String test;//检验情况 0检验合格 1不合格 2待检验
    private String b_batch;//养殖批次
    private String breed_path;//上传图片使用
    private String b_nums;//喂养数量

    public String getBreed_id() {
        return breed_id;
    }

    public void setBreed_id(String breed_id) {
        this.breed_id = breed_id;
    }

    public String getBreed_name() {
        return breed_name;
    }

    public void setBreed_name(String breed_name) {
        this.breed_name = breed_name;
    }

    public String getBreed_ways() {
        return breed_ways;
    }

    public void setBreed_ways(String breed_ways) {
        this.breed_ways = breed_ways;
    }

    public String getBreeder() {
        return breeder;
    }

    public void setBreeder(String breeder) {
        this.breeder = breeder;
    }

    public String getFeed_name() {
        return feed_name;
    }

    public void setFeed_name(String feed_name) {
        this.feed_name = feed_name;
    }

    public String getBegin_time() {
        return begin_time;
    }

    public void setBegin_time(String begin_time) {
        this.begin_time = begin_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getFarm_id() {
        return farm_id;
    }

    public void setFarm_id(String farm_id) {
        this.farm_id = farm_id;
    }
    public String getBreed_img() {
        return breed_img;
    }

    public void setBreed_img(String breed_img) {
        this.breed_img = breed_img;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public String getBreed_path() {
        return breed_path;
    }

    public void setBreed_path(String breed_path) {
        this.breed_path = breed_path;
    }

    public String getB_batch() {
        return b_batch;
    }

    public void setB_batch(String b_batch) {
        this.b_batch = b_batch;
    }

    public String getB_nums() {
        return b_nums;
    }

    public void setB_nums(String b_nums) {
        this.b_nums = b_nums;
    }
}
