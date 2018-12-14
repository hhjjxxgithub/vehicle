<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!--Favicon -->
		<link rel="icon" href="favicon.ico" type="image/x-icon"/>

		<!--Bootstrap.min css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

		<!--Icons css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icons.css">

		<!--Style css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">

		<!--mCustomScrollbar css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugins/scroll-bar/jquery.mCustomScrollbar.css">

		<!--Sidemenu css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugins/toggle-menu/sidemenu.css">

		<!--DataTables css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugins/Datatable/css/dataTables.bootstrap4.css">
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
								<li><a class="slide-item"  href="#"><span>学员管理</span></a></li>
								<li><a class="slide-item" href="#"><span>驾校管理</span></a></li>
								<li><a class="slide-item" href="#"><span>教练车管理</span></a></li>
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
				<div class="app-content">
					<section class="section">
                    	<ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Tables</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Data Tables</li>
                        </ol>

						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<h4>Defalut Datatables</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
										<table id="example" class="table table-striped table-bordered border-t0 text-nowrap w-100" >
											<thead>
												<tr>
													<th class="wd-15p">账户</th>
													<th class="wd-15p">姓名</th>
													<th class="wd-20p">手机号码</th>
													<th class="wd-10p">驾校</th>
													<th class="wd-15p">状态</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${requestScope.coachList}" var="coach">
													<tr>
														<td>${coach.COACH_ACCOUNT}</td>
														<td>${coach.COACH_NAME}</td>
														<td>${coach.COACH_PHONE}</td>
														<td>${coach.SCHOOL_NAME}</td>
														<td>${coach.PARAMETER_NAME}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									</div>
								</div>
							</div>
						</div>

					</section>
				</div>
				<footer class="main-footer">
					<div class="text-center">
						Copyright &copy;Kharna-Admin 2018. Design By<a href="https://spruko.com/"> Spruko</a>
					</div>
				</footer>

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

		<!--DataTables js-->
		<script src="${pageContext.request.contextPath}/js/plugins/Datatable/js/jquery.dataTables.js"></script>
		<script src="${pageContext.request.contextPath}/js/plugins/Datatable/js/dataTables.bootstrap4.js"></script>

		<!--Scripts js-->
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>

		<script>
			$(function(e) {
				$('#example').DataTable();
			} );
		</script>

	</body>
</html>