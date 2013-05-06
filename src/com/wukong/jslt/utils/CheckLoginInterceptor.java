package com.wukong.jslt.utils;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.wukong.jslt.action.LoginAction;

public class CheckLoginInterceptor extends AbstractInterceptor  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final String USER_SESSION_KEY="userName";
	private static Logger logger=Logger.getLogger(CheckLoginInterceptor.class);
	
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		// TODO Auto-generated method stub
		// Don't check user login action itself
		Object object=actionInvocation.getAction();
		if(object instanceof LoginAction){
			System.out.println("begin check login interceptor");
//			logger.fatal("执行拦截判断");
			return actionInvocation.invoke();
		}
		
		// check user login session
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request=
			(HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		Object userSession=request.getSession().getAttribute(USER_SESSION_KEY);
		
		// get session use session name
		if(userSession!=null){
			System.out.println("already login Ok Ok Ok");
//			logger.info(userSession+"已经登录,拦截通过"+new Date().toString());
			return actionInvocation.invoke();
		}else{
			System.out.println("no Login, forward login again");
			logger.info(new Date()+"没有登录,跳转至Login");
			return Action.LOGIN;
		}
		
	}
	
}
