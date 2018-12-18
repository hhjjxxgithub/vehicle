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

<!--mCustomScrollbar css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/scroll-bar/jquery.mCustomScrollbar.css">

<!--Sidemenu css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/toggle-menu/sidemenu.css">

<!--DataTables css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/Datatable/css/dataTables.bootstrap4.css">
<title>驾校开通审核</title>
<style>
.app-content{
margin-right: 90px;
}
</style>
</head>
<body class="app ">
	<div id="spinner"></div>

	<div id="app">
		<div class="main-wrapper">
			<div class="app-content">
				<section class="section">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Tables</a></li>
						<li class="breadcrumb-item active" aria-current="page">Data
							Tables</li>
					</ol>

					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header">
									<h4>Defalut Datatables</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive" style="padding: auto">
										<table id="example"
											class="table table-striped table-bordered border-t0 text-nowrap w-100">
											<thead>
												<tr>
													<th class="wd-10p">驾校名称</th>
													<th class="wd-10p">驾校帐号</th>
													<th class="wd-10p">营业执照编号</th>
													<th class="wd-10p">法人代表姓名</th>
													<th class="wd-10p">联系方式</th>
													<th class="wd-10p">状态</th>
													<th class="wd-10p">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${schoolList}" var="school">
													<tr>
														<td>${school.SCHOOL_NAME}</td>
														<td>${school.SCHOOL_ACCOUNT}</td>
														<td>${school.SCHOOL_LICENSE}</td>
														<td>${school.SCHOOL_MASTER}</td>
														<td>${school.SCHOOL_PHONE}</td>
														<td><c:if test="${school.SCHOOL_STATE==1}">审核中</c:if>
															<c:if test="${school.SCHOOL_STATE>1 && school.SCHOOL_STATE!=99}">审核通过</c:if> <c:if
																test="${school.SCHOOL_STATE==99}">审核不通过</c:if></td>
														<td><c:if test="${school.SCHOOL_STATE==1}">
																<button class="btn btn-sm btn-primary m-b-5 m-t-5" onclick="check(${school.SCHOOL_ID},2)">审核通过</button>&nbsp;
															<button class="btn btn-sm btn-danger m-b-5 m-t-5" onclick="check(${school.SCHOOL_ID},99)">审核不通过</button>
															</c:if>
															<c:if test="${school.SCHOOL_STATE!=1}">
																<button class="btn btn-sm btn-secondary m-b-5 m-t-5">审核通过</button>&nbsp;
															<button class="btn btn-sm btn-secondary m-b-5 m-t-5">审核不通过</button>
															</c:if></td>
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
					Copyright &copy;Kharna-Admin 2018. Design By<a
						href="https://spruko.com/"> Spruko</a>
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

	<!--Scripts js-->
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>

	<script>
		$(function(e) {
			$('#example').DataTable();
		});
		function check(id,state){
			if(window.confirm("您真的要这么做吗？")){
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/front/control/updatePunishState.handler',
				data:{schoolId:id,schoolState:state},
				dataType:'json',
				success:function(data){
					if(data.status=="y"){
						window.alert(data.info);
						window.location.href="${pageContext.request.contextPath}/front/control/schoolList.handler";
					}else{
						window.alert(data.info);
					}
				}
			})}
		}
	</script>

</body>
</html>