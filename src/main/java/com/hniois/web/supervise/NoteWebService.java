package com.hniois.web.supervise;

import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Note;
import com.hniois.monitor.service.NoteService;
import com.hniois.web.Message;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/9/20  17:22
 *
 * 监管巡查记录 web接口
 */
@RequestMapping(value = "/webService/note")
@RestController
public class NoteWebService extends BaseController{

    @Resource(name = "noteService")
    private NoteService noteService;

    /**
     * 监管巡查记录详情
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Note getNote(@PathVariable("id") Integer id) throws Exception {
        Note note = new Note();
        note.setId(id.toString());
        return noteService.find(note);
    }

    /**
     * 监管巡查记录列表
     * @param note
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public List<Note> getNoteList(Note note) throws Exception {
        return noteService.findList(note);
    }

    /**
     * 分页查询
     * @param note
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public Page showPage(Note note)throws Exception{
        //获取当前页
        int current = getThisPage(note.getPage());
        //获取每页显示条数
        int limit=getThisLimit(note.getLimit());
        note.setOffset((current-1)*limit);
        note.setPagerSize(limit);//每页显示记录数
        return noteService.findPage(note);
    }

    /**
     * 新增一条监管巡查记录信息
     * @param note
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Message saveNote(Note note) {
        Message message = new Message(0, "添加成功!", "");
        try {
            noteService.save(note);
        } catch (Exception e) {
            message.setCode(1);
            message.setMsg("添加失败!");
            e.printStackTrace();
        }
        return message;
    }

    /**
     * 监管巡查记录信息删除
     * @param id
     * @return
     */
//    @RequestMapping(value = "/del/{id}", method = RequestMethod.DELETE)
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delNote(@PathVariable("id") Integer id) {
        Message message = new Message();
        if(id != null) {
            Note note = new Note();
            note.setId(id.toString());
            try {
                noteService.delete(note);
                message.setCode(0);
                message.setMsg("删除成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("删除失败!");
                e.printStackTrace();
            }
        }
        return message;
    }

    /**
     * 更新监管巡查记录信息
     * @param note
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message updateNote(Note note) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(note.getId())) {
            try {
                noteService.update(note);
                message.setCode(0);
                message.setMsg("更新成功!");
            } catch (Exception e) {
                message.setCode(1);
                message.setMsg("更新失败!");
                e.printStackTrace();
            }
        }
        return message;
    }

}
