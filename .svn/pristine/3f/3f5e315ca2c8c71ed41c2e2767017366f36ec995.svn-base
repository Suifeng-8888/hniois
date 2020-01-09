package com.hniois.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebServiceInterceptor extends HandlerInterceptorAdapter {

    /**
     * 检测 User_Session
     * */
    @Override
    public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception{
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest httpRequest,HttpServletResponse httpResponse, Object arg2, Exception arg3)
            throws Exception {

    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,Object arg2, ModelAndView arg3) throws Exception {

    }
}
