package cn.itstudio.view.action;

import java.util.HashSet;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itstudio.base.BaseAction;
import cn.itstudio.domain.Company;
import cn.itstudio.domain.Department;
import cn.itstudio.domain.Role;
import cn.itstudio.domain.User;
import cn.itstudio.util.DepartmentUtils;
import cn.itstudio.util.QueryHelper;
import cn.itstudio.util.SessionContext;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {
    private String oldPassword;
	private Long departmentId;
	private Long companyId;
	private Long[] roleIds;
    private String roleName;
    public static int online =0;
	/** 列表 */
	public String list() throws Exception {
		// List<User> userList = userService.findAll();
		// ActionContext.getContext().put("userList", userList);

		// 准备分页信息
		new QueryHelper(User.class, "u").preparePageBean(userService, pageNum, pageSize);

		return "list";
	}

	/** 删除 */
	public String delete() throws Exception {
		userService.delete(model.getId());
		return "toList";
	}

	/** 添加页面 */
	public String addUI() throws Exception {
		//准备数据，companyList
		List<Company> companyList = companyService.findAll();
		ActionContext.getContext().put("companyList", companyList);
		// 准备数据, departmentList
		List<Department> topList = departmentService.findTopList();
		List<Department> departmentList = DepartmentUtils.getAllDepartments(topList);
		ActionContext.getContext().put("departmentList", departmentList);

		// 准备数据, roleList
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);

		return "saveUI";
	}

	/** 添加 */
	public String add() throws Exception {
		// 封装到对象中（当model是实体类型时，也可以使用model，但要设置未封装的属性）
		//>>设置所属公司
		model.setCompany(companyService.getById(companyId));
		// >> 设置所属部门
		model.setDepartment(departmentService.getById(departmentId));
		// >> 设置关联的岗位
		List<Role> roleList = roleService.getByIds(roleIds);
		model.setRoles(new HashSet<Role>(roleList));
		// >> 设置默认密码为1234（要使用MD5摘要）
		String md5Digest = DigestUtils.md5Hex("123456");
		model.setPassword(md5Digest);

		// 保存到数据库
		userService.save(model);

		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		//准备数据，companyList
		List<Company> companyList = companyService.findAll();
		ActionContext.getContext().put("companyList", companyList);
		// 准备数据, departmentList
		List<Department> topList = departmentService.findTopList();
		List<Department> departmentList = DepartmentUtils.getAllDepartments(topList);
		ActionContext.getContext().put("departmentList", departmentList);

		// 准备数据, roleList
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);

		// 准备回显的数据
		User user = userService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(user);
		if (user.getDepartment() != null) {
			departmentId = user.getDepartment().getId();
		}
		if(user.getCompany()!=null){
			companyId = user.getCompany().getId();
		}
		if (user.getRoles() != null) {
			roleIds = new Long[user.getRoles().size()];
			int index = 0;
			for (Role role : user.getRoles()) {
				roleIds[index++] = role.getId();
			}
		}
        
		return "saveUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		// 1，从数据库中取出原对象
		User user = userService.getById(model.getId());

		// 2，设置要修改的属性
		user.setLoginName(model.getLoginName());
		user.setName(model.getName());
		user.setGender(model.getGender());
		user.setPhoneNumber(model.getPhoneNumber());
		user.setEmail(model.getEmail());
		user.setDescription(model.getDescription());
		//>>设置所属公司
		user.setCompany(companyService.getById(companyId));
		// >> 设置所属部门
		user.setDepartment(departmentService.getById(departmentId));
		// >> 设置关联的岗位
		List<Role> roleList = roleService.getByIds(roleIds);
		user.setRoles(new HashSet<Role>(roleList));

		// 3，更新到数据库
		userService.update(user);

		return "toList";
	}
	/** 修改个人信息页面 */
	public String editInfoUI() throws Exception {
		//准备数据，companyList
		List<Company> companyList = companyService.findAll();
		ActionContext.getContext().put("companyList", companyList);
		// 准备数据, departmentList
		List<Department> topList = departmentService.findTopList();
		List<Department> departmentList = DepartmentUtils.getAllDepartments(topList);
		ActionContext.getContext().put("departmentList", departmentList);

		// 准备数据, roleList
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);

		// 准备回显的数据
		User user = userService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(user);
		if (user.getDepartment() != null) {
			departmentId = user.getDepartment().getId();
		}
		if(user.getCompany()!=null){
			companyId = user.getCompany().getId();
		}

        
		return "editInfoUI";
	}

	/** 修改个人信息 */
	public String editInfo() throws Exception {
		// 1，从数据库中取出原对象
		User user = userService.getById(model.getId());

		// 2，设置要修改的属性
		user.setLoginName(model.getLoginName());
		user.setName(model.getName());
		user.setGender(model.getGender());
		user.setPhoneNumber(model.getPhoneNumber());
		user.setEmail(model.getEmail());
		user.setDescription(model.getDescription());
		//>>设置所属公司
		user.setCompany(companyService.getById(companyId));
		// >> 设置所属部门
		user.setDepartment(departmentService.getById(departmentId));

		// 3，更新到数据库
		userService.update(user);

		return "toList";
	}

	/** 查看个人信息 */
	public String show() throws Exception {
		//根据id查询user用户
		User user = userService.getById(model.getId());
        ActionContext.getContext().put("user", user);
		return "show";
	}
	/** 查看个人信息(主菜单) */
	public String info() throws Exception {
		//根据id查询user用户
		Long userId = SessionContext.get().getId();
		User user = userService.getById(userId);
        ActionContext.getContext().put("user", user);
		return "show";
	}
	/** 查看个人信息 */
	public String changePasswordUI() throws Exception {
		return "changePasswordUI";
	}
	
	/** 查看个人信息 */
	public String changePassword() throws Exception {
		//对比原密码，是否有权限修改密码	
		String md5Digest = DigestUtils.md5Hex(oldPassword);
		boolean flag = userService.checkPassword(md5Digest);
		if(flag){
			User user = userService.getById(model.getId());
			user.setPassword(DigestUtils.md5Hex(model.getPassword()));
			userService.update(user);
			return "pwdValidateUI";
		}else{
			addFieldError("pswError", "原密码与输入的不一致，请重新输入正确的密码！");
			return "changePasswordUI";
		}		
		
	}
	/** 初始化密码为1234 */
	public String initPassword() throws Exception {
		// 1，从数据库中取出原对象
		User user = userService.getById(model.getId());

		// 2，设置要修改的属性（要使用MD5摘要）
		String md5Digest = DigestUtils.md5Hex("123456");
		user.setPassword(md5Digest);

		// 3，更新到数据库
		userService.update(user);

		return "toList";
	}

	/** 登录页面 */
	public String loginUI() throws Exception {
		return "loginUI";
	}

	/** 登录 */
	public String login() throws Exception {
		User user = userService.findByLoginNameAndPassword(model.getLoginName(), model.getPassword());
		if (user == null) {
			addFieldError("login", "用户名或密码不正确！");
			return "loginUI";
		} else {
			// 登录用户
			if(SessionContext.get()!=null){
				online--;
			}
			ActionContext.getContext().getSession().put("user", user);
			online ++;
			return "toIndex";
		}
	}
	 /**注册界面 */
		public String registerUI() throws Exception{
			
			return "registerUI";
		}
     /**注册 */
	public String register() throws Exception{
		//判断是否有当前用户名
		if(userService.checkUserLoginName(model.getLoginName())){
			addFieldError("registerName","该用户名已经注册");
			return "registerUI";			
		}else if(userService.checkUserEmail(model.getEmail())){
			addFieldError("registerEmail","该邮箱已经注册");
			return "registerUI";	
		}else{
			//根据roleName查询role对象集合，实质上查询的事role
			List<Role> role = roleService.getByRoleName(roleName);
			model.setRoles(new HashSet<Role>(role));
			String md5Digest = DigestUtils.md5Hex(model.getPassword());
			model.setPassword(md5Digest);
			userService.save(model);
			User user = userService.findByLoginName(model.getLoginName());
			ActionContext.getContext().getSession().put("user", user);
			online ++;
			return "toIndex";
		}
	}
	/** 注销 */
	public String logout() throws Exception {
		ActionContext.getContext().getSession().remove("user");
		return "logout";
	}

	// ---

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public Long[] getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(Long[] roleIds) {
		this.roleIds = roleIds;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}


    
}
