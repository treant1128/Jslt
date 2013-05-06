package com.wukong.jslt.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wukong.jslt.dao.FooDAO;
import com.wukong.jslt.pojo.Foo;

public class AuditAction extends ActionSupport {
//	HttpServletRequest mRequest=null;
	private Foo foo;

	
	public Foo getFoo() {
		return foo;
	}

	public void setFoo(Foo foo) {
		this.foo = foo;
	}

	public String allowTask(){
		execute(true, 1);   //通过    待执行
		return SUCCESS;
	}
	
	public String denyTask(){
		execute(false, 0);   //未通过    未通过审核
		return SUCCESS;
	}
	
	public String deleteTask(){
		FooDAO dao=FooDAO.getInstance();
		dao.deleteFooById(foo.getId());
		updateAll(dao);
		return SUCCESS;
	}
	
	private void execute(boolean bool, int process){
//		mRequest=ServletActionContext.getRequest();
		System.out.println(foo.getId());
		FooDAO dao=FooDAO.getInstance();

		dao.updateFooVerifyStatusById(foo.getId(), bool);
		dao.updateFooProcessStatusById(foo.getId(), process);
		
		updateAll(dao);
	}
	
	public String modifyProcessStatus(){
//		mRequest=ServletActionContext.getRequest();
		System.out.println(foo.getId());
		FooDAO dao=FooDAO.getInstance();
		dao.updateFooProcessStatusById(foo.getId(), foo.getProcessStatus());
		updateAll(dao);
		return "modifyProcessStatus";
	}
	
	public void updateAll(FooDAO dao){
		List<Foo> foos=dao.findAll();
		Map<String, Object> session=(Map<String, Object>) ActionContext.getContext().getSession();
		session.put("foos", foos);
	}
}
