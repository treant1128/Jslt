<%@page language="java" pageEncoding="GB2312"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>�����̨</title>
<%@include file="/include/lib.jsp"%>
  	<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link type="text/css" href="css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
	<script src="<s:url value="/js/plugins/jquery.easyInsert.js"/>" type="text/javascript"></script>
	<script src="http://code.jquery.com/jquery.js"></script>
 
	<script type="text/javascript">
		
		$(function() {
			var result='${result}';
			if(result!=""&&result=="1"){
				//jAlert('success', '�����ѳɹ�!', '������ʾ');
				
				$("#smsTaskForm").attr("action", "<%=request.getContextPath()%>/smsManage/smsTaskList.do?method=query");
				$("#smsTaskForm").submit();
			}
			$.formValidator.initConfig({formid:"smsTaskForm",onerror:function(msg){jAlert('error', msg, '������ʾ��');}});
			$("#sendTitle").formValidator({empty:false,onshow:"�·��ﲻ��Ϊ��",onempty:"�·��ﲻ��Ϊ��"}).inputValidator({min:1,onerror:"�·��ﲻ��Ϊ��"}).regexValidator({regexp:"^[\\S]\.*$",onerror:"�·��ﲻ��ȷ"});;
			$("#sendOUrl").formValidator({onshow:"URL������ http:// ���� https:// ��ʼ "}).regexValidator({regexp:"^\(http|https):\/\/(\\S)+$",onerror:"url����ȷ"});
			
			$("#method1").click( function () { 
				   $("#purl").show();
				   $("#purl_bt").show();
				   $("#sendOUrl").val("");
				   $("#sendOUrl").attr("disabled",false); 
				   $("#sendOUrl").formValidator({onshow:"URL������ http:// ���� https:// ��ʼ "}).regexValidator({regexp:"^\(http|https):\/\/(\\S)+$",onerror:"url����ȷ"});
			});
			$("#method0").click( function () { 
				  // $("#purl").hide();
				   //$("#purl_bt").hide();
				 //  $("#sendOUrl").val("http://wukong.com");
				   $("#sendOUrl").formValidator({onshow:"URL������ http:// ���� https:// ��ʼ "}).regexValidator({regexp:"^$|^\(http|https):\/\/(\\S)+$",onerror:"url����ȷ"});
				   //$("#sendOUrl").attr("disabled",true); 
			});
			
			$("#itType").click( function () { 
				   $("#itDiv").toggle(1000);
			});
			
//			$("#filePath").change(function(){ alert("change");
//				$("#numDiv").html("");
//				var fp=$("#filePath").val();
//				if(typeof(fp) == "undefined" || $.trim(fp)=="")
//					return;
//				$.getJSON(
//						'<s:url value="/smsManage/getFileList.do"/>', 
//						{ "filePath":fp,"isVip":<s:property value="isVip"/>},
//						function(data){
//							if(data==null)
//								return;
//							var numHtm="";
//							$.each(data,function(idx,item){ 
//								numHtm = numHtm + "<span style='width:250px;display:inline-block;'><input name='numFiles' value='"+item.name+"' type='checkbox'>"+item.name+"("+item.linenum+")</span>";
//							});
//							$("#numDiv").html(numHtm);			
//						},
//					);
//			});
			
			
			
	 		$("#button_submit").click(function(){
				if(!checkNumF())
				{
					jAlert('error', '��ѡ��������', '������ʾ��');
					return;
				}
				if(!checkIt())
				{
					jAlert('error', '����ȷ��д�·�ʱ��Σ�', '������ʾ��');
					return;
				}
				var jump31597 = $("#tofns").val();
				var jumpMP = $("#MP").val();
				var myappgo = $("#myappgoH").val();
				if(myappgo==1){
					$("#jump").val("2")
				}else{
					if(jump31597==0&&jumpMP==0){
						$("#jump").val("0")
					}else if(jump31597==0&&jumpMP==1){
						$("#jump").val("4")
					}else if(jump31597==1&&jumpMP==0){
						$("#jump").val("1")
					}else if(jump31597==1&&jumpMP==1){
						$("#jump").val("3")
					}
				}
				$("#smsTaskForm").submit();
			});
			
			//$("#bnShouqi").click(function(){
			//	var bnShouqi = document.getElementById("#div_shouqi");
			//	alert(bnShouqi.innerHTML);
			//	bnShowqi.disabled="true";
			//	alert("11");
			//}
			//);
	 		
	 		$("#demo2").easyinsert({
	 			name: ["intervlTimes"],
	 			type: ["wk"]
	 		});
			
		});
		function checkNumF(){
			var flag = false;
			var nf = $("input[name=numFiles]:checkbox");
			if(typeof(nf) == "undefined"||nf.length==0){
				return flag;
			}
			$("input[name=numFiles]:checkbox").each(function () { 
				if ($(this).attr("checked")==true) { 
					flag=true;				
				} 
			});
			return flag;
		}
		function checkIt(){
			var flag = true;
			if($("input[name=itType]:checkbox").attr("checked")==true){
				$("input[name=intervlTimes]:text").each(function () { 
					if ($(this).attr("value")=="") { 
						flag=false;				
					} 
				});
			}
			return flag;
		}
		function checkSetTime(divId,flag){
		    if(1 == flag){
		        document.getElementById(divId).style.display='block';
		        $("#sendTime").attr("disabled",false); 
		    }else{
		        document.getElementById(divId).style.display='none';
		        $("#sendTime").attr("disabled",true); 
		    }
	
		}
		
		function shouqi(){
			//$("#taskDiv").hide();
			document.getElementById("taskDiv").style.display="none";
		}
		function zhankai(){
			document.getElementById("taskDiv").style.display="block";
		}
		
		function  set31597(value){
			$("#tofns").val(value);
		}
		
		function  setMP(value){
			$("#MP").val(value);
		}
		
		function setMyappgo(value){
			var myappgo = document.getElementById("myappgo").checked;
			if(myappgo){
				$("#myappgoH").val("1");
				$("#jump0").attr("disabled",true); 
				$("#jump1").attr("disabled",true); 
				$("#MP0").attr("disabled",true); 
				$("#MP1").attr("disabled",true); 
			}else{
				$("#myappgoH").val("0");
				$("#jump0").attr("disabled",false); 
				$("#jump1").attr("disabled",false); 
				$("#MP0").attr("disabled",false); 
				$("#MP1").attr("disabled",false); 
			}
		}
		
		
	</script>

<base target="_seft">
	
</head>

<head>
	<title>�����̨</title>
<script src="http://code.jquery.com/jquery.js"></script>

<style type="text/css">
.mytb{margin-top: 3px;z-index: 10000;}
/* �б�table */
table.listTable{width:100%;border:1px solid black;margin-top: 5px;border-top-width: 0px; }
table.listTable td{ padding:5px 10px 0 15px; text-align:left; border-top:1px solid black; background:#FFFFFF;border-left-width: 0px;border-right-width: 0px;}

</style>

</head>
<body onload="myClose()">
	<jsp:include page="/include/headerSMS.jsp"/>
	<jsp:include page="/include/smsli.jsp"/>
	<br>
	<s:form action="fooAction!addTask" id="smsTaskForm" name="smsTaskForm" method="post">
		
		<s:if test="isVip==1">
		   <span style="margin-left:8px;color:#2EA8C0;FONT-SIZE: 12pt">VIP���񲻽��а��������ˣ�����ҵ����գ��������</span>
		</s:if>		
		<span id="infols"></span>
		<table width="100%" class="infoForm">
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			<tr>
				<td class="tdL">ѡ���ļ���</td>
				<td class="tdR">
					<select name="filePath" id="filePath" class="input_text_2" height="50px" >
						<!-- 
					    <s:iterator value="directoryList" id="dls" >
							<option value="<s:property value="#dls.name"/>"><s:property value="#dls.name"/></option>
						</s:iterator>  
						 -->       
					</select> 
					<span style="margin-left:3px;color:#FF7F00;">(ѡ���ļ���)</span>
					<!-- 
					ȫѡ<input type="checkbox" name="numFile" id="checkAll" onclick="checkAllNum(this)">
					��ѡ<input type="checkbox" name="numFileReverse" id="reverseAll" onclick="reverseAllNum(this)">
					 -->
					<div id="numDiv"></div>
					<div id="numFileTip" style="width:250px;"></div>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			<tr>
				<td class="tdL">ȥ������</td>
				<td class="tdR">
					 <input type="text" class="input_text_2" name="btDate" id="btDate" value='<s:date name="btDate" format="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly"/>&nbsp;&nbsp;
					 <input type="button" value="��ѯ����" id="taskBtn"/><a href="#" id="bnShouqi" onclick="shouqi()">����</a>&nbsp;&nbsp;&nbsp;<a href="#" id="bnShouqi" onclick="zhankai()">չ��</a><font color="red">��*ע�������ѯ��������������ȥ�أ�</font>
					 <span style="margin-left:3px;color:#FF7F00;">(ѡ�����ڲ�ѯ����)</span>
					 <div id="taskDiv"></div>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			<tr>
				<td class="tdL">�·�ʱ�䣺</td>
				<td class="tdR">
					<input type="radio" name="smsTask.sendTimeType" id="send_status0" value="0" onclick="javascript:checkSetTime('timediv',0);" checked="checked"/>�����·�&nbsp;&nbsp;
					<input type="radio" name="smsTask.sendTimeType" id="send_status1" value="1" onclick="javascript:checkSetTime('timediv',1);"/>��ʱ�·�&nbsp;&nbsp;
					<input type="radio" name="smsTask.sendTimeType" id="send_status2" value="2" onclick="javascript:checkSetTime('timediv',0);"/>�Ժ�ָ��&nbsp;&nbsp;
						        <div style="display:none;padding:6px 0 2px 20px;" id="timediv">
								        ��ʼʱ�䣺<input type="text" name="smsTask.sendTime" id="sendTime" value="<s:date name="btDate" format="yyyy-MM-dd HH:mm:00"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00',minDate:'<s:date name="btDate" format="yyyy-MM-dd HH:mm:00"/>',isShowClear:false,readOnly:true})"/> 
					        	</div>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM"></td>
			</tr>
			<tr>
				<td class="tdL">�·��</td>
				<td class="tdR">
					<!-- <input class="input_text_1" name="smsTask.sendTitle" id="sendTitle1" maxlength="100" type="text"/> -->
					<textarea name="smsTask.sendTitle" id="sendTitle" cols='78' rows='3' onkeyup="value=value.replace(/[\r\n]/g,'')"></textarea> <span style="margin-left:3px;color:#FF7F00;">�벻Ҫ����س���</span>
					        	<div id="sendTitleTip"></div>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			<tr id="purl">
				<td class="tdL">�·�URL��</td>
				<td class="tdR">
 					<input class="input_text_1" name="smsTask.sendOUrl" id="sendOUrl" value="" type="text"/>
					<div id="sendOUrlTip"></div>
				</td>
			</tr>
			<tr id="purl_bt">
				<td class="tdL">&nbsp;</td>
				<td class="tdM"></td>
			</tr>
			
			<tr>
				<td class="tdL">������</td>
				<td class="tdR">
					<input class="input_text_1" name="smsTask.content" value="" type="text"/>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM"></td>
			</tr>
			<tr>
				<td class="tdL">���ȼ���</td>
				<td class="tdR">
					<select name="smsTask.priority">
					                <option value="0">0</option>
					                <option value="1">1</option>
					                <option value="2">2</option>
					                <option value="3">3</option>
					                <option value="4">4</option>
					                <option value="5">5</option>
					                <option value="6">6</option>
					                <option value="7">7</option>
					                <option value="8">8</option>
					                <option value="9">9</option>
					            </select>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			
			<tr>
				<td class="tdL">��ʽ��</td>
				<td class="tdR">	
					<label style="width:100px;display:inline-block;"><input type="radio" name="smsTask.method" id="method0" value="0"/>����</label>
					            <input type="radio" name="smsTask.method" id="method1" value="1" checked="checked" />push
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			
			<s:if test="isVip==1">
			<s:hidden name="smsTask.vip" value="1"></s:hidden>
			<s:hidden name="smsTask.blackFilter" value="0"></s:hidden>
			</s:if>		
			
			<tr>
				<td class="tdL">�Ƿ��������⣺</td>
				<td class="tdR">
				<input type="radio" name="smsTask.longTitle" id="longTitle" value="0" checked="checked"/>��&nbsp;&nbsp;
				<input type="radio" name="smsTask.longTitle" id="longTitle" value="1"/>��
					 <span style="margin-left:6px;color:#FF7F00;">���������⽫���Ա���ضϣ������·���������һ�����ŵĳ����ʺϽض�!</span>
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">myappgo��</td>
				<td class="tdR">
					<input type="checkbox" name="myappgo" id="myappgo" value="2"  onclick="setMyappgo('2')"/>myappgo&nbsp;&nbsp;
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">����31597��</td>
				<td class="tdR">
					 <input type="radio" name="jump" id="jump0" value="0" checked="checked" onclick="set31597('0')"/>��&nbsp;&nbsp;
					 <input type="radio" name="jump" id="jump1" value="1"  onclick="set31597('1')"/>��&nbsp;&nbsp;
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">����΢�Ż���</td>
				<td class="tdR">
					 <input type="radio" name="MP" id="MP0" value="0" checked="checked" onclick="setMP('0')"/>��&nbsp;&nbsp;
					 <input type="radio" name="MP" id="MP1" value="1"  onclick="setMP('1')"/>��&nbsp;&nbsp;
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">ȥ�ع���</td>
				<td class="tdR">
					<input type="radio" name="smsTask.qcType" id="qcType7" value="7" checked="checked"/>��ȫȥ��&nbsp;&nbsp;
					<input type="radio" name="smsTask.qcType" id="qcType6" value="6" />����Ԥ���б�ȥ��&nbsp;&nbsp;
					<input type="radio" name="smsTask.qcType" id="qcType5" value="5" />�����ѷ�ȥ��&nbsp;&nbsp;
					<input type="radio" name="smsTask.qcType" id="qcType0" value="0" />��ȥ��&nbsp;&nbsp;
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">�·�ʱ��Σ�</td>
				<td class="tdR">
				 <input type="checkbox" name="itType" id="itType" value="1"/>
				 <span style="margin-left:6px;color:#FF7F00;">��ѡ�Զ����·�ʱ��Σ��������Ĭ��ʱ���!</span>
				<div id="itDiv" style="display:none; ">
					<ul id="demo2"></ul>
					<a href="#">+ ���</a>
				</div>
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
					<input type="hidden" value="<s:property value="isVip"/>" name="isVip"/>
					<input type="hidden" value="0" name="tofns" id="tofns"/>
					<input type="hidden" value="0" name="myappgoH" id="myappgoH"/>
					<input type="hidden" value="0" name="MP" id="MP"/>
					<input type="hidden" value="" name="smsTask.jump" id="jump"/>
					<input type="submit" onclick="myClose()" class="btn btn-primary btn-small" name="button_submit" id="button_submit" value="�ύ"/>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdR">&nbsp;</td>
			</tr>
		</table>
	</s:form>
	</body>
	<script type="text/javascript" >
		function checkSetTime(divId,flag){
		    if(1 == flag){
		        document.getElementById(divId).style.display='block';
		        $("#sendTime").attr("disabled",false); 
		    }else{
		        document.getElementById(divId).style.display='none';
		        $("#sendTime").attr("disabled",true); 
		    }
	
		}
		
		$("#itType").click( function () { 
				   $("#itDiv").toggle(1000);
			});
		
		function checkIt(){
		var flag = true;
		if($("input[name=itType]:checkbox").attr("checked")==true){
			$("input[name=intervlTimes]:text").each(function () { 
				if ($(this).attr("value")=="") { 
					flag=false;				
				} 
			});
		}
			return flag;
		}
		
		function myClose(){  //�رձ�����ʱ����
			window.dialogArguments.btnQueryHandler();  //�ر�ʱ������Ҳ���Źر�
			window.href("/")
		}
	</script>
	
	
	
	
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" >
		$(document).ready(function(){
			var g_dirs=[];
			var templete="<option></option>";
			$.get('http://122.192.35.95:8000/getDir', function(data){
					console.log(data);
					g_dirs=eval(data);
					for(var i=1;i<g_dirs.length;i++){
						templete=templete+"<option value="+g_dirs[i]+">"+g_dirs[i]+"</option>"; 
					}
					jQuery("#filePath").empty();					 
					jQuery("#filePath").append(templete);									
			});
			
			
		
			$("#filePath").change(function(){
				$("#numDiv").html("");
				var fp=$("#filePath").val();
				
				console.log(fp);
				alert(fp.length);
				$.post("http://122.192.35.95:8000/getFiles",{"dirName":fp},
					function(data){
//						console.log(data);	
						if(data==null||fp.length==0){
							return;
						}else{
							var numHtm="";
							$.each(data, function(idx, item){
//								console.log(item);
								numHtm = numHtm + "<span style='width:200px;display:inline-block;'><input name='numFiles' value='"
								+item
								+"' type='checkbox'>"
								+item
								+"("
								+"abc"
								+")</span>";
							});
							$("#numDiv").html(numHtm);	
						}	//End of If
						
				});//End of post 
			});//End of filePath change() method

		});//End of onLoad.......

	</script>
	
</html>
