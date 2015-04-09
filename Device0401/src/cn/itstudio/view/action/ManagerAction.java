package cn.itstudio.view.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itstudio.base.BaseAction;
import cn.itstudio.domain.Company;
import cn.itstudio.domain.Department;
import cn.itstudio.domain.User;
import cn.itstudio.util.DepartmentUtils;
import cn.itstudio.util.SessionContext;
@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class ManagerAction extends BaseAction<User>{
	
	private Long departmentId;
	private Long companyId;
	private Long managerId;
     /**查询用户所持有的上级领导*/
	public String list() throws Exception {
		Long userId = SessionContext.get().getId();
        User manager = userService.getById(userId).getManager();
		ActionContext.getContext().put("manager", manager);
        User user = SessionContext.get();
        ActionContext.getContext().put("user", user);
		return "list";
	}
	/**查询页面*/
	public String queryUI() throws Exception {
		if(model.getId() != null){
			User user= userService.getById(model.getId());
			User manager = user.getManager();
			Department department = manager.getDepartment();
			departmentId = department.getId();
			Company company = manager.getCompany();
			companyId = company.getId();
		}
		//准备数据，companyList
		List<Company> companyList = companyService.findAll();
		ActionContext.getContext().put("companyList", companyList);
		// 准备数据, departmentList
		List<Department> topList = departmentService.findTopList();
		List<Department> departmentList = DepartmentUtils.getAllDepartments(topList);
		ActionContext.getContext().put("departmentList", departmentList);
		return "queryUI";
	}
	 /**添加页面*/
	public String addUI() throws Exception {
		//准备数据，companyList
		List<Company> companyList = companyService.findAll();
		ActionContext.getContext().put("companyList", companyList);
		// 准备数据, departmentList
		List<Department> topList = departmentService.findTopList();
		List<Department> departmentList = DepartmentUtils.getAllDepartments(topList);
		ActionContext.getContext().put("departmentList", departmentList);
		
		//准备数据，用departmentId,companyId，分别查出上级公司和上级部门
		Department department = departmentService.getById(departmentId);
		Company company = companyService.getById(companyId);
		//用department,company查出上级部门
		List<User> managerList = userService.findManagerByDepartmentAndCompany(department,company);
		ActionContext.getContext().put("managerList", managerList);
		return "saveUI";
	}
	 /**添加*/
	public String add() throws Exception {
		//利用managerId查询manager
		User manager = userService.getById(managerId);
		User user = SessionContext.get();
		user.setManager(manager);
		userService.update(user);
		return "toList";
	} 
	
	 /**修改*/
	public String delete() throws Exception {
		User user = userService.getById(model.getId());
		user.setManager(null);
		userService.update(user);
		return "toList";
	}
	//========================================
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
	public Long getManagerId() {
		return managerId;
	}
	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}
	
	
}
