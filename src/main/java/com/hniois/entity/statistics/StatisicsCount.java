package com.hniois.entity.statistics;

public class StatisicsCount {

    private String num; // 数量
    private String b_time;// 日期
    //***************************
    private String temp;//临时替换日期

    private String sum;//总数

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getB_time() {
        return b_time;
    }

    public void setB_time(String b_time) {
        this.b_time = b_time;
    }

    public String getTemp() {
        return temp;
    }

    public void setTemp(String temp) {
        this.temp = temp;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }
}