<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="icon" 	   href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidemenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chartist.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chartist-plugin-tooltip.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/morris.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
</head>
<body>	
<header class="headStyle">
	<div class="left headLeft" style="line-height:15px">
       <img src="${pageContext.request.contextPath}/img/logo2.jpg" />
		<br><br>
       <span style="font-size:20px">机动车驾驶员培训平台</span>
    </div>
    <div class="right headRight">
        <ul>
        	<c:if test="${ empty sessionScope.login}">
	            <li><i class="i_reg"></i><a href="${pageContext.request.contextPath}/front/front_login.jsp" target="right">登录</a> </li>
	            <li><i class="i_reg01 i_reg"></i><a href="${pageContext.request.contextPath}/front/user_add.jsp" target="right">注册</a> </li>
        	</c:if>
        	<c:if test="${not empty sessionScope.login}">
        		<li class="dropdown">
        			<a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg">
						<img src="${pageContext.request.contextPath}/img/avatar-1.jpeg.jpg" alt="profile-user" class="rounded-circle w-32"/>
						<div class="d-sm-none d-lg-inline-block">Jessica Lee</div>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item has-icon" href="###" onclick="exit()">
							<i class="ion-ios-redo"></i> 退出
						</a>
					</div>
				</li>
        	</c:if>
        </ul>
    </div>
</header>
 <nav class="nav left">
    <ul class="left" id="navList"><li><a href="${pageContext.request.contextPath}/front/head.jsp" target="right">首页</a></li>
        <c:if test="${not empty sessionScope.login}">
        <li><a href="###">菜单</a><div class="navCon">
            <ul class="navConUl" id="ul">
          
            </ul>
        </div>
        </c:if>
        <li><a href="law.html">行业动态</a></li>
        <li><a href="${pageContext.request.contextPath}/front/user_list.jsp" target="right">通知公告</a> </li>
        <c:if test="${sessionScope.login.roleId!=4 && sessionScope.login.roleId!=1}">
        <li><a href="${pageContext.request.contextPath}/front/school_apply.jsp" target="right">驾校开通申请</a> </li>
   		</c:if>
    </ul>
</nav>
		<!--Jquery.min js-->
		<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
		<!--popper js-->
		<script src="${pageContext.request.contextPath}/js/popper.js"></script>

		<!--Tooltip js-->
		<script src="${pageContext.request.contextPath}/js/tooltip.js"></script>

		<!--Bootstrap.min js-->
		<script src="${pageContext.request.contextPath}/js/plugins/bootstrap/js/bootstrap.min.js"></script>

		<!--Jquery.nicescroll.min js-->
		<script src="${pageContext.request.contextPath}/js/plugins/nicescroll/jquery.nicescroll.min.js"></script>

		<!--Scroll-up-bar.min js-->
		<script src="${pageContext.request.contextPath}/js/plugins/scroll-up-bar/dist/scroll-up-bar.min.js"></script>

		<!--Sidemenu js-->
		<script src="${pageContext.request.contextPath}/js/plugins/toggle-menu/sidemenu.js"></script>

		<!--mCustomScrollbar js-->
		<script src="${pageContext.request.contextPath}/js/plugins/scroll-bar/jquery.mCustomScrollbar.concat.min.js"></script>


		<!--Min Calendar -->
		<script src="${pageContext.request.contextPath}/js/plugins/fullcalendar/calendar.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/plugins/fullcalendar/custom_calendar.js"></script>

		<!--Morris js-->
		<script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/plugins/morris/raphael.min.js"></script>	

		<!--Scripts js-->
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
<script>
$(function(){
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/front/menu/getMenu.handler",
		dataTyoe:"json",
		success:function(data){
				if(data.status == 'n'){
					return;
				}
				var menu = "";
				for(var i = 0;i< data.info.length;i++){
					menu += "<li>"
					+"<a href='${pageContext.request.contextPath}"+data.info[i].menuLink+"' target='right'>"
					+"<p><img src='${pageContext.request.contextPath}/img/perso_02.png'></p>"
                    +"<p>"+data.info[i].menuName+"</p></a>"
                    +"</li>"					
				}
				$("#ul").html(menu);
		}
	})
})
function exit(){
	if(window.confirm("您真的要离开本宝宝吗？")){
		$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/front/login/exit.handler",
		success:function(data){
				window.location.href = "${pageContext.request.contextPath}/front/index.jsp";
		}
	})
	}
}
</script>
</html>