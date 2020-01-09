package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.OutputDao;
import com.hniois.monitor.entity.Output;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By javaMan
 * 2018/12/3  9:09
 *
 * 基地准出  daoImpl
 */
@Repository("outputDao")
public class OutputDaoImpl implements OutputDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "OutputMapper";
    /**
     * 保存对象
     *
     * @param output
     */
    @Override
    public void save(Output output) throws Exception {
        dao.save(mapper + ".save", output);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<Output> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param output
     */
    @Override
    public void delete(Output output) throws Exception {
        dao.delete(mapper + ".delete", output);
    }

    /**
     * 批量更新
     *
     * @param output
     */
    @Override
    public void deleteBatch(Output output) throws Exception {
        dao.delete(mapper + ".deleteBatch", output);
    }

    /**
     * 修改对象
     *
     * @param output
     */
    @Override
    public void update(Output output) throws Exception {
        dao.update(mapper + ".update", output);
    }

    /**
     * 批量更新
     *
     * @param output
     */
    @Override
    public void updateBatch(Output output) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param output
     */
    @Override
    public Output find(Output output) throws Exception {
        return (Output) dao.find(mapper + ".find", output);
    }

    /**
     * 查找List
     *
     * @param output
     */
    @Override
    public List<Output> findList(Output output) throws Exception {
        return (List<Output>) dao.findList(mapper + ".findList", output);
    }

    /**
     * 数量查询
     *
     * @param output
     */
    @Override
    public int findCount(Output output) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",output);
    }

    /**
     * 分页查询
     *
     * @param output
     */
    @Override
    public Page findPage(Output output) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", output);
    }
}
