<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

				<nav class="navbar navbar-expand-lg main-navbar">
					<a class="header-brand" href="index.html">
						<img src="${pageContext.request.contextPath}/img/logo2.jpg" class="header-brand-img" alt="Kharna-Admin  logo">
					</a>
					<form class="form-inline mr-auto">
						<ul class="navbar-nav mr-3">
							<li><a href="#" id="a" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="ion ion-navicon-round"></i></a></li>
							<li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-md-none navsearch"><i class="ion ion-search"></i></a></li>
						</ul>
						<div class="search-element">
							<input class="form-control" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-primary" type="submit"><i class="ion ion-search"></i></button>
						</div>
					</form>
					<ul class="navbar-nav navbar-right">
						<li class="dropdown"><a href="#" id="a1" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg">
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
