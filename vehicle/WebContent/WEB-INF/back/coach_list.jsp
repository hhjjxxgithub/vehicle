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
						<li class="breadcrumb-item"><a href="#">日常工作</a></li>
						<li class="breadcrumb-item active" aria-current="page">教练管理</li>
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
													<th class="wd-15p">账户</th>
													<th class="wd-15p">姓名</th>
													<th class="wd-20p">手机号码</th>
													<th class="wd-10p">驾校</th>
													<th class="wd-15p">状态</th>
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
					<h4 class="modal-title" id="myModalLabel">教练修改</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="content" style="text-align: right">
					<!--表单  -->
					<form class="form-horizontal" id="form">
						<input name="coachId" id="coachId" readonly="readonly" style="display: none">
						<div class="form-group row">
							<label class="col-md-4 col-form-label">姓名</label>
							<div class="col-md-4">
								<input type="text" class="form-control" id="coachName" name="coachName" placeholder="Name"
								datatype='s2-6' errormsg="用户名至少2个字符,最多6个字符!">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">身份证</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Card"
								id="coachCard" name="coachCard" datatype='s18-18' errormsg="请输入18位的身份证号码！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">手机号码</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Phone" id="coachPhone" 
								name="coachPhone" datatype='m' errormsg="请输入11的手机号码！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">状态</label>
							<div class="col-md-4">
								<select class="form-control" name="coachState" id="coachState">
								</select>
							</div>
							<span class="Validform_checktip"></span>
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
					<h4 class="modal-title" id="myModalLabel">教练新增</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="content" style="text-align: right">
					<!--表单  -->
					<form class="form-horizontal" id="addform">
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">账户</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Account" name="coachAccount"
								 datatype='s5-10' errormsg="账户至少5个字符,最多10个字符!"
								 ajaxurl='${pageContext.request.contextPath}/back/coach/accountExist.handler' sucmsg="账户可以使用！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">密码</label>
							<div class="col-md-4">
								<input type="password" class="form-control" name="coachPwd"
								datatype='s5-10' errormsg="密码至少5个字符,最多10个字符！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">确认密码</label>
							<div class="col-md-4">
								<input type="password" class="form-control" 
								datatype='s5-10' errormsg="保持两个密码一致" recheck='coachPwd'>
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">姓名</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Name" name="coachName"
								datatype='s2-6' errormsg="用户名至少2个字符,最多6个字符!">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">身份证</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Card" name="coachCard"
								datatype='s18-18' errormsg="请输入18位的身份证号码！"
								ajaxurl='${pageContext.request.contextPath}/back/coach/cardExist.handler' sucmsg="身份证可以使用！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">手机号码</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Phone" name="coachPhone"
								datatype='m' errormsg="请输入11位的手机号码！">
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

	<script>
		var path = "${pageContext.request.contextPath}";
		var param = ${requestScope.param};
	</script>
	<script src="${pageContext.request.contextPath}/js/back/coach_list.js"></script>
</body>
</html>