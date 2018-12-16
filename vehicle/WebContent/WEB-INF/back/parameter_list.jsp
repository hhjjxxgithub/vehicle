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
			<nav class="navbar navbar-expand-lg main-navbar">
				<a class="header-brand" href="index.html"> <img
					src="${pageContext.request.contextPath}/img/logo2.jpg"
					class="header-brand-img" alt="Kharna-Admin  logo">
				</a>
				<form class="form-inline mr-auto">
					<ul class="navbar-nav mr-3">
						<li><a href="#" data-toggle="sidebar"
							class="nav-link nav-link-lg"><i class="ion ion-navicon-round"></i></a></li>
						<li><a href="#" data-toggle="search"
							class="nav-link nav-link-lg d-md-none navsearch"><i
								class="ion ion-search"></i></a></li>
					</ul>
					<div class="search-element">
						<input class="form-control" type="search" placeholder="Search"
							aria-label="Search">
						<button class="btn btn-primary" type="submit">
							<i class="ion ion-search"></i>
						</button>
					</div>
				</form>
				<ul class="navbar-nav navbar-right">
					<li class="dropdown"><a href="#" data-toggle="dropdown"
						class="nav-link dropdown-toggle nav-link-lg"> <img
							src="${pageContext.request.contextPath}/img/avatar-1.jpeg.jpg"
							alt="profile-user" class="rounded-circle w-32">
							<div class="d-sm-none d-lg-inline-block">Jessica Lee</div></a>
						<div class="dropdown-menu dropdown-menu-right">
							<a href="profile.html" class="dropdown-item has-icon"> <i
								class="ion ion-android-person"></i> Profile
							</a> <a href="profile.html" class="dropdown-item has-icon"> <i
								class="ion-android-drafts"></i> Messages
							</a> <a href="profile.html" class="dropdown-item has-icon"> <i
								class="ion ion-gear-a"></i> Settings
							</a> <a href="#" class="dropdown-item has-icon"> <i
								class="ion-ios-redo"></i> Logout
							</a>
						</div></li>
				</ul>
			</nav>
			<aside class="app-sidebar">
				<div class="app-sidebar__user">
					<div class="dropdown">
						<a class="nav-link pl-2 pr-2 leading-none d-flex"
							data-toggle="dropdown" href="#"> <img alt="image"
							src="${pageContext.request.contextPath}/img/avatar-1.jpeg.jpg"
							class=" avatar-md rounded-circle"> <span
							class="ml-2 d-lg-block"> <span
								class="text-white app-sidebar__user-name mt-5">Jessica
									Lee</span><br> <span
								class="text-muted app-sidebar__user-name text-sm">
									Web-Designer</span>
						</span>
						</a>
					</div>
				</div>
				<ul class="side-menu">
					<li class="slide"><a class="side-menu__item"
						data-toggle="slide" href="#"><i
							class="side-menu__icon fa fa-desktop"></i><span
							class="side-menu__label">日常工作</span><i
							class="angle fa fa-angle-right"></i></a>
						<ul class="slide-menu">
							<li><a class="slide-item" href="#"><span>学员管理</span></a></li>
							<li><a class="slide-item" href="#"><span>驾校管理</span></a></li>
							<li><a class="slide-item" href="#"><span>教练车管理</span></a></li>
							<li><a class="slide-item"
								href="${pageContext.request.contextPath}/back/coach/coachList.handler"><span>教练管理</span></a></li>
							<li><a class="slide-item" href="#"><span>题库管理</span></a></li>
						</ul></li>
					<li class="slide"><a class="side-menu__item"
						data-toggle="slide" href="#"><i
							class="side-menu__icon fa fa-desktop"></i><span
							class="side-menu__label">统计报表</span><i
							class="angle fa fa-angle-right"></i></a>
						<ul class="slide-menu">
							<li><a class="slide-item" href="#"><span>学员人数统计</span></a></li>
							<li><a class="slide-item" href="#"><span>科目考试人数统计</span></a></li>
						</ul></li>
					<li class="slide"><a class="side-menu__item"
						data-toggle="slide" href="#"><i
							class="side-menu__icon fa fa-desktop"></i><span
							class="side-menu__label">门户管理</span><i
							class="angle fa fa-angle-right"></i></a>
						<ul class="slide-menu">
							<li><a class="slide-item" href="#"><span>行业动态发布</span></a></li>
							<li><a class="slide-item" href="#"><span>友情链接管理</span></a></li>
						</ul></li>
					<li class="slide"><a class="side-menu__item"
						data-toggle="slide" href="#"><i
							class="side-menu__icon fa fa-desktop"></i><span
							class="side-menu__label">系统管理</span><i
							class="angle fa fa-angle-right"></i></a>
						<ul class="slide-menu">
							<li><a class="slide-item" href="#"><span>日志查询</span></a></li>
							<li><a class="slide-item" href="#"><span>参数管理</span></a></li>
						</ul></li>
					<li class="slide"><a class="side-menu__item"
						data-toggle="slide" href="#"><i
							class="side-menu__icon fa fa-desktop"></i><span
							class="side-menu__label">其它</span><i
							class="angle fa fa-angle-right"></i></a>
						<ul class="slide-menu">
							<li><a class="slide-item" href="#"><span>管理员登录</span></a></li>
						</ul></li>
				</ul>
			</aside>
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

	<script>
		var path = "${pageContext.request.contextPath}";
		var table;
		$(function(e) {
			/*表格插件初始化 */
			table = $('#example').DataTable({
				ajax:{
					url:path+"/back/parameter/parameterList.handler",
					dataSrc: ""
				},
				columns:[
					{data:'parameterState'},
					{data:'parameterName'},
					{data:'parameterMark'},
					{
						data:null,
						"render": function ( data, type, full, meta ) {
							return "<button type='button' class='btn btn-default'"+ 
								"onClick=modify("+full.parameterId+",'"+full.parameterState+
								","+full.parameterMark+"')>修改</button>"+
								"<button type='button' onClick='del("+full.parameterId+")'"+ 
								"class='btn btn-default'>删除</button>";
						}
					}
				]
			})
			/*修改验证插件初始化 */
			$("#form").Validform({
			    tiptype: 2,
			    ajaxPost: true,
			    datatype:{
					'vali1':function(gets,obj,curform,regxp){
						return exist('1');
					}
				},
			    beforeSubmit: function (curform) {
			        $.ajax({
			            type: 'post',
			            url: path+"/back/parameter/update.handler",
			            contentType: 'application/json',
			            data: JSON.stringify($("#form").serializeJSON()),
			            success: function (data) {
			                if (data != 'y') {
			                    window.alert("修改成功");
			                    $("#myModal").modal("hide");
			                    table.ajax.reload();
			                    table.draw(false);
			                } else {
			                    window.alert("修改失败");
			                }
			            }
			        })
			        return false;
			    }
			});
			/*添加验证插件初始化 */
			$("#addform").Validform({
			    tiptype: 2,
			    ajaxPost: true,
				datatype:{
					'vali2':function(gets,obj,curform,regxp){
						return exist('2');
					}
				},
			    beforeSubmit: function (curform) {
			        $.ajax({
			            type: 'post',
			            url: path+"/back/parameter/add.handler",
			            contentType: 'application/json',
			            data: JSON.stringify($("#addform").serializeJSON()),
			            success: function (data) {
			                if (data != 'y') {
			                    window.alert("新增成功");
			                    $("#addModal").modal("hide");
			                    table.ajax.reload();
			                    table.draw(false);
			                } else {
			                    window.alert("新增失败");
			                }
			            }
			        })
			        return false;
			    }
			});
		})
		/* 存在验证 */
		function exist(i){
			var reg=/^[1-9][0-9]*$/;
			if(!reg.test($("#parameterState"+i).val())){return false}	
			if(i == '1'){
				var now = $("#parameterState"+i).val()+","+$("#parameterMark"+i).val();
				if(now == $("#key").val()){return true}
			}
			var flag = false;
			$.ajax({
	            type: 'post',
	            async:false,
	            url: path+"/back/parameter/exist.handler",
	            data: {parameterState:$("#parameterState"+i).val(),
	            	parameterMark:$("#parameterMark"+i).val()
	            },
	            success: function (data) {
	            	flag = data.status == 'y'?true:false;
	            }
	        })
	        return flag;
		}
		/* 进入修改页面前 */
		function modify(id,key) {
			$.ajax({
				 url :path+"/back/parameter/getById.handler",
			     async : true,
			     type : "POST",
			     data : {parameterId:id},
			     dataType:'json',
			     success :function(data){
					if(data.status == 'y'){
						show(data.info);
						$("#key").val(key);
					}
			     }
			})
		}
		/* 数据填充并显示模态框*/
		function show(data){
			$("#parameterId").val(data.parameterId);
			$("#parameterState1").val(data.parameterState);
			$("#parameterName").val(data.parameterName);
			$($("#parameterMark1 option[value='"+data.parameterMark+"']")[0]).attr('selected','true');
			$("#myModal").modal('show');
		}
		/* 删除 */
		function del(id){
			var flag = window.confirm("确定删除？");
			if(flag){
				$.ajax({
		            type: 'post',
		            url: path+"/back/parameter/delete.handler",
		            data: {parameterId:id},
		            success: function (data) {
		                if (data != 'y') {
		                    window.alert("删除成功");
		                    table.ajax.reload();
		                    table.draw(false);
		                } else {
		                    window.alert("删除失败");
		                }
		            }
		        })
			}
		}
		/*关闭模态框清空数据*/
		$("#myModal").on('hidden.bs.modal', function () {
			$("#form").Validform().resetForm();
			$(".Validform_checktip>.Validform_checktip").html("");
		});
		$("#addModal").on('hidden.bs.modal', function () {
			$("#addform").Validform().resetForm();
			$(".Validform_checktip>.Validform_checktip").html("");
		});
	</script>
	<%-- <script src="${pageContext.request.contextPath}/js/back/paramter_list.js"></script> --%>
</body>
</html>