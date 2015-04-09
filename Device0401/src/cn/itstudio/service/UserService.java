package cn.itstudio.service;

import java.util.List;

import cn.itstudio.base.DaoSupport;
import cn.itstudio.domain.Company;
import cn.itstudio.domain.Department;
import cn.itstudio.domain.User;

public interface UserService extends DaoSupport<User> {

	/**
	 * 根据登录名与密码查询用户
	 * 
	 * @param loginName
	 * @param password
	 *            明文密码
	 * @return
	 */
	User findByLoginNameAndPassword(String loginName, String password);
   
	/**
	 * 根据departmentId,companyId查出上级领导的集合
	 * @param company
	 * @param department
	 * @return
	 */
	List<User> findUserByDepartAndCompany(Company company, Department department);
    /**
     * 用department,company查出上级部门
     * @param department
     * @param company
     * @return
     */
	List<User> findManagerByDepartmentAndCompany(Department department,
			Company company);
	/**
	 * 判断是否有当前用户名
	 * @param loginName
	 * @return
	 */

	boolean checkUserLoginName(String loginName);
    /**
     * 判断是否有当前邮箱
     * @param email
     * @return
     */
	boolean checkUserEmail(String email);
    /**
     * 对比原密码，是否有权限修改密码    
     * @param oldPassword
     * @return
     */
	boolean checkPassword(String oldPassword);
    /**
     * 根据登录名与密码查询用户
     * @param loginName
     * @return
     */
	User findByLoginName(String loginName);

}
