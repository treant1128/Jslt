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

		String sendTimeType=mRequest.getParameter("smsTask.sendTimeType");  //�·�ʱ��
		String sendTitle=mRequest.getParameter("smsTask.sendTitle");     //�·���
		String sendOUrl=mRequest.getParameter("smsTask.sendOUrl");       //�·�URL
		String content=mRequest.getParameter("smsTask.content");         //����
		String priority=mRequest.getParameter("smsTask.priority");       //���ȼ�
		String method=mRequest.getParameter("smsTask.method");           //��ʽSms??Push
		String jump=mRequest.getParameter("jump");                       //����31597
		String qcType=mRequest.getParameter("smsTask.qcType");           //ȥ�ع���
		String itType=mRequest.getParameter("itType");                   //�·�ʱ���

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
