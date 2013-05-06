package com.wukong.jslt.action;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.wukong.jslt.dao.FooDAO;
import com.wukong.jslt.pojo.Foo;

public class FooAction extends ActionSupport {
	HttpServletRequest mRequest;
	
	public String addTask(){
		mRequest=ServletActionContext.getRequest();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:00");

		String sendTimeType=mRequest.getParameter("smsTask.sendTimeType");  //下发时间
		String sendTitle=mRequest.getParameter("smsTask.sendTitle");     //下发语
		String sendOUrl=mRequest.getParameter("smsTask.sendOUrl");       //下发URL
		String content=mRequest.getParameter("smsTask.content");         //描述
		String priority=mRequest.getParameter("smsTask.priority");       //优先级
		String method=mRequest.getParameter("smsTask.method");           //方式Sms??Push
		String jump=mRequest.getParameter("jump");                       //跳出31597
		String qcType=mRequest.getParameter("smsTask.qcType");           //去重规则
		String itType=mRequest.getParameter("itType");                   //下发时间段

		Foo foo=new Foo();
		foo.setVerifyStatus(false);
		foo.setProcessStatus(0);
		foo.setTitle(sendTitle);
		foo.setTaskUrl(sendOUrl);
		foo.setDescription(content);
//		try {
//			foo.setCreateDate(new Timestamp(format.parse(sendTimeType).getTime()));
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		System.out.println("method="+method);
		System.out.println("skip31="+jump);
		
		foo.setPriority(Integer.valueOf(priority));
		foo.setSmsPush(Integer.valueOf(method)==1?true:false);
		foo.setSkip31(Integer.valueOf(jump)==1?true:false);
		
		foo.setAntiDuplicate(Integer.valueOf(qcType));
//		foo.setExecuteDate(executeDate);
		FooDAO.getInstance().save(foo);
		return SUCCESS;
	}
}
