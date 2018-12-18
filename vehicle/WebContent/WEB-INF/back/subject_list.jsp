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
						<li class="breadcrumb-item active" aria-current="page">题库管理</li>
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
										<button type="button" class="btn btn-default" 
										data-toggle="modal" data-target="#upModal">
											<span class="glyphicon glyphicon-circle-arrow-up" aria-hidden="true"></span>
										</button>
									</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="example"
											class="table table-striped table-bordered border-t0 text-nowrap w-100">
											<thead>
												<tr>
													<th class="wd-15p">题目</th>
													<th class="wd-15p">科目</th>
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

	<!--修改模态框  -->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" id="myModal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">题目修改</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="content" style="text-align: right">
					<!--表单  -->
					<form class="form-horizontal" id="form">
						<input type="hidden" readonly="readonly" name="subjectId" id="subjectId">
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">题目</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Title" name="subjectTitle" id="subjectTitle"
								 datatype='s1-50' errormsg="请输入1-30个字符的题目！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">选项A</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="OptionA" name="subjectOptiona" id="subjectOptiona"
								 datatype='s1-30' errormsg="请输入1-30个字符的选项！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">选项B</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="OptionB" name="subjectOptionb" id="subjectOptionb"
								 datatype='s1-30' errormsg="请输入1-30个字符的选项！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">选项C</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="OptionC" name="subjectOptionc" id="subjectOptionc"
								 datatype='s1-30' errormsg="请输入1-30个字符的选项！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">选项D</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="OptionD" name="subjectOptiond" id="subjectOptiond"
								 datatype='s1-30' errormsg="请输入1-30个字符的选项！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">单选/多选</label>
							<div class="col-md-4">
								<select class="form-control" name="subjectState" id="select1">
								</select>
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">答案</label>
							<div class="col-md-4">
								<select class="form-control" name="" id="answer11">
									<option value="1" name='subjectOptionaScore'>A</option>
									<option value="1" name='subjectOptionbScore'>B</option>
									<option value="1" name='subjectOptioncScore'>C</option>
									<option value="1" name='subjectOptiondScore'>D</option>
								</select>
								<div id="answer1">
									<input type="checkbox"  class='answer12' name="subjectOptionaScore" value="1">A
									<input type="checkbox"  class='answer12' name="subjectOptionbScore" value="1">B
									<input type="checkbox"  class='answer12' name="subjectOptioncScore" value="1">C
									<input type="checkbox"  class='answer12' name="subjectOptiondScore" value="1">D
								</div>
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">科目</label>
							<div class="col-md-4">
								<select class="form-control" name="levelId" id="levelId1">
									<c:forEach items="${requestScope.levelList}" var="level">
										<c:if test="${level.levelId == 1 or level.levelId == 4 }">
											<option value="${level.levelId}">${level.levelName}</option>
										</c:if>
									</c:forEach>
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
	
	<!--新增模态框  -->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" id="addModal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">题目新增</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="content" style="text-align: right">
					<!--表单  -->
					<form class="form-horizontal" id="addform">
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">题目</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Title" name="subjectTitle"
								 datatype='s1-50' errormsg="请输入1-30个字符的题目！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">选项A</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="OptionA" name="subjectOptiona"
								 datatype='s1-30' errormsg="请输入1-30个字符的选项！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">选项B</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="OptionB" name="subjectOptionb"
								 datatype='s1-30' errormsg="请输入1-30个字符的选项！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">选项C</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="OptionC" name="subjectOptionc"
								 datatype='s1-30' errormsg="请输入1-30个字符的选项！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">选项D</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="OptionD" name="subjectOptiond"
								 datatype='s1-30' errormsg="请输入1-30个字符的选项！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">单选/多选</label>
							<div class="col-md-4">
								<select class="form-control" name="subjectState" id="select2">
								</select>
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">答案</label>
							<div class="col-md-4">
								<select class="form-control" name="" id="answer21">
									<option value="1" name='subjectOptionaScore'>A</option>
									<option value="1" name='subjectOptionbScore'>B</option>
									<option value="1" name='subjectOptioncScore'>C</option>
									<option value="1" name='subjectOptiondScore'>D</option>
								</select>
								<div id="answer2">
									<input type="checkbox"  class='answer22' name="subjectOptionaScore" value="1">A
									<input type="checkbox"  class='answer22' name="subjectOptionbScore" value="1">B
									<input type="checkbox"  class='answer22' name="subjectOptioncScore" value="1">C
									<input type="checkbox"  class='answer22' name="subjectOptiondScore" value="1">D
								</div>
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">科目</label>
							<div class="col-md-4">
								<select class="form-control" name="levelId" id="uplevelId2">
									<c:forEach items="${requestScope.levelList}" var="level">
										<c:if test="${level.levelId == 1 or level.levelId == 4 }">
											<option value="${level.levelId}">${level.levelName}</option>
										</c:if>
									</c:forEach>
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
	
	<!--上传模态框  -->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" id="upModal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">题库上传</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="content" style="text-align: right">
					<!--表单  -->
					<form id="upform">
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">文件</label>
							<div class="col-md-4">
								<input type="file" class="form-control" id="file">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">科目</label>
							<div class="col-md-4">
								<select class="form-control" name="levelId" id="uplevelId3">
									<c:forEach items="${requestScope.levelList}" var="level">
										<c:if test="${level.levelId == 1 or level.levelId == 4 }">
											<option value="${level.levelId}">${level.levelName}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<span class="Validform_checktip"></span>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" onclick="up(uplevelId3.value)" class="btn btn-primary">上传</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
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
	<script src="${pageContext.request.contextPath}/js/back/subject_list.js"></script>
</body>
</html>