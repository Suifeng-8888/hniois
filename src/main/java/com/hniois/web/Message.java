package com.hniois.web;

/**
 * Create By javaMan
 * 2018/9/19  18:03
 *
 * 接口调取统一返回信息类
 */
public class Message {

    private Integer code;  // 状态码  0正常   其它 异常
    private String msg; // 提示信息
    private Object data;//  返回数据


    public Message() {}

    public Message(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
