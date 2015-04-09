package cn.itstudio.view.action;

import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itstudio.base.BaseAction;
import cn.itstudio.domain.User;
import cn.itstudio.util.SessionContext;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class HomeAction extends BaseAction<User> {

	public String index() throws Exception {
		//1：从Session中获取当前用户名
		String name = SessionContext.get().getName();
		//2：使用当前用户名查询正在执行的任务表，获取当前任务的集合List<Task>
		List<Task> taskList = workflowService.findTaskListByName(name);
		Long waitTaskCount = null;
		if(taskList != null){
		 waitTaskCount =(long) taskList.size(); 
		}
		Map<String , Object> application = ActionContext.getContext().getApplication();
		if(waitTaskCount!=null){
			application.put("waitTaskCount", waitTaskCount);	
		}else{
			String noView ="true";
			application.put("noView", noView);
		}
		
		int online = UserAction.online;
		ActionContext.getContext().put("online", online);
		return "index";
	}

	public String top() throws Exception {
		return "top";
	}

	public String bottom() throws Exception {
		return "bottom";
	}

	public String left() throws Exception {
		return "left";
	}

	public String right() throws Exception {
		return "right";
	}
}
