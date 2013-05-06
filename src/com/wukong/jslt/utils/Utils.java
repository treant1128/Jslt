package com.wukong.jslt.utils;

public class Utils {

	public static String smsPush(String s){
		return (s.equals("true"))?"Push":"����";
	}
	
	public static String skip31(String s){
		return (s.equals("true"))?"��":"��";
	}
	
	public static String verifyStatus(String s){
		return (s.equals("true"))?"ͨ��":"δͨ��";
	}
	
	public static String processStatus(String s){
		String status="";
		switch(Integer.parseInt(s)){
		case 0:
			status="δͨ�����";
			break;
		case 1:
			status="��ִ��";
			break;
		case 2:
			status="ִ����";
			break;
		case 3:
			status="ִ�н���";
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
			status="��ȫȥ��";
			break;
		case 6:
			status="����Ԥ���б�ȥ��";
			break;
		case 5:
			status="�����ѷ�ȥ��";
			break;
		case 0:
			status="��ȥ��";
			break;
		default:
			break;
		}
		return status;
	}
}
