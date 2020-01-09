package com.hniois.monitor.entity;

import com.hniois.common.page.Page;

/**
 * Create By javaMan
 * 2018/8/27  10:06
 * 监管巡查任务  entity
 */
public class Task extends Page{

    private String id;//ID
    private String name;//  监管巡查任务名称/标题
    private String type;// 监管巡查任务类型    1 年度 2 季度 3 月度 4 其他
    private String content;//   监管巡查内容
    private String publish_dept;//  发布机构
    private String publish_id;//  发布机构ID
    private String create_time;//   任务发布时间
    private String start_time;//    任务开始时间
    private String end_time;//  任务结束时间
    private String rank;//任务等级

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPublish_dept() {
        return publish_dept;
    }

    public void setPublish_dept(String publish_dept) {
        this.publish_dept = publish_dept;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getPublish_id() {
        return publish_id;
    }

    public void setPublish_id(String publish_id) {
        this.publish_id = publish_id;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }
}
