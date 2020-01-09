package com.hniois.monitor.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.monitor.entity.Outfit;
import com.hniois.monitor.entity.Task;
import com.hniois.monitor.service.OutfitService;
import com.hniois.monitor.service.TaskService;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Create By javaMan
 * 2018/8/27  10:39
 * 监管任务 controller
 */
@Controller
@RequestMapping(value = "/task")
public class TaskController extends BaseController {

    //    监管任务  Service
    @Resource(name = "taskService")
    private TaskService taskService;
//    监管部门
    @Resource(name = "outfitService")
    private OutfitService outfitService;

    private String list = "monitor/task/task_list";// 分页列表页面
    private String edit = "monitor/task/task_edit";// 新增修改页面

    /**
     * 进入监管任务分页列表页面
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(list);
        return mv;
    }

    /**
     * 监管任务分页数据
     * @param task
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String pageList(Task task) throws Exception {
//        if(Const.OUTFIT_ADMIN.equals(SessionManager.getUserType())){
//            task.setPublish_id(SessionManager.getFarmID());
//            Outfit oft=new Outfit();
//            oft.setId(SessionManager.getFarmID());
//            oft=outfitService.find(oft);
//            task.setRank(oft.getGrade());
//        }
        // 当前页
        int currPage = getThisPage(task.getPage());
        // 每页显示条数
        int limit = getThisLimit(task.getLimit());
        task.setOffset((currPage-1) * limit);
        task.setPageSize(limit);
        Page page = taskService.findPage(task);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 修改    页面
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView addORUpd(Task e) throws Exception {
        ModelAndView mv = getModelAndView();
        Task task = new Task();
        task.setPublish_dept(SessionManager.getFarmName());//自动获取当前用户所属机构
        if (StringUtils.isNotEmpty(e.getId())) {
            task = taskService.find(e);
        }
        task.setCode(e.getCode());  // 判断：0查看 or 1 增加/修改
        mv.addObject("task", task);
        mv.setViewName(edit);
        return mv;
    }

    /**
     * 新增监管任务信息
     * @param task
     * @return
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(Task task) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(taskService.findCount(task)>0){
            setMsg(obj,"error","该任务已发布过");
        }else{
            task.setCreate_time(DateUtil.getDay());
            task.setPublish_id(SessionManager.getFarmID());
//            //获取当前登录机构等级
//            Outfit oft=new Outfit();
//            oft.setId(SessionManager.getFarmID());
//            oft=outfitService.find(oft);
//            task.setRank(oft.getGrade());
            taskService.save(task);
        }
        return obj.toString();
    }

    /**
     * 监管任务修改
     * @param task
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(Task task) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(task.getId())) {
            taskService.update(task);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 单个删除
     * @param task
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Task task) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(task.getId())) {
            taskService.delete(task);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param task
     * @return
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(Task task) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(task.getData() != null && task.getData().size() > 0) {
            taskService.deleteBatch(task);
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
    public void doExport(Task e) throws Exception {
        if(Const.OUTFIT_ADMIN.equals(SessionManager.getUserType())){
            e.setPublish_id(SessionManager.getFarmID());
        }
        //导出工具
        ExportExcelUtil<Task> export = new ExportExcelUtil<Task>();
        //文件名称
        String filename = "taskList" + DateUtil.getTimes();
        //导出数据信息
        List list = taskService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }


}
