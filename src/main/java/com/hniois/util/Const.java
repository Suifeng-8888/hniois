package com.hniois.util;

import org.springframework.context.ApplicationContext;
/**
 * 静态变量
*/
public class Const {
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";	//验证码
	public static final String SESSION_USER = "sessionUser";				//session用的用户 .roleid
	public static final String SESSION_USERNAME = "userName";				//用户名
	public static final String SESSION_FARMID = "farm_id";				//生产基地
    public static final String SESSION_menuList = "menuList";				//当前菜单
    public static final String SESSION_allmenuList = "allmenuList";			//全部菜单
	public static final String SESSION_QX = "QX";							//角色权限
	public static final String SESSION_excelDemo = "excelDemo";				//excel导出信息


	public static final String TRUE = "T";
	public static final String FALSE = "F";
	public static final Integer PAGE = 10;									//分页条数
	public static final String LOGIN = "/login_tologin.do";					//登录地址
    public static final String FWATERM = "admin/config/FWATERM.txt";		//文字水印配置路径
    public static final String IWATERM = "admin/config/IWATERM.txt";		//图片水印配置路径
	public static final String SYSNAME = "admin/config/SYSNAME.txt";		//系统名称路径
	public static final String SYSNAME3 = "admin/config/SYSNAME3.txt";		//生产企业管理平台系统名称路径
	public static final String SYSNAME4 = "admin/config/SYSNAME4.txt";		//经营企业管理平台系统名称路径

	public static final String FILEPATHIMG = "uploadFiles/uploadImgs/";		//图片上传路径
	public static final String FILEPATHFILE = "uploadFiles/file/";			//文件上传路径
	public static final String FILEPATHFILEOA = "uploadFiles/uploadFile/";	//文件上传路径(oa管理)
	public static final String FILEPATHTWODIMENSIONCODE = "uploadFiles/twoDimensionCode/"; //二维码存放路径
	public static final String NO_INTERCEPTOR_PATH = ".*/((login)|(logout)|(register)|(code)|(static)|(main)|(uploadImgs)|(webService)).*";	//不对匹配该值的访问路径拦截（正则）
	public static ApplicationContext WEB_APP_CONTEXT = null; //该值会在web容器启动时由WebAppContextListener初始化
//	二维码扫一扫H5访问路径
	public static final String H5Path = "http://192.168.11.4:8200/retrospects/index.html?rule_code=";
//	public static final String H5Path = "http://192.168.11.4:8008/retrospects/index.html?rule_code=";
//	public static final String H5Path = "http://127.0.0.1:8080/retrospects/index.html?rule_code=";

//	标识登陆用户的类别
	public static final String ADMINISTRATOR = "ADMINISTRATOR";  // 超级管理员
	public static final String OUTFIT_ADMIN = "OUTFIT_ADMIN";  // 监管部门用户
	public static final String PROVIDER_ADMIN = "PROVIDER_ADMIN"; // 企业基地用户

}
