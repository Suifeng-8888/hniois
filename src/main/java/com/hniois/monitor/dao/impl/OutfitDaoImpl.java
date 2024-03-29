package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.OutfitDao;
import com.hniois.monitor.entity.Outfit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By javaMan
 * 2018/8/24  10:12
 */
@Repository(value = "outfitDao")
public class OutfitDaoImpl implements OutfitDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "OutfitMapper";
    /**
     * 保存对象
     *
     * @param outfit
     */
    @Override
    public void save(Outfit outfit) throws Exception {
        dao.save(mapper + ".save", outfit);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<Outfit> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param outfit
     */
    @Override
    public void delete(Outfit outfit) throws Exception {
        dao.delete(mapper + ".delete", outfit);
    }

    /**
     * 批量更新
     *
     * @param outfit
     */
    @Override
    public void deleteBatch(Outfit outfit) throws Exception {
        dao.delete(mapper + ".deleteBatch", outfit);
    }

    /**
     * 修改对象
     *
     * @param outfit
     */
    @Override
    public void update(Outfit outfit) throws Exception {
        dao.update(mapper + ".update", outfit);
    }

    /**
     * 批量更新
     *
     * @param outfit
     */
    @Override
    public void updateBatch(Outfit outfit) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param outfit
     */
    @Override
    public Outfit find(Outfit outfit) throws Exception {
        return (Outfit) dao.find(mapper + ".find", outfit);
    }

    /**
     * 查找List
     *
     * @param outfit
     */
    @Override
    public List<Outfit> findList(Outfit outfit) throws Exception {
        return (List<Outfit>) dao.findList(mapper + ".findList", outfit);
    }

    /**
     * 数量查询
     *
     * @param outfit
     */
    @Override
    public int findCount(Outfit outfit) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",outfit);
    }

    /**
     * 分页查询
     *
     * @param outfit
     */
    @Override
    public Page findPage(Outfit outfit) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", outfit);
    }
}
