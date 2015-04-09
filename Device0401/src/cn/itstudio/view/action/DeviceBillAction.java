package cn.itstudio.view.action;

import java.util.List;

import org.activiti.engine.task.Comment;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itstudio.base.BaseAction;
import cn.itstudio.domain.DeviceBill;
import cn.itstudio.domain.User;
import cn.itstudio.service.DeviceBillService;
import cn.itstudio.util.QueryHelper;
import cn.itstudio.util.SessionContext;
import cn.itstudio.util.ValueContext;
@Controller
@Scope("prototype")
@SuppressWarnings("serial")
public class DeviceBillAction extends BaseAction<DeviceBill> {

	public void setDeviceBillService(DeviceBillService deviceBillService) {
		this.deviceBillService = deviceBillService;
	}

	/**
	 * 设备管理首页显示
	 * @return
	 */
	public String list(){
		/*//1：查询所有的设备信息（对应a_devicebill），返回List<DeviceBill>
		List<DeviceBill> deviceBillList = deviceBillService.findDeviceBillList(); 
		//放置到上下文对象中
		ValueContext.putValueContext("deviceBillList", deviceBillList);*/
		new QueryHelper(DeviceBill.class, "d").preparePageBean(deviceBillService, pageNum, pageSize);
		//2:放入没有没有上级领导的提示信息
		Long userId = SessionContext.get().getId();
		User user = userService.getById(userId);
		String tipMessage = "您还没有选择上级领导，请到上级领导管理菜单完成信息！";
		if(user.getManager() == null){	
		ValueContext.putValueContext("tipMessage", tipMessage);
		}
		return "list";
	}
	/**
	 * 查看设备单详情
	 * @return
	 */
	public String show(){
		//1：查询所有的设备信息（对应a_devicebill），返回List<DeviceBill>
		DeviceBill deviceBill = deviceBillService.getById(model.getId()); 
		//放置到上下文对象中
		ActionContext.getContext().getValueStack().push(deviceBill); 
		return "show";
	}
	/**
	 * 修改页面
	 * @return
	 */
	public String editUI(){
		//根据ID查询DeviceBill对象
	    DeviceBill deviceBill = deviceBillService.getById(model.getId());
	    ActionContext.getContext().getValueStack().push(deviceBill);
		return "saveUI";
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String edit(){
		//根据ID查询DeviceBill对象
	    DeviceBill deviceBill = deviceBillService.getById(model.getId());
		//修改对应的属性
	    deviceBill.setDescription(model.getDescription());
	    deviceBill.setFee(model.getFee());
	    deviceBill.setName(model.getName());
	    deviceBill.setRemark(model.getRemark());
	    deviceBill.setPosition(model.getPosition());
	    deviceBillService.update(deviceBill);
		return "toList";
	}
	/**
	 * 保存/更新，设备申请
	 * 
	 * */
	public String addUI() {
		Long userId = SessionContext.get().getId();
		User user = userService.getById(userId);
		if(user.getManager() != null){	
		    return "saveUI";
		}else{
			return "toManager";
		}
	}
	/**
	 * 保存/更新，设备申请
	 * 
	 * */
	public String add() {
		
			//封装信息
			model.setUser(getCurrentUser());
			//执行保存
			deviceBillService.save(model);
			return "toList";
		
	}
	
	/**
	 * 删除，设备申请
	 * 
	 * */
	public String delete(){
		//1：获取设备单ID
		Long id = model.getId();
		//执行删除
		deviceBillService.delete(id);
		return "toList";
	}
	/**
	 * 查看历史的批注信息
	 * */
	public String viewHisComment(){
		//获取清单ID
		Long id = model.getId();
		//1：使用设备单ID，查询设备单对象，将对象放置到栈顶，支持表单回显
		DeviceBill deviceBill = deviceBillService.getById(id);
		ValueContext.putValueStack(deviceBill);
		//2：使用设备单ID，查询历史的批注信息
		List<Comment> commentList = workflowService.findCommentByDeviceBillId(id);
		ValueContext.putValueContext("commentList", commentList);
		return "viewHisComment";
	}
	
}
