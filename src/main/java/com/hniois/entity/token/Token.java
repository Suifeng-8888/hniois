package com.hniois.entity.token;

import com.hniois.common.page.Page;

/**
 * 手机端验证token
 *
 * */
public class Token extends Page {
    private String user_id;//用户ID
    private String token;//用户token
    private String login_time;//登录时间,自动更新

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getLogin_time() {
        return login_time;
    }

    public void setLogin_time(String login_time) {
        this.login_time = login_time;
    }
}
