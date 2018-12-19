<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon" />
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Validform_v5.3.2.js"></script>  
<title>学员报名审核</title>
<style>
.app-content{
margin-top: 1px;
margin-right: 20px;
}
.card .card-header .btn{
width: 65px;
}
</style>
</head>

<body class="app ">  
    <div id="spinner"></div>
    <div id="app">
        <div class="main-wrapper">
            <div class="app-content">
                <section class="section">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>学员报名审核</h4>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="example" class="table table-striped table-bordered border-t0 text-nowrap w-100">
                                                <thead>
                                                    <tr>
                                                        <th class="wd-10p">学员姓名</th>
                                                        <th class="wd-10p">所属教练</th>
                                                        <th class="wd-15p">手机号码</th>
                                                        <th class="wd-15p">身份证号码</th>
                                                        <th class="wd-10p">报名时间</th>
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
        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="myModal">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">分配教练</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="content" style="text-align: right">
                        <!--表单  -->
                        <form class="form-horizontal" id="form">
                            <input name="coachId" id="coachId" readonly="readonly" style="display: none">
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label">学员姓名</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="userName" name="userName"  required="readonly">
                                    <input type="hidden" class="form-control" id="userId" name="userId"  required="readonly">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label">所属驾校</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" placeholder="Card" id="schoolName" name="schoolName" required="readonly">
                                    <input type="hidden" class="form-control" id="schoolId" name="schoolId"  required="readonly">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label">分配教练</label>
                                <div class="col-md-4">
                                  <select class="form-control" id="coachChoose" name="coachId" onclick="coach()">
									<option value="0">请选择教练</option>
								 </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" onClick="onSub()" id="on">保存</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </form>
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

<script>
	var path = "${pageContext.request.contextPath}";
	/* var param = ${requestScope.param}; */
</script>
<script src="${pageContext.request.contextPath}/js/enroll_list.js"></script>
</body>

</html>