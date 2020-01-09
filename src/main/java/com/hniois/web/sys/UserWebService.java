package com.hniois.web.sys;

import com.hniois.controller.base.BaseController;
import com.hniois.entity.system.User;
import com.hniois.entity.token.Token;
import com.hniois.service.system.user.UserManage;
import com.hniois.service.token.TokenManage;
import com.hniois.util.Const;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@RequestMapping(value="/webService/user")
@RestController
public class UserWebService extends BaseController{
    //用户
    @Resource(name="userService")
    private UserManage userService;

    //Token
    @Resource(name="tokenService")
    private TokenManage tokenService;

    /**
     *  app 登录接口
     * @param user_id
     * @param password
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public Message login(String user_id, String password) throws Exception {
        Message message = new Message();
        if (StringUtils.isEmpty(user_id)) {
            message.setCode(1);
            message.setMsg("用户名不能为空！");
            return message;
        }
        if (StringUtils.isEmpty(password)) {
            message.setCode(1);
            message.setMsg("用户名不能为空！");
            return message;
        }
        String pass = new SimpleHash("SHA-1",user_id,password).toString();
        User u = new User();
        u.setUser_id(user_id);
        u.setPassword(pass);
        User user = userService.find(u);
        if(user != null){
            if("0".equals(user.getState())) {
                if(Const.ADMINISTRATOR.equals(user.getBz()) || Const.OUTFIT_ADMIN.equals(user.getBz()) ||
                        Const.PROVIDER_ADMIN.equals(user.getBz())) {
//                    保存token
                    Token tk = new Token();
                    String token = tokenService.getToken();
                    tk.setToken(token);
                    tk.setUser_id(user_id);
                    tokenService.add(tk);

                    message.setCode(0);
                    message.setMsg("登录成功!");
                    Map<String, Object> map = new HashMap<String, Object>();
                    map.put("token", token);  // 返回 token
                    map.put("user",user); // 返回 登录用户信息
                    message.setData(map);
                    return message;

                } else {
                    message.setCode(1);
                    message.setMsg("登陆账号信息异常,请联系系统管理员！！");
                    return message;
                }
            } else {
                message.setCode(1);
                message.setMsg("登录账号信息状态未启用,请联系系统管理员!");
                return message;
            }
        } else {
            message.setCode(1);
            message.setMsg("用户名或密码错误!");
            return message;
        }
    }

    /**
     * app  用户注册
     * @param user
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public Message register(User user) throws Exception {
        Message message = new Message();
        if(StringUtils.isEmpty(user.getUser_id())) {
            message.setCode(1);
            message.setMsg("账号ID不能为空!");
            return message;
        }
        if(StringUtils.isEmpty(user.getPassword())) {
            message.setCode(1);
            message.setMsg("密码不能为空!");
            return message;
        }
//        判断 userID 是否注册
        User testU = new User();
        testU.setUser_id(user.getUser_id());
        User u = userService.find(testU);
        if(u != null) {
            message.setCode(1);
            message.setMsg("账号ID已被注册,请重新填写");
            return message;
        } else {
            String pass = new SimpleHash("SHA-1",user.getUser_id(),user.getPassword()).toString();
            user.setPassword(pass);
            userService.save(user);
            message.setCode(0);
            message.setMsg("账号注册成功,请等待审核!");
            return message;
        }
    }


    /**
     *  修改密码
     * @param user_id
     * @param password
     * @param new_password
     * @return
     */
    @RequestMapping(value = "/revise", method = RequestMethod.POST)
    public Message revisePassword(String user_id, String password, String new_password) throws Exception {
        Message message = new Message();
        if(StringUtils.isEmpty(user_id)) {
            message.setCode(1);
            message.setMsg("用户ID不能为空！");
            return message;
        }
        if(StringUtils.isNotEmpty(password)) {
//            检验旧密码
            String pass = new SimpleHash("SHA-1",user_id,password).toString();
            User user = new User();
            user.setUser_id(user_id);
            user.setPassword(pass);
            User u = userService.find(user);
            if(u != null) {
                if(StringUtils.isNotEmpty(new_password)) {
//                    更改密码
                    String shaNewPassword = new SimpleHash("SHA-1",user_id, new_password).toString();
                    user.setPassword(shaNewPassword);
                    userService.update(user);

                    message.setCode(0);
                    message.setMsg("新密码修改成功!");
                    return message;
                } else {
                    message.setCode(1);
                    message.setMsg("新密码不能为空!");
                    return message;
                }
            } else {
                message.setCode(1);
                message.setMsg("密码错误!");
                return message;
            }
        } else {
            message.setCode(1);
            message.setMsg("旧密码不能为空!");
            return message;
        }
    }



}





