package com.hniois.monitor.dao.impl;

import com.hniois.common.dao.DaoSupport;
import com.hniois.common.page.Page;
import com.hniois.entity.statistics.NoteCount;
import com.hniois.entity.statistics.StatisicsCount;
import com.hniois.monitor.dao.NoteDao;
import com.hniois.monitor.entity.Note;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By javaMan
 * 2018/8/30  15:38
 * 监管巡查记录 dao
 */
@Repository(value = "noteDao")
public class NoteDaoImpl implements NoteDao {

    @Autowired
    private DaoSupport dao;

    private String mapper = "NoteMapper";

    /**
     * 保存对象
     *
     * @param note
     */
    @Override
    public void save(Note note) throws Exception {
        dao.save(mapper + ".save", note);
    }

    /**
     * 批量更新
     *
     * @param e
     */
    @Override
    public void saveBatch(List<Note> e) throws Exception {

    }

    /**
     * 删除对象
     *
     * @param note
     */
    @Override
    public void delete(Note note) throws Exception {
        dao.delete(mapper + ".delete", note);
    }

    /**
     * 批量更新
     *
     * @param note
     */
    @Override
    public void deleteBatch(Note note) throws Exception {
        dao.delete(mapper + ".deleteBatch", note);
    }

    /**
     * 修改对象
     *
     * @param note
     */
    @Override
    public void update(Note note) throws Exception {
        dao.update(mapper + ".update", note);
    }

    /**
     * 批量更新
     *
     * @param note
     */
    @Override
    public void updateBatch(Note note) throws Exception {

    }

    /**
     * 查找对象
     *
     * @param note
     */
    @Override
    public Note find(Note note) throws Exception {
        return (Note) dao.find(mapper + ".find", note);
    }

    /**
     * 查找List
     *
     * @param note
     */
    @Override
    public List<Note> findList(Note note) throws Exception {
        return (List<Note>) dao.findList(mapper + ".findList", note);
    }

    /**
     * 数量查询
     *
     * @param note
     */
    @Override
    public int findCount(Note note) throws Exception {
        return  (Integer)dao.find(mapper+".findCount",note);
    }


    /**
     * 分页查询
     *
     * @param note
     */
    @Override
    public Page findPage(Note note) throws Exception {
        return dao.findPage(mapper + ".findPage", mapper + ".findPageCount", note);
    }
    @Override
    public List<NoteCount> countWeek(Note e) throws Exception {
        return (List<NoteCount>)dao.findList(mapper+".countWeek",e);
    }

    @Override
    public List<NoteCount> countMonth(Note e) throws Exception {
        return (List<NoteCount>)dao.findList(mapper+".countMonth",e);
    }
}
