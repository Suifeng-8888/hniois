package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.monitor.dao.TaskDao;
import com.hniois.monitor.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By javaMan
 * 2018/8/27  10:16
 */
@Repository(value = "taskDao")
public class TaskDaoImpl implements TaskDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "TaskMapper";
    /**
     * 保存对象
     *
     * @param task
     */
    @Override
    public void save(Task task) throws Exception {
        dao.save(mapper + ".save", task);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<Task> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param task
     */
    @Override
    public void delete(Task task) throws Exception {
        dao.delete(mapper + ".delete", task);
    }

    /**
     * 批量更新
     *
     * @param task
     */
    @Override
    public void deleteBatch(Task task) throws Exception {
        dao.delete(mapper + ".deleteBatch", task);
    }

    /**
     * 修改对象
     *
     * @param task
     */
    @Override
    public void update(Task task) throws Exception {
        dao.update(mapper + ".update", task);
    }

    /**
     * 批量更新
     *
     * @param task
     */
    @Override
    public void updateBatch(Task task) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param task
     */
    @Override
    public Task find(Task task) throws Exception {
        return (Task) dao.find(mapper + ".find", task);
    }

    /**
     * 查找List
     *
     * @param task
     */
    @Override
    public List<Task> findList(Task task) throws Exception {
        return (List<Task>) dao.findList(mapper + ".findList", task);
    }

    /**
     * 数量查询
     *
     * @param task
     */
    @Override
    public int findCount(Task task) throws Exception {
        return 0;
    }

    /**
     * 分页查询
     *
     * @param task
     */
    @Override
    public Page findPage(Task task) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", task);
    }
}
