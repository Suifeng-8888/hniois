package com.hniois.web.supervise;

import com.hniois.monitor.entity.Task;
import com.hniois.monitor.service.TaskService;
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
 * 2018/9/20  16:32
 *
 * 监管巡查任务接口
 */
@RequestMapping(value = "/webService/task")
@RestController
public class TaskWebService {

    @Resource(name = "taskService")
    private TaskService taskService;

    /**
     * 监管巡查任务信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public Task getTask(@PathVariable("id") Integer id) throws Exception {
        Task task = new Task();
        task.setId(id.toString());
        return taskService.find(task);
    }

    /**
     * 监管巡查任务列表
     * @param task
     * @return
     */
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public List<Task> getTaskList(Task task) throws Exception {
        return taskService.findList(task);
    }

    /**
     * 新增一条监管巡查任务信息
     * @param task
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Message saveTask(Task task) {
        Message message = new Message(0, "添加成功!", "");
        try {
            taskService.save(task);
        } catch (Exception e) {
            message.setCode(1);
            message.setMsg("添加失败!");
            e.printStackTrace();
        }
        return message;
    }

    /**
     * 监管巡查任务信息删除
     * @param id
     * @return
     */
//    @RequestMapping(value = "/del/{id}", method = RequestMethod.DELETE)
    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public Message delTask(@PathVariable("id") Integer id) {
        Message message = new Message();
        if(id != null) {
            Task task = new Task();
            task.setId(id.toString());
            try {
                taskService.delete(task);
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
     * 更新监管巡查任务信息
     * @param task
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Message updateTask(Task task) {
        Message message = new Message();
        if(StringUtils.isNotEmpty(task.getId())) {
            try {
                taskService.update(task);
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
