<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Validform_v5.3.2.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>  
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

<title>分配教练</title>
<style>
.card-header{
margin-left: 500px;
}
.card-body{
margin-left: 300px;
}
</style>
</head>
<body class="app ">
<div id="spinner"></div>
		<div id="app">
			<div class="main-wrapper" >
               <div class="row">
							<div class="col-12 ">
								<div class="card">
									<div class="card-header">
										<h4>教练评价</h4>
									</div>
									<div class="card-body">
										<form id="reg">
												<label for="inputName" class="col-md-3 col-form-label">所属驾校</label>
												<div class="col-md-9">
													<input type="text" class="form-control"  readonly='true'  value="${userList[0].SCHOOL_NAME }">
													<input type="hidden" class="form-control" id="userId"  name="userId" value="${userList[0].USER_ID }">
													<input type="hidden" class="form-control" id="coachId"  name="coachId" value="${userList[0].COACH_ID }">
													<input type="hidden" class="form-control" id="schoolId"  name="schoolId" value="${userList[0].SCHOOL_ID }">
												</div>
												<label class="col-md-3 col-form-label">所属教练</label>
												<div class="col-md-9">
												<input type="text" readonly='true' class="form-control" id="inputName"   value="${userList[0].COACH_NAME }">
												</div>
												<label class="col-md-3 col-form-label">评价</label>
												<div class="col-md-9">
												<textarea class="form-control" rows="6" placeholder="请输入评价内容" name="context"></textarea>
												</div>
												<div class="form-group row">
												<label class="col-md-3 col-form-label">提交方式</label>
												<div class="col-md-9">
													<select class="form-control" id="coachChoose" name="state">
														<option value="0">请选择提交方式</option>
														<option value="1">实名提交</option>
														<option value="2">匿名提交</option>
													</select>
												</div>
												</div>
												<div class="form-group mb-0 mt-2 row justify-content-end">
												<div class="col-md-9">
													<button  class="btn btn-info" onClick="onSubmit()" id="ad">提交</button>
													<button  class="btn btn-primary" onClick="bac()" id="back">返回</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
                 </div>


<!--Jquery.min js-->
<%-- <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> --%>
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
<script>
function onSubmit(){
	if($("#coachChoose").val()==0){
		window.alert("请选择提交方式");
		return false;  
	}
	$.ajax({
		type:'post',
		url:"${pageContext.request.contextPath}/front/evaluate/coachEvaluate.handler",
		data:$("#reg").serialize(),
		dataType:'json',
		success:function(data){
			if(data.status == 'y'){
				window.alert(data.info);
				window.location.href="${pageContext.request.contextPath}/front/top.jsp";
			}else {
				window.alert(data.info);
			}
		}
	})
}
</script>
</html>