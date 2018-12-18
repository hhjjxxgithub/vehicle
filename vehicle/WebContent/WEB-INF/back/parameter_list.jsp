<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--Favicon -->
<link rel="icon" href="favicon.ico" type="image/x-icon" />

<!--Bootstrap.min css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!--Icons css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/icons.css">

<!--Style css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style1.css">
<!--Style css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/valistyle.css">

<!--mCustomScrollbar css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/scroll-bar/jquery.mCustomScrollbar.css">

<!--Sidemenu css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/toggle-menu/sidemenu.css">

<!--DataTables css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/Datatable/css/dataTables.bootstrap4.css">
<style>
	#form .Validform_checktip,#addform .Validform_checktip{
		line-height:35px;
		height: 25px;
	}
</style>
<title>后台管理</title>
</head>
<body class="app ">
	<div id="spinner"></div>
	<div id="app">
		<div class="main-wrapper">
			<div class="app-content">
				<section class="section">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">系统管理</a></li>
						<li class="breadcrumb-item active" aria-current="page">参数管理</li>
					</ol>
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header">
									<h4>
										<button type="button" class="btn btn-default" 
										data-toggle="modal" data-target="#addModal">
											<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
										</button>
									</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="example"
											class="table table-striped table-bordered border-t0 text-nowrap w-100">
											<thead>
												<tr>
													<th class="wd-15p">参数值</th>
													<th class="wd-15p">参数名</th>
													<th class="wd-15p">对应表</th>
													<th class="wd-15p">操作</th>
												</tr>
											</thead>
											<tbody>
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
					Copyright &copy;Kharna-Admin 2018. Design By<a
						href="https://spruko.com/"> Spruko</a>
				</div>
			</footer>

		</div>
	</div>

	<!--修改教练模态框  -->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" id="myModal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">参数修改</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="content" style="text-align: right">
					<!--表单  -->
					<form class="form-horizontal" id="form">
						<input name="parameterId" id="parameterId" readonly="readonly" style="display: none">
						<input name="key" id="key" disabled readonly="readonly" style="display: none">
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">参数值</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Value" name="parameterState"
								 datatype='/^[1-9][0-9]*$/' errormsg="请输入不为零的整数！" id="parameterState1">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">参数名</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Name" name="parameterName"
								 datatype='s1-5' errormsg="请输入1-5个字符！" id="parameterName">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">所属表</label>
							<div class="col-md-4">
								<select class="form-control" name="parameterMark" id="parameterMark1"
								datatype='vali1' errormsg="该表下已经存在该参数值！">
									<option value="car">car</option>
									<option value="coach">coach</option>
									<option value="dynamic">dynamic</option>
									<option value="evaluate">evaluate</option>
									<option value="exam">exam</option>
									<option value="level">level</option>
									<option value="menu">menu</option>
									<option value="notice">notice</option>
									<option value="parameter">parameter</option>
									<option value="period">period</option>
									<option value="role">role</option>
									<option value="roleMenu">roleMenu</option>
									<option value="school">school</option>
									<option value="subject">subject</option>
									<option value="user">user</option>
									<option value="value">value</option>
								</select>
							</div>
							<span class="Validform_checktip"></span>
						</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary">保存</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!--新增教练模态框  -->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" id="addModal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">参数新增</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="content" style="text-align: right">
					<!--表单  -->
					<form class="form-horizontal" id="addform">
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">参数值</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Value" name="parameterState"
								 datatype='/^[1-9][0-9]*$/' errormsg="请输入不为零的整数！" id="parameterState2">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">参数名</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Name" name="parameterName"
								 datatype='s1-5' errormsg="请输入1-5个字符！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">所属表</label>
							<div class="col-md-4">
								<select class="form-control" name="parameterMark" id="parameterMark2"
								datatype='vali2' errormsg="该表下已经存在该参数值！">
									<option value="car">car</option>
									<option value="coach">coach</option>
									<option value="dynamic">dynamic</option>
									<option value="evaluate">evaluate</option>
									<option value="exam">exam</option>
									<option value="level">level</option>
									<option value="menu">menu</option>
									<option value="notice">notice</option>
									<option value="parameter">parameter</option>
									<option value="period">period</option>
									<option value="role">role</option>
									<option value="roleMenu">roleMenu</option>
									<option value="school">school</option>
									<option value="subject">subject</option>
									<option value="user">user</option>
									<option value="value">value</option>
								</select>
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary">新增</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--Jquery.min js-->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<!--Serialize js-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>
	<!--validate js-->
	<script src="${pageContext.request.contextPath}/js/Validform_v5.3.2.js"></script>
	<!--popper js-->
	<script src="${pageContext.request.contextPath}/js/popper.js"></script>

	<!--Tooltip js-->
	<script src="${pageContext.request.contextPath}/js/tooltip.js"></script>

	<!--Bootstrap.min js-->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!--Jquery.nicescroll.min js-->
	<script
		src="${pageContext.request.contextPath}/js/plugins/nicescroll/jquery.nicescroll.min.js"></script>

	<!--Scroll-up-bar.min js-->
	<script
		src="${pageContext.request.contextPath}/js/plugins/scroll-up-bar/dist/scroll-up-bar.min.js"></script>

	<!--Sidemenu js-->
	<script
		src="${pageContext.request.contextPath}/js/plugins/toggle-menu/sidemenu.js"></script>

	<!--mCustomScrollbar js-->
	<script
		src="${pageContext.request.contextPath}/js/plugins/scroll-bar/jquery.mCustomScrollbar.concat.min.js"></script>

	<!--DataTables js-->
	<script
		src="${pageContext.request.contextPath}/js/plugins/Datatable/js/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/Datatable/js/dataTables.bootstrap4.js"></script>

	<!--iCheck js-->
		<script src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>
	<!--Scripts js-->
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>

	<script>var path = "${pageContext.request.contextPath}";</script>
	<script src="${pageContext.request.contextPath}/js/back/parameter_list.js"></script>
</body>
</html>