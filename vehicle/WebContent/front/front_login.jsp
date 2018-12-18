<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Validform_v5.3.2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/body.css"/> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前端登录</title>
</head>
<body>
<div class="container">
	<section id="content">
		<form id="reg" mehtod="post">
			<h1>登录</h1>
			<div>
				<input type="text" placeholder="账号" required="" name="userAccount" required/>
				<span class='Validform_checktip'></span>
			</div>
			<div>
				<input type="password" placeholder="密码" required="" name="userPwd" required/>
				<span class='Validform_checktip'></span>
			</div>
			<div>
				<select name="roleId" id="role">
				    <option value="0" >请选择</option>
			        <option value="1">学员</option>
			        <option value="2">教练</option>
			        <option value="3">驾校</option>
			        <option value="4">运管</option>
		        </select>
			</div>
		    <div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
			</div> 
			<div>
				<input type="submit" value="登录" class="btn btn-primary" id="js-btn-login" />
			</div>
		</form>
	</section>
</div>	
</body>
<script>
$("#reg").Validform({
	tiptype:2,
	ajaxPost:true,
	beforeSubmit:function(curform){
		if($("#role").val()==0){
			window.alert("请选择角色登录");
		}else {
			$.ajax({
				type:'post',
				url:"${pageContext.request.contextPath}/front/login/frontLogin.handler",
				data:$("#reg").serialize(),
				success:function(data){
					if(data.status == 'y'){
						window.alert(data.info);
						window.top.location.href="${pageContext.request.contextPath}/front/index.jsp";
					}else {
						window.alert(data.info);
					}
				}
			});
		return false;
		}
	}
})
	
</script>
</html>