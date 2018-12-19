<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icons.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mCustomScrollbar.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidemenu.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chartist.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chartist-plugin-tooltip.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet1.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/morris.css">
<title>后台管理</title>
</head>
<body class="app ">
<div id="spinner"></div>

		<div id="app">
			<div class="main-wrapper" >
				<nav class="navbar navbar-expand-lg main-navbar">
					<a class="header-brand" href="index.html">
						<img src="${pageContext.request.contextPath}/img/logo2.jpg" class="header-brand-img" alt="Kharna-Admin  logo">
					</a>
					<form class="form-inline mr-auto">
						<ul class="navbar-nav mr-3">
							<li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="ion ion-navicon-round"></i></a></li>
							<li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-md-none navsearch"><i class="ion ion-search"></i></a></li>
						</ul>
						<div class="search-element">
							<input class="form-control" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-primary" type="submit"><i class="ion ion-search"></i></button>
						</div>
					</form>
					<ul class="navbar-nav navbar-right">
						<li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg">
							<img src="${pageContext.request.contextPath}/img/avatar-1.jpeg.jpg" alt="profile-user" class="rounded-circle w-32">
							<div class="d-sm-none d-lg-inline-block">Jessica Lee</div></a>
							<div class="dropdown-menu dropdown-menu-right">
								<a href="profile.html" class="dropdown-item has-icon">
									<i class="ion ion-android-person"></i> Profile
								</a>
								<a href="profile.html" class="dropdown-item has-icon">
									<i class="ion-android-drafts"></i> Messages
								</a>
								<a href="profile.html" class="dropdown-item has-icon">
									<i class="ion ion-gear-a"></i> Settings
								</a>
								<a href="#" class="dropdown-item has-icon">
									<i class="ion-ios-redo"></i> Logout
								</a>
							</div>
						</li>
					</ul>
				</nav>	
				<aside class="app-sidebar">
					<div class="app-sidebar__user">
					    <div class="dropdown">
							<a class="nav-link pl-2 pr-2 leading-none d-flex" data-toggle="dropdown" href="#">
								<img alt="image" src="${pageContext.request.contextPath}/img/avatar-1.jpeg.jpg" class=" avatar-md rounded-circle">
								<span class="ml-2 d-lg-block">
									<span class="text-white app-sidebar__user-name mt-5">Jessica Lee</span><br>
									<span class="text-muted app-sidebar__user-name text-sm"> Web-Designer</span>
								</span>
							</a>
						</div>
					</div>
					<ul class="side-menu">
						<li class="slide">
							<a class="side-menu__item"  data-toggle="slide" href="#"><i class="side-menu__icon fa fa-desktop"></i><span class="side-menu__label">日常工作</span><i class="angle fa fa-angle-right"></i></a>
							<ul class="slide-menu">
								<li><a class="slide-item"  href="${pageContext.request.contextPath}/go/back/user_list.handler"><span>学员管理</span></a></li>
								<li><a class="slide-item" href="#"><span>驾校管理</span></a></li>
								<li><a class="slide-item" href="${pageContext.request.contextPath}/back/car/carList.handler"><span>教练车管理</span></a></li>
								<li><a class="slide-item" href="${pageContext.request.contextPath}/back/coach/coachList.handler"><span>教练管理</span></a></li>
								<li><a class="slide-item" href="#"><span>题库管理</span></a></li>
							</ul>
						</li>
						<li class="slide">
							<a class="side-menu__item"  data-toggle="slide" href="#"><i class="side-menu__icon fa fa-desktop"></i><span class="side-menu__label">统计报表</span><i class="angle fa fa-angle-right"></i></a>
							<ul class="slide-menu">
								<li><a class="slide-item"  href="#"><span>学员人数统计</span></a></li>
								<li><a class="slide-item" href="#"><span>科目考试人数统计</span></a></li>
							</ul>
						</li>
						<li class="slide">
							<a class="side-menu__item"  data-toggle="slide" href="#"><i class="side-menu__icon fa fa-desktop"></i><span class="side-menu__label">门户管理</span><i class="angle fa fa-angle-right"></i></a>
							<ul class="slide-menu">
								<li><a class="slide-item"  href="#"><span>行业动态发布</span></a></li>
								<li><a class="slide-item" href="#"><span>友情链接管理</span></a></li>
							</ul>
						</li>
						<li class="slide">
							<a class="side-menu__item"  data-toggle="slide" href="#"><i class="side-menu__icon fa fa-desktop"></i><span class="side-menu__label">系统管理</span><i class="angle fa fa-angle-right"></i></a>
							<ul class="slide-menu">
								<li><a class="slide-item"  href="#"><span>日志查询</span></a></li>
								<li><a class="slide-item" href="#"><span>参数管理</span></a></li>
							</ul>
						</li>
						<li class="slide">
							<a class="side-menu__item"  data-toggle="slide" href="#"><i class="side-menu__icon fa fa-desktop"></i><span class="side-menu__label">其它</span><i class="angle fa fa-angle-right"></i></a>
							<ul class="slide-menu">
								<li><a class="slide-item"  href="#"><span>管理员登录</span></a></li>
							</ul>
						</li>
					</ul>
				</aside>
			</div>
		</div>	
		
		<!--Jquery.min js-->
		<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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

		<!-- ECharts -->
		<%-- <script src="${pageContext.request.contextPath}/js/plugins/echarts/dist/echarts.js"></script> --%>

		<!--Min Calendar -->
		<script src="${pageContext.request.contextPath}/js/plugins/fullcalendar/calendar.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/plugins/fullcalendar/custom_calendar.js"></script>

		<!--Morris js-->
		<script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/plugins/morris/raphael.min.js"></script>	

		<!--Scripts js-->
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
		<!--Dashboard js-->
	<%-- 	<script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
		<script src="${pageContext.request.contextPath}/js/apexcharts.js"></script> --%>
</body>

</html>