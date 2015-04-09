package cn.itstudio.service.impl;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itstudio.base.DaoSupportImpl;
import cn.itstudio.domain.Company;
import cn.itstudio.domain.Department;
import cn.itstudio.domain.User;
import cn.itstudio.service.UserService;

@Service("userService")
@Transactional
@SuppressWarnings("unchecked")
public class UserServiceImpl extends DaoSupportImpl<User> implements UserService {

	public User findByLoginNameAndPassword(String loginName, String password) {
		// 使用密码的MD5摘要进行对比
		String md5Digest = DigestUtils.md5Hex(password);
		return (User) getSession().createQuery(//
				"FROM User u WHERE u.loginName=? AND u.password=?")//
				.setParameter(0, loginName)//
				.setParameter(1, md5Digest)//
				.uniqueResult();
	}

	public List<User> findUserByDepartAndCompany(Company company,
			Department department) {

		return getSession().createQuery(//
				 "FROM User u WHERE u.company = ? AND u.department = ?")//
				 .setParameter(0, company)//
				 .setParameter(1, department)//
				 .list();
	}
	//用department,company查出上级部门
	public List<User> findManagerByDepartmentAndCompany(Department department,
			Company company) {
		
		return getSession().createQuery(//
				"FROM User u WHERE u.department = ? AND u.company = ?")//
				.setParameter(0, department)//
				.setParameter(1, company)//
				.list();
	}


	public boolean checkUserEmail(String email) {
		boolean flag =false;
		Long count = (Long) getSession().createQuery(//
				"SELECT COUNT(*) FROM User u WHERE u.email = ?")//
				.setParameter(0, email)//
				.uniqueResult();
		if(count>0){
			flag = true;
		}
		return flag;
	}

	public boolean checkUserLoginName(String loginName) {
		boolean flag =false;
		Long count = (Long) getSession().createQuery(//
				"SELECT COUNT(*) FROM User u WHERE u.loginName = ?")//
				.setParameter(0, loginName)//
				.uniqueResult();
		if(count>0){
			flag = true;
		}
		return flag;
	}

	public boolean checkPassword(String oldPassword) {
		boolean flag =false;
		Long count = (Long) getSession().createQuery(//
				"SELECT COUNT(*) FROM User u WHERE u.password = ?")//
				.setParameter(0, oldPassword)//
				.uniqueResult();
		if(count>0){
			flag = true;
		}
		return flag;
	}

	public User findByLoginName(String loginName) {
		// 使用密码的MD5摘要进行对比
		return (User) getSession().createQuery(//
				"FROM User u WHERE u.loginName=? ")//
				.setParameter(0, loginName)//
				.uniqueResult();
	}
	

}
