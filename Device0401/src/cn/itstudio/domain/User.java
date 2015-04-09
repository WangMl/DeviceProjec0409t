package cn.itstudio.domain;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;

/**
 * 用户
 * 
 * @author tyg
 * 
 */
public class User implements java.io.Serializable{
	private Long id;
	private Department department;
	private Set<Role> roles = new HashSet<Role>();
    private Company company;
    private User manager;//用户对应上级领导
    private Set<User> employee = new HashSet<User>(); //用户对应夏季员工
    private Set<DeviceBill> deviceBills = new HashSet<DeviceBill>();//用户所对应的设备报单
	private String loginName; // 登录名
	private String password; // 密码
	private String name; // 真实姓名
	private String gender; // 性别
	private String phoneNumber; // 电话号码
	private String email; // 电子邮件
	private String description; // 说明

	/**
	 * 判断本用户是否有指定名称的权限
	 * 
	 * @param name
	 * @return
	 */
	public boolean hasPrivilegeByName(String name) {
		// 超级管理有所有的权限
		if (isAdmin()) {
			return true;
		}

		// 普通用户要判断是否含有这个权限
		for (Role role : roles) {
			for (Privilege priv : role.getPrivileges()) {
				if (priv.getName().equals(name)) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 判断本用户是否有指定URL的权限
	 * 
	 * @param privUrl
	 * @return
	 */
	public boolean hasPrivilegeByUrl(String privUrl) {
		// 超级管理有所有的权限
		if (isAdmin()) {
			return true;
		}

		// >> 去掉后面的参数
		int pos = privUrl.indexOf("?");
		if (pos > -1) {
			privUrl = privUrl.substring(0, pos);
		}
		// >> 去掉UI后缀
		if (privUrl.endsWith("UI")) {
			privUrl = privUrl.substring(0, privUrl.length() - 2);
		}

		// 如果本URL不需要控制，则登录用户就可以使用
		Collection<String> allPrivilegeUrls = (Collection<String>) ActionContext.getContext().getApplication().get("allPrivilegeUrls");
		if (!allPrivilegeUrls.contains(privUrl)) {
			return true;
		} else {
			// 普通用户要判断是否含有这个权限
			for (Role role : roles) {
				for (Privilege priv : role.getPrivileges()) {
					if (privUrl.equals(priv.getUrl())) {
						return true;
					}
				}
			}
			return false;
		}
	}

	/**
	 * 判断本用户是否是超级管理员
	 * 
	 * @return
	 */
	public boolean isAdmin() {
		return "admin".equals(loginName);
	}
     /**
      * 判断是否为男性
      * @return
      */
	public boolean isMan(String gender){
		if("男".equals(gender)){
			return true;
		}		 
		return false;
	}
    /**
     * 判断是否为女性
     * @return
     */
	public boolean isWoman(String gender){
		if("女".equals(gender)){
			return true;
		}		 
		return false;
	}
    /**
     * 判断是否为保密
     * @return
     */
	public boolean isSecret(String gender){
		if("保密".equals(gender)){
			return true;
		}		 
		return false;
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public User getManager() {
		return manager;
	}

	public void setManager(User manager) {
		this.manager = manager;
	}

	public Set<User> getEmployee() {
		return employee;
	}

	public void setEmployee(Set<User> employee) {
		this.employee = employee;
	}

	public Set<DeviceBill> getDeviceBills() {
		return deviceBills;
	}

	public void setDeviceBills(Set<DeviceBill> deviceBills) {
		this.deviceBills = deviceBills;
	}
	
	

}