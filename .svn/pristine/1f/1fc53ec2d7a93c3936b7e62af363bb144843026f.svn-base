package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.entity.statistics.NoteCount;
import com.hniois.entity.statistics.StatisicsCount;
import com.hniois.monitor.dao.NoteDao;
import com.hniois.monitor.entity.Note;
import com.hniois.monitor.service.NoteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/8/30  15:42
 */
@Service(value = "noteService")
public class NoteServiceImpl extends ServiceSupport<Note, NoteDao> implements NoteService {

    @Resource(name = "noteDao")
    @Override
    public void setDao(NoteDao dao) {
        this.dao = dao;
    }
    @Override
    public List<NoteCount> countWeek(Note e) throws Exception {
        return dao.countWeek(e);
    }

    @Override
    public List<NoteCount> countMonth(Note e) throws Exception {
        return dao.countMonth(e);
    }
}
