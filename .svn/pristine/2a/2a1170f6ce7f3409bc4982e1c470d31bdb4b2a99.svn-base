package com.hniois.trace.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.trace.dao.GoodsDao;
import com.hniois.trace.entity.Goods;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/11/28  16:04
 * 供应商产品 Impl
 */
@Repository(value = "goodsDao")
public class GoodsDaoImpl implements GoodsDao {

    @Resource
    private DaoSupport dao;

    private String mapper = "GoodsMapper";
    /**
     * 保存对象
     *
     * @param goods
     */
    @Override
    public void save(Goods goods) throws Exception {
        dao.save(mapper + ".save", goods);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<Goods> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param goods
     */
    @Override
    public void delete(Goods goods) throws Exception {
        dao.delete(mapper + ".delete", goods);
    }

    /**
     * 批量更新
     *
     * @param goods
     */
    @Override
    public void deleteBatch(Goods goods) throws Exception {
        dao.delete(mapper + ".batchDelete", goods);
    }

    /**
     * 修改对象
     *
     * @param goods
     */
    @Override
    public void update(Goods goods) throws Exception {
        dao.update(mapper + ".update", goods);
    }

    /**
     * 批量更新
     *
     * @param goods
     */
    @Override
    public void updateBatch(Goods goods) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param goods
     */
    @Override
    public Goods find(Goods goods) throws Exception {
        return (Goods) dao.find(mapper + ".find", goods);
    }

    /**
     * 查找List
     *
     * @param goods
     */
    @Override
    public List<Goods> findList(Goods goods) throws Exception {
        return (List<Goods>) dao.findList(mapper + ".findList", goods);
    }

    /**
     * 数量查询
     *
     * @param goods
     */
    @Override
    public int findCount(Goods goods) throws Exception {
        return (Integer) dao.find(mapper + ".findCount", goods);
    }

    /**
     * 分页查询
     *
     * @param goods
     */
    @Override
    public Page findPage(Goods goods) throws Exception {
        return (Page)dao.findPage(mapper + ".findPage", mapper + ".findPageCount", goods);
    }
}
