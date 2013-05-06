package com.wukong.jslt.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wukong.jslt.dao.UserDAO;
import com.wukong.jslt.pojo.User;

public class UserAction extends ActionSupport {
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String changePassword(){
		Map<String, Object> session=(Map<String, Object>) ActionContext.getContext().getSession();
		UserDAO dao=UserDAO.getInstance();
		User u=dao.getUniqueUserByName(user.getName());
		session.put("name", user.getName());
		session.put("pwd", user.getPwd());
		return SUCCESS;
	}
}
