package cn.itstudio.view.action;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itstudio.base.BaseAction;
import cn.itstudio.domain.Company;
import cn.itstudio.domain.Department;
import cn.itstudio.domain.DeviceBill;
import cn.itstudio.domain.User;
import cn.itstudio.util.DepartmentUtils;
import cn.itstudio.util.SessionContext;
import cn.itstudio.util.ValueContext;
import cn.itstudio.web.form.WorkflowBean;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class DealAction extends BaseAction<WorkflowBean>{
	private Long departmentId;
	private Long companyId;
    private Long deviceBillId;
	// 启动流程
	public String apply(){
		//更新请假状态，启动流程实例，让启动的流程实例关联业务
		workflowService.saveStartProcess(model,deviceBillId);
		return "toDeviceBillList";
	}
	
	/**
	 * 任务管理首页显示
	 * @return
	 */
	public String list(){
		
		//1：从Session中获取当前用户名
		String name = SessionContext.get().getName();
		//2：使用当前用户名查询正在执行的任务表，获取当前任务的集合List<Task>
		List<Task> taskList = workflowService.findTaskListByName(name); 
		ValueContext.putValueContext("taskList", taskList);
		//3:放入没有没有上级领导的提示信息
		Long userId = SessionContext.get().getId();
		User user = userService.getById(userId);
		String tipMessage = "您还没有选择上级领导，请到上级领导管理菜单完成信息！";
		if(user.getManager() == null){	
		ValueContext.putValueContext("tipMessage", tipMessage);
		}
		return "list";
		
	}

	/**
	 * 打开任务表单
	 */
	public String viewTaskForm(){
		
		//任务ID
		String taskId = model.getTaskId();
		//获取任务表单中任务节点的url连接
		String url = workflowService.findTaskFormKeyByTaskId(taskId);
		url += "?taskId="+taskId;
		ValueContext.putValueContext("url", url);
		return "viewTaskForm";
		
	}
	
	// 准备表单数据
	public String audit(){
		//获取任务ID
		String taskId = model.getTaskId();
		/**一：使用任务ID，查找请假单ID，从而获取请假单信息*/
		DeviceBill deviceBill = workflowService.findDeviceBillByTaskId(taskId);
		ValueContext.putValueStack(deviceBill);
		/**二：已知任务ID，查询ProcessDefinitionEntiy对象，从而获取当前任务完成之后的连线名称，并放置到List<String>集合中*/
		List<String> outcomeList = workflowService.findOutComeListByTaskId(taskId);
		ValueContext.putValueContext("outcomeList", outcomeList);
		/**三：查询所有历史审核人的审核信息，帮助当前人完成审核，返回List<Comment>*/
		List<Comment> commentList = workflowService.findCommentByTaskId(taskId);
		ValueContext.putValueContext("commentList", commentList);
		
		/**准备部门和公司信息*/
		//准备数据，companyList
		List<Company> companyList = companyService.findAll();
		ActionContext.getContext().put("companyList", companyList);
		// 准备数据, departmentList
		List<Department> topList = departmentService.findTopList();
		List<Department> departmentList = DepartmentUtils.getAllDepartments(topList);
		ActionContext.getContext().put("departmentList", departmentList);
		return "taskForm";
	}
	
	/**
	 * 提交任务
	 */
	public String submitTask(){			
		workflowService.saveSubmitTask(model);
		return "list";		
	}
	
	/**
	 * 查看当前流程图（查看当前活动节点，并使用红色的框标注）
	 */
	public String viewCurrentImage(){
		//任务ID
		String taskId = model.getTaskId();
		/**一：查看流程图*/
		//1：获取任务ID，获取任务对象，使用任务对象获取流程定义ID，查询流程定义对象
		ProcessDefinition pd = workflowService.findProcessDefinitionByTaskId(taskId);
		//workflowAction_viewImage?deploymentId=<s:property value='#deploymentId'/>&imageName=<s:property value='#imageName'/>
		ValueContext.putValueContext("deploymentId", pd.getDeploymentId());
		ValueContext.putValueContext("imageName", pd.getDiagramResourceName());
		/**二：查看当前活动，获取当期活动对应的坐标x,y,width,height，将4个值存放到Map<String,Object>中*/
		Map<String, Object> map = workflowService.findCoordingByTask(taskId);
		ValueContext.putValueContext("acs", map);
		return "image";
	}
	
	//======
	public Long getDeviceBillId() {
		return deviceBillId;
	}
	public void setDeviceBillId(Long deviceBillId) {
		this.deviceBillId = deviceBillId;
	}

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
		
}
