package com.hniois.dao.token.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.dao.token.TokenDao;
import com.hniois.entity.token.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("tokenDaoImpl")
public class TokenDaoImpl implements TokenDao{
    @Autowired
    private DaoSupport dao;

    private String mapper = "TokenMapper";

    @Override
    public void save(Token e) throws Exception {
        dao.save(mapper+".save",e);
    }

    @Override
    public void saveBatch(List<Token> e) throws Exception {
        dao.save(mapper+".saveBatch",e);
    }

    @Override
    public void delete(Token e) throws Exception {
        dao.delete(mapper+".delete",e);
    }

    @Override
    public void deleteBatch(Token e) throws Exception {
        dao.delete(mapper+".deleteBatch",e);
    }

    @Override
    public void update(Token e) throws Exception {
        dao.update(mapper+".update",e);
    }

    @Override
    public void updateBatch(Token e) throws Exception {
        dao.update(mapper+".updateBatch",e);
    }

    @Override
    public Token find(Token e) throws Exception {
        return (Token)dao.find(mapper+".find",e);
    }

    @Override
    public List<Token> findList(Token e) throws Exception {
        return  (List<Token> )dao.findList(mapper+".findList",e);
    }

    @Override
    public int findCount(Token e) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",e);
    }

    @Override
    public Page findPage(Token e) throws Exception {
        return (Page)dao.findPage(mapper+".findPage",mapper+".findPageCount",e);
    }
}
