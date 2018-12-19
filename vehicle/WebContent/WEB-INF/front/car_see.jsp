<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugins/Datatable/css/dataTables.bootstrap4.css">
<title>后台管理</title>
</head>
<body class="app ">
<div id="spinner"></div>

		<div class="app-content">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4>教练车查看</h4>
							</div>
							<div class="col-md-9">
								<select class="form-control" name="schoolId" id="schoolChoose">
									<option value="0">请选择所属驾校</option>
									<c:forEach items="${schoolList }" var="school">
									<option value="${school.SCHOOL_ID }">${school.SCHOOL_NAME }</option>
									</c:forEach>
								</select>
							</div>
							<div class="card-body">
								<div class="table-responsive">
								<table id="example" class="table table-striped table-bordered border-t0 text-nowrap w-100" >
									<thead>
										<tr>
											<th class="wd-10p">教练车ID</th>
											<th class="wd-10p">车牌号</th>
											<th class="wd-15p">所属教练</th>
											<th class="wd-10p">车辆状况</th>
										</tr>
									</thead>
									<tbody id="con">
									</tbody>
								</table>
							</div>
						</div>
						</div>
					</div>
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
<script src="${pageContext.request.contextPath}/js/plugins/Datatable/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/Datatable/js/dataTables.bootstrap4.js"></script>

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
$("#schoolChoose").change(function(){
	$.ajax({
		type:'post',
		url:"${pageContext.request.contextPath}/front/car/carList.handler",
		data:{'schoolId':$("#schoolChoose").val()},
		dataType:'json',
		success:function(data){
			var str = "";
			for(var i=0;i<data.info.length;i++){
				str += "<tr>";
				str += "<td>"+data.info[i].CAR_ID+"</td>";
				str += "<td>"+data.info[i].CAR_NUM+"</td><>";
				str += "<td>"+data.info[i].COACH_NAME+"</td>";
				str += "<td>"+data.info[i].PARAMETER_NAME+"</td>";
				str += "</tr>";
			}
			$("#con").html(str);
		}
	})
})
</script>
</html>