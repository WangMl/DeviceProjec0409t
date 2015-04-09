package cn.itstudio.util;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.itstudio.domain.Privilege;
import cn.itstudio.domain.User;

@Component
public class Installer {

	@Resource
	private SessionFactory sessionFactory;

	/**
	 * 执行安装
	 */
	@Transactional
	public void install() {
		Session session = sessionFactory.getCurrentSession();

		// ==============================================================
		// 保存超级管理员用户
		User user = new User();
		user.setLoginName("admin");
		user.setName("超级管理员");
		user.setPassword(DigestUtils.md5Hex("admin"));
		session.save(user); // 保存

		// ==============================================================
		// 保存权限数据
		Privilege menu, menu1, menu2, menu3, menu4,menu5,menu6;
		// --------------------
		menu = new Privilege("设备管理", null, "icon-pencil",null);
		menu1 = new Privilege("设备申请", "/deviceBill_list", null,menu);
		menu2 = new Privilege("待办", "/deal_list", null,menu);
		menu3 = new Privilege("流程部署", "/deploy_list", null,menu);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		// --------------------
		menu = new Privilege("网上交流", null, "icon-comment",null);
		menu1 = new Privilege("论坛管理", "/forumManage_list", null,menu);
		menu2 = new Privilege("论坛", "/forum_list",null, menu);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);

		// --------------------
		menu = new Privilege("系统管理", null,"icon-wrench", null);
		menu1 = new Privilege("公司管理", "/company_list",null, menu);
		menu2 = new Privilege("部门管理", "/department_list",null, menu);
		menu3 = new Privilege("岗位管理", "/role_list",null, menu);
		menu4 = new Privilege("用户管理", "/user_list", null,menu);
		menu5 = new Privilege("个人信息", "/user_info", null,menu);
		menu6 = new Privilege("上级领导管理","/manager_list",null,menu);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		session.save(menu4);
		session.save(menu5);
		session.save(menu6);
		
		session.save(new Privilege("公司列表", "/company_list", null,menu1));
		session.save(new Privilege("公司删除", "/company_delete", null,menu1));
		session.save(new Privilege("公司添加", "/company_add", null,menu1));
		session.save(new Privilege("公司修改", "/company_edit", null,menu1));
		
		session.save(new Privilege("部门列表", "/department_list", null,menu2));
		session.save(new Privilege("部门删除", "/department_delete", null,menu2));
		session.save(new Privilege("部门添加", "/department_add", null,menu2));
		session.save(new Privilege("部门修改", "/department_edit", null,menu2));

		session.save(new Privilege("岗位列表", "/role_list",null, menu3));
		session.save(new Privilege("岗位删除", "/role_delete", null,menu3));
		session.save(new Privilege("岗位添加", "/role_add", null,menu3));
		session.save(new Privilege("岗位修改", "/role_edit", null,menu3));


		session.save(new Privilege("用户列表", "/user_list", null,menu4));
		session.save(new Privilege("用户删除", "/user_delete", null,menu4));
		session.save(new Privilege("用户添加", "/user_add", null,menu4));
		session.save(new Privilege("用户修改", "/user_edit", null,menu4));
		session.save(new Privilege("初始化密码", "/user_initPassword", null,menu4));
		
		session.save(new Privilege("查看个人信息", "/user_show", null,menu5));
		session.save(new Privilege("修改个人信息", "/user_editInfo", null,menu5));
		session.save(new Privilege("修改个人密码", "/user_changePassword", null,menu5));


	}

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		Installer installer = (Installer) ac.getBean("installer");
		installer.install();
	}
}
