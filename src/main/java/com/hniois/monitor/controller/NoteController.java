package com.hniois.monitor.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Note;
import com.hniois.monitor.entity.Task;
import com.hniois.monitor.service.NoteService;
import com.hniois.monitor.service.TaskService;
import com.hniois.util.*;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/8/30  15:47
 * 监管巡查记录 Controller
 */
@Controller
@RequestMapping(value = "/note")
public class NoteController extends BaseController {

    @Resource(name = "noteService")
    private NoteService noteService;

    @Resource(name = "taskService")
    private TaskService taskService;

    private String list = "monitor/note/note_list";// 分页列表页
    private String edit = "monitor/note/note_edit";// 新增修改页

    /**
     * 进入监管巡查记录分页列表页面
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(list);
        return mv;
    }

    /**
     * 监管巡查记录分页数据
     * @param note
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String pageList(Note note) throws Exception {
        // 当前页
        int currPage = getThisPage(note.getPage());
        // 每页显示条数
        int limit = getThisLimit(note.getLimit());
        note.setOffset((currPage-1) * limit);
        note.setPageSize(limit);
        Page page = noteService.findPage(note);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 修改    页面
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView addORUpd(Note e) throws Exception {
        ModelAndView mv = getModelAndView();
        Note note = new Note();
        if(StringUtils.isNotEmpty(SessionManager.getFarmID())){
            note.setOutfit_id(SessionManager.getFarmID());
            note.setOutfit_name(SessionManager.getFarmName());
        }else{
            note.setOutfit_name("超级管理员");
        }
        Task task = new Task();
        List<Task> tasks = taskService.findList(task);
        if (StringUtils.isNotEmpty(e.getId())) {
            note = noteService.find(e);
        }
        note.setCode(e.getCode());  // 判断：0查看 or 1 增加/修改
        mv.addObject("note", note);
        mv.addObject("tasks", tasks);
        mv.setViewName(edit);
        return mv;
    }

    /**
     * 新增监管巡查记录
     * @param note
     * @return
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(Note note) throws Exception {
        JSONObject obj = getMsg();//返回信息
        noteService.save(note);
        return obj.toString();
    }

    /**
     * 监管巡查任务修改
     * @param note
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(Note note) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(note.getId())) {
            noteService.update(note);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 单个删除
     * @param note
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Note note) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(note.getId())) {
            noteService.delete(note);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param note
     * @return
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(Note note) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(note.getData() != null && note.getData().size() > 0) {
            noteService.deleteBatch(note);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 导出
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Note e) throws Exception {
        if(Const.OUTFIT_ADMIN.equals(SessionManager.getUserType())){
            e.setOutfit_id(SessionManager.getFarmID());
        }
        //导出工具
        ExportExcelUtil<Note> export = new ExportExcelUtil<Note>();
        //文件名称
        String filename = "recordList" + DateUtil.getTimes();
        //导出数据信息
        List list = noteService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

}
