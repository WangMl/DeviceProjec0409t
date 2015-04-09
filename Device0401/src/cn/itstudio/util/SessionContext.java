package cn.itstudio.util;

import org.apache.struts2.ServletActionContext;

import cn.itstudio.domain.User;

public class SessionContext {
	
	public static void setUser(User user){
		if(user!=null){
			ServletActionContext.getRequest().getSession().setAttribute("user", user);
		}else{
			ServletActionContext.getRequest().getSession().removeAttribute("user");
		}
	}
	
	public static User get(){
		return (User) ServletActionContext.getRequest().getSession().getAttribute("user");
	}
}
