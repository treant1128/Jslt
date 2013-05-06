<%@page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>悟空审核平台</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link type="text/css" href="css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />

	<style type="text/css">
		
		body {
		padding-top: 60px;
		padding-bottom: 40px;
		}
		.sidebar-nav {
		padding: 9px 0;
		}
		
		@media (max-width: 980px) {
		/* Enable use of floated navbar text */
		.navbar-text.pull-right {
		  float: none;
		  padding-left: 5px;
		  padding-right: 5px;
		}
		}
		
		#myModal{
			width:800px;
			height: 700px;
			margin:0px 0px 0px -450px;
		}
		#myModal .modal-body{
			max-height: 700px;
		}
		#addTaskFrame{
			margin-left: 10px;
			margin-right: 10px;
			width: 700px;
			height: 600px;
		}
		
		html, body {
   			 height: 100%;
		}
		body {
		    margin: 0;
		    padding: 0;
		    background-color: #fff;
		}
		#top {
		    position: absolute;
		}
		h1, p {
		    margin: 0;
		    padding: 0.3em 0;
		}
		#container {
		    min-height: 100%;
		    margin-bottom: -36px;
		}
		* html #container {
		    height: 100%;
		}
		#footer-spacer {
		    height: 36px;
		}
		#footer {
		    border-top: 1px solid #000;
		    height: 35px;
		}
		
	</style>
</head>

<body>

<div id="top"></div>
<div id="container">
    <div>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">悟空审核下发平台</a>
          <div class="nav-collapse collapse">
            
            <p class="navbar-text pull-right" style="margin-right:5px;">
              	登录名:<a href="javascript:changePassword('<s:property value="#session.userName"/>')" 
                     class="navbar-link"><s:property value="#session.userName"/></a>
            </p>
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
</div>
    <div class="container-fluid">
    	<div class="row-fluid">

		<!-- Main content Stared-->
		<div class="span12">
		
		<div class="row-fluid">
		<div class="form-horizontal">
		   <legend>查询以及功能</legend>
		    	<div class="control-group">
					<hr>
				</div>
		</div>

	<table class="table table-striped">
	<thead>
    	<th>审核结果</th>
		<th>下发语</th>
		<th>URL</th>
		<th>任务描述</th>
		<th>创建时间</th>
		<th>号码包列表</th>
		<th>用户数量</th>
		<th>用户优先级</th>
		<th>短信&PUSH</th>
		<th>是否跳出31597</th>
		<th>去重规则</th>
<!--	<th>审核状态</th>  -->
		<th>任务状态</th>
		<th>执行时间</th>
		<th>操作</th>
	</thead>
	<tbody>
	
		<s:iterator var="element" value="#session.foos" >
			<tr>
 			<td><s:property value="@com.wukong.jslt.utils.Utils@verifyStatus(#element.verifyStatus)"/></td> 
				<td><s:property value="#element.title"/></td>	<!--下发语  -->
				<td><s:property value="#element.taskUrl"/></td><!--URL  -->
				<td><s:property value="#element.description"/></td><!--任务描述  -->
				<td><s:property value="#element.createDate"/></td><!--创建时间  -->
				<td><s:property value="#element.numPackage"/></td><!--号码报列表  -->
				<td><s:property value="#element.userNum"/></td><!--用户数量  -->
				<td><s:property value="#element.priority"/></td><!--用户优先级  -->
				<td><s:property value="@com.wukong.jslt.utils.Utils@smsPush(#element.smsPush)"/></td><!--短信&PUSH  -->
				<td><s:property value="@com.wukong.jslt.utils.Utils@skip31(#element.skip31)"/></td><!--是否跳出31597  -->
				<td><s:property value="@com.wukong.jslt.utils.Utils@antiDuplicate(#element.antiDuplicate)"/></td><!--去重规则  -->
<!--			<td><s:property value="#element.verifyStatus"/></td>   -->
				<td><s:property value="@com.wukong.jslt.utils.Utils@processStatus(#element.processStatus)"/></td><!--过程状态  -->
				<td><s:property value="#element.executeDate"/></td><!--执行时间  -->
				<td>
					<a href="javascript:agree(<s:property value="#element.id"/>)" role="button" class="btn btn-success btn-small">通&nbsp;过</a>
			    	<a href="javascript:disagree(<s:property value="#element.id"/>)" role="button" class="btn btn-warning btn-small">驳&nbsp;回</a>
			    	<a href="javascript:deleteFoo(<s:property value="#element.id"/>)" role="button" class="btn btn-danger btn-small">删&nbsp;除</a>
			    </td>
			</tr>
		</s:iterator>

	</tbody>	
</table>
		        	
            <div><!-- row-fluid END-->
		        </div><!-- span9 END-->
		</div><!-- row-fluid END-->

    </div><!--container-fluid END -->


      <hr>

    </div><!--/.fluid-container-->
 
<!-- Modal 
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">添加下发计划</h3>
		  </div>
		  <div class="modal-body">
			<iframe id="addTaskFrame" frameBorder="0" width="100%" height="100%" src="newSmsTask.jsp"></iframe>
		  </div>
		</div>   -->
	  </div><!-- End of ng controller end-->
    <div id="footer-spacer"></div>   
</div>
		<div id="footer">
	    <!-- 底部版权信息开始-->
		<table width="97%" border="0" cellspacing="0" cellpadding="0">
			<tr><td height="1" bgcolor="CECFCE"></td></tr>
			<tr><td align="center" class="f10"><br><img src="logo.png"></img>&nbsp;&nbsp;Copyright &copy; 2008 - 2013 WUKONG.com, All Rights Reserved<br><br></td></tr>
		</table>
		<!-- 底部版权信息结束-->
	</div>

<!--使用TasksController-->

	
	  <script type="text/javascript">
	      $(document).ready(function(){
	          // Datepicker
	          $('#datepicker').datepicker({
	          });
	      });
	
		function agree(id){
//			alert('确定审核通过?');
			window.location.href="auditAction2!allowTask?foo.id="+id;
		}
		function disagree(id){
			alert('否决通过?');
			window.location.href="auditAction2!denyTask?foo.id="+id;
		}
		function deleteFoo(id){
			alert('确定删除?');
			window.location.href="auditAction2!deleteTask?foo.id="+id;
		}
		function changePassword(userName){
//			alert(userName);
//			window.location.href="userAction!changePassword?user.name="+userName;
		}
	  </script>
  
	  <script src="js/jquery.min.js"></script>
	  <script src="js/bootstrap.min.js"></script>
	  <script type="text/javascript" src="js/jquery-ui-1.10.0.custom.min.js"></script>
    
</body>
</html>
