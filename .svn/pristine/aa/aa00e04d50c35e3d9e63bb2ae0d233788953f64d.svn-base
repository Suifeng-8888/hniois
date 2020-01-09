package com.hniois.monitor.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.monitor.dao.TaskDao;
import com.hniois.monitor.entity.Task;
import com.hniois.monitor.service.TaskService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/8/27  10:33
 * 监管巡查任务   Service
 */
@Service(value = "taskService")
public class TaskServiceImpl extends ServiceSupport<Task, TaskDao> implements TaskService {

    @Resource(name = "taskDao")
    @Override
    public void setDao(TaskDao dao) {
        this.dao = dao;
    }
}
