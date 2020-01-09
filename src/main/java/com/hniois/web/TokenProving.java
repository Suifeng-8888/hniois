package com.hniois.web;

import com.hniois.entity.system.User;
import com.hniois.entity.token.Token;
import com.hniois.service.system.user.impl.UserService;
import com.hniois.service.token.impl.TokenService;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Token   验证
 * Create By javaMan
 * 2018/12/20  9:21
 */
public class TokenProving {

    public static ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
            new String[] {"spring/ApplicationContext-main.xml", "spring/ApplicationContext-dataSource.xml"
    });
    public static TokenService tokenService = (TokenService) applicationContext.getBean("tokenService");
    public static UserService userService = (UserService) applicationContext.getBean("userService");

    /**
     * 验证token  返回  登录 user   bz 权限类型
     * @param token
     * @return
     * @throws Exception
     */
    public static String verifyToken(String token) throws Exception {
        String userBZ = "";
        if(StringUtils.isNotEmpty(token)) {
            Token tk = new Token();
            tk.setToken(token);
//        验证token
            Token ytk = tokenService.find(tk);
            if(ytk != null) {
                User user = new User();
                user.setUser_id(ytk.getUser_id());
                User yuser = userService.find(user);
//                验证  登录 user
                if(yuser != null) {
                    userBZ = yuser.getBz();
                }
            }
        }
        return userBZ;
    }
}
