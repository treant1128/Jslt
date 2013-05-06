package com.wukong.jslt.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.wukong.jslt.dao.FooDAO;
import com.wukong.jslt.pojo.Foo;
import com.wukong.jslt.utils.CheckLoginInterceptor;
import com.wukong.jslt.utils.DBToolkit;

public class LoginAction extends ActionSupport implements SessionAware {
	public static String secretKeys=null;
	public String userName=null;
	public String userPassword=null;
	private Map<String, Object> session=null;
	List<Foo> foos=null;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String execute(){
		Connection conn  = DBToolkit.getConnection();
		if(conn==null){System.out.println("链接失败");}
		StringBuffer sql = new StringBuffer("select * from user where name = '");  //table operator
		sql.append(userName).append("' and pwd = '").append(userPassword).append("'");
		ResultSet rs = DBToolkit.executeQuery(conn, sql.toString());
		try {
			if(rs.next()){
				String name=rs.getString("name");
				String password=rs.getString("pwd");
				if(name==null||password==null){
					return "LoginFailture";
				}
				
				session.put(CheckLoginInterceptor.USER_SESSION_KEY, name);
				//加载频道列表
				foos=FooDAO.getInstance().findAll();
				session.put("foos", foos);
				
			}else{
				return "LoginFailture";
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally{
			DBToolkit.closeConnection(conn, null, rs);
		}
		
		if(userName.equals("hejie")){
			return "FooSuccess";
		}
		return "JSLTSuccess";
	}
	
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	
}
