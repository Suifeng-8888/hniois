package com.hniois.service.token;

import com.hniois.common.service.Service;
import com.hniois.entity.token.Token;

public interface TokenManage extends Service<Token>{

    /**
     * 随机生成Token
     * @reutn string
     * */
    public String getToken();

    /**
     * 添加/修改token
     * @param e
     * @reutn int
     * */
    public void add(Token e) throws Exception;

    /**
     * 验证token 存在
     * @param e
     * @reutn boolean true 存在
     * */
    public boolean checkToken(Token e) throws Exception;
}
