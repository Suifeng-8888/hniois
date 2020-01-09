package com.hniois.monitor.dao;

import com.hniois.common.dao.Dao;
import com.hniois.entity.statistics.NoteCount;
import com.hniois.entity.statistics.StatisicsCount;
import com.hniois.monitor.entity.Note;

import java.util.List;

/**
 * Create By javaMan
 * 2018/8/30  15:38
 */
public interface NoteDao extends Dao<Note> {
    List<NoteCount> countWeek(Note e) throws Exception;

    List<NoteCount> countMonth(Note e) throws Exception;
}
