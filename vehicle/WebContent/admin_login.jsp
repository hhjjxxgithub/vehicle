<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/gt.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
</head>
<body>	
	<div class="wrapper">
		<div class="container">
			<h1>机动车驾驶员计时培训系统管理端</h1>
			<form class="form" id="context" onSubmit="return false;">
				<input type="text" placeholder="管理员账号" name="adminName">
				<input type="password" placeholder="密码" name="adminPwd">
				<button id="login">登录</button>
			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<div id="captcha-box"></div>
</body>
<script>
	$(function(){
		$.ajax({
		    url: "${pageContext.request.contextPath}/vali/back.handler",
		    type: "get",
		    dataType: "json",
		    success: function (data) {
		        //请检测data的数据结构， 保证data.gt, data.challenge, data.success有值
		        initGeetest({
		            // 以下配置参数来自服务端 SDK
		            gt: data.gt,
		            challenge: data.challenge,
		            offline: !data.success,
		            new_captcha: true,
		            product: 'bind'
		        }, function (captchaObj) {
		        	captchaObj.onReady(function(){
		                //验证码ready之后才能调用verify方法显示验证码
		            })
					captchaObj.onSuccess(function(){
						$.ajax({
							type:"post",
							url:"${pageContext.request.contextPath}/back/admin/adminLogin.handler",
							data:$("#context").serialize(),
							dataType:'json',
							success:function(data){
								if(data.status == 'y'){
									window.location.href="${pageContext.request.contextPath}/go/back/index.handler";
								}else{
									window.alert(data.info);
								}
							}
						});
		            })
		            // 按钮提交事件
		            $("#login").click(function(){
		                // some code
		                // 检测验证码是否ready, 验证码的onReady是否执行
		                captchaObj.verify(); //显示验证码
		                // some code
		            })
		        })
		    }
		})
	})

</script>
</html>