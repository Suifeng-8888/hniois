package com.hniois.service.token.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.token.TokenDao;
import com.hniois.entity.token.Token;
import com.hniois.service.token.TokenManage;
import com.hniois.util.MD5;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("tokenService")
public class TokenService extends ServiceSupport<Token,TokenDao> implements TokenManage{

    @Resource(name="tokenDaoImpl")
    @Override
    public void setDao(TokenDao dao) {
        this.dao = dao;
    }

    @Override
    public String getToken() {
        return MD5.md5(String.valueOf(Math.random()*99999)).toString();
    }

    @Override
    public void add(Token e) throws Exception{
        Token p = new Token();
        p.setUser_id(e.getUser_id());
        if (dao.findCount(p)>0){
            dao.update(e);
        }else {
            dao.save(e);
        }
    }

    @Override
    public boolean checkToken(Token e) throws Exception{
        return dao.findCount(e)>0;
    }
}
