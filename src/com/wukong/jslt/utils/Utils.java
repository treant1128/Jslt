package com.wukong.jslt.utils;

public class Utils {

	public static String smsPush(String s){
		return (s.equals("true"))?"Push":"短信";
	}
	
	public static String skip31(String s){
		return (s.equals("true"))?"是":"否";
	}
	
	public static String verifyStatus(String s){
		return (s.equals("true"))?"通过":"未通过";
	}
	
	public static String processStatus(String s){
		String status="";
		switch(Integer.parseInt(s)){
		case 0:
			status="未通过审核";
			break;
		case 1:
			status="待执行";
			break;
		case 2:
			status="执行中";
			break;
		case 3:
			status="执行结束";
			break;
		default:
			break;
		}
		return status;
	}
	
	public static String antiDuplicate(String qcType){
		String status="";
		switch(Integer.valueOf(qcType)){
		case 7:
			status="完全去重";
			break;
		case 6:
			status="仅和预置列表去重";
			break;
		case 5:
			status="仅和已发去重";
			break;
		case 0:
			status="不去重";
			break;
		default:
			break;
		}
		return status;
	}
}
