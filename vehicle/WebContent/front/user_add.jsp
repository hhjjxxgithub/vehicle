<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Validform_v5.3.2.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/body.css"/> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/valistyle.css">   

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学员注册</title>
</head>
<body>
<div class="container">
	<section id="content">
		<form id="reg" method='post' >
			<h1>学员注册</h1>
			<div>
				<input type="text" placeholder="账号" required="" name="userAccount" id="userAccount" datatype="s1-10" errormsg="用户账号至少5个字符,最多10个字符!"
				ajaxurl="${pageContext.request.contextPath}/front/user/checkAccount.handler" sucmsg="账号还未被使用，可以注册！"/>
				<br><span class='Validform_checktip'></span>
			</div>
			<div>
				<input type="text" placeholder="学员名称" required="" name="userName" id="userName" datatype="s1-10" errormsg="用户名至少5个字符,最多10个字符!"/>
				<br><span class='Validform_checktip'></span>
			</div>
			<div>
				<input type="password" placeholder="密码" required="" name="userPwd" id="userPwd" datatype="s5-10" errormsg="密码至少5个字符,最多10个字符！"/>
				<br><span class='Validform_checktip'></span>
			</div>
			<div>
				<input type="password" placeholder="确认密码" required="" name="newPwd" id="newPwd" datatype="s5-10" errormsg="保持两个密码一致" recheck='userPwd'/>
				<br><span class='Validform_checktip'></span>
			</div>
			<div>
				<input type="text" placeholder="手机号" required="" name="userPhone" id="userPhone" datatype="m" errormsg="请填写正确的手机号码！"/>
				<br><span class='Validform_checktip'></span>
			</div>
		    <div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
			</div> 
			<div>
				<input type="submit" value="注册" class="btn btn-primary" id="js-btn-login" />&nbsp;&nbsp;
				<input type="button" value="返回" class="btn btn-primary" id=""/>
			</div>
		</form>
	</section>
</div>	
</body>
<script>
$("#reg").Validform({
	tiptype:3,
	ajaxPost:true,
	beforeSubmit:function(curform){
		$.ajax({
			type:'post',
			url:"${pageContext.request.contextPath}/front/user/userAdd.handler",
			data:$("#reg").serialize(),
			contentType: 'application/json',
			data:JSON.stringify($("#reg").serializeJSON()),
			success:function(data){
				if(data != 'y'){
					window.alert("注册成功");
					window.history.back();
				}else {
					window.alert("注册失败");
				}
			}
		})
		return false;
	}
});
</script>
</html>