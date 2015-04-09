package cn.itstudio.util;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.itstudio.domain.User;
import cn.itstudio.service.UserService;


@SuppressWarnings("serial")
/**
 * 员工经理任务分配
 *
 */
public class ManagerTaskHandler implements TaskListener {

	public void notify(DelegateTask delegateTask) {
		/**懒加载异常*/
//		Employee employee = SessionContext.get();
//		//设置个人任务的办理人
//		delegateTask.setAssignee(employee.getManager().getName());
		/**从新查询当前用户，再获取当前用户对应的领导*/
		User user = SessionContext.get();
		//当前用户
		Long userId = user.getId();
		//使用当前用户名查询用户的详细信息
		//从web中获取spring容器
		WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(ServletActionContext.getServletContext());
		UserService userService = (UserService) ac.getBean("userService");
		User manager = (User) userService.getById(userId);
		//设置个人任务的办理人
		if(manager !=null){
		delegateTask.setAssignee(manager.getManager().getName());
		}
	}

}