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
													<th class="wd-15p">菜单名</th>
													<th class="wd-15p">菜单链接</th>
													<th class="wd-15p">父级菜单</th>
													<th class="wd-15p">排序</th>
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
					<h4 class="modal-title" id="myModalLabel">参数修改</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="content" style="text-align: right">
					<!--表单  -->
					<form class="form-horizontal" id="form">
						<input name="menuId" id="menuId" readonly="readonly" style="display: none">
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">菜单名</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Name" name="menuName"
								 datatype='*1-10' errormsg="请输入1-10个字符的菜单名！" id="menuName">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">链接</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Link" name="menuLink"
								id="menuLink" datatype='s1-50' errormsg="请输入1-50个字符的菜单链接！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">排序</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Index" name="menuIndex"
								 datatype='/^[1-9][0-9]*$/' errormsg="请输入不为零的排序号！" id="menuIndex">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">父级菜单</label>
							<div class="col-md-4">
								<select class="form-control" name="menuParent" id="menuParent1">
								</select>
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">状态</label>
							<div class="col-md-4">
								<select class="form-control" name="menuState" id="menuState">
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
					<h4 class="modal-title" id="myModalLabel">菜单新增</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="content" style="text-align: right">
					<!--表单  -->
					<form class="form-horizontal" id="addform">
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">菜单名</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Name" name="menuName"
								 datatype='s1-10' errormsg="请输入1-10个字符的菜单名！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">链接</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Link" 
								name="menuLink" datatype='s1-50' errormsg="请输入1-50个字符的菜单链接！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label  class="col-md-4 col-form-label">排序</label>
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Index" name="menuIndex"
								 datatype='/^[1-9][0-9]*$/' errormsg="请输入不为零的排序号！">
							</div>
							<span class="Validform_checktip"></span>
						</div>
						<div class="form-group row">
							<label class="col-md-4 col-form-label">父级菜单</label>
							<div class="col-md-4">
								<select class="form-control" name="menuParent" id="menuParent2">
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
		var param = ${requestScope.param};
		var table;
		$(function(e) {
			/* 数据初始化 */
			$("#menuState").append(
				$("<option value='1'>"+param[1]+"</option>"+
				  "<option value='2'>"+param[2]+"</option>")
			);
			/*表格插件初始化 */
			table = $('#example').DataTable({
				ajax:{
					url:path+"/back/menu/menuList.handler",
					dataSrc: ""
				},
				columns:[
					{data:'MENU_NAME'},
					{
						data:'MENU_LINK',
						"render": function ( data, type, full, meta ) {
							if(data != null){
								return '<span>'+data+"</span>";
							}else{
								return "<span>无</span>";
							}
						}
					},
					{
						data:'PARENT_NAME',
						"render": function ( data, type, full, meta ) {
							if(data != null){
								return '<span>'+data+"</span>";
							}else{
								return "<span>无</span>";
							}
						}
					},
					{data:'MENU_INDEX'},
					{
						data:'MENU_STATE',
						"render": function ( data, type, full, meta ) {
							return '<span>'+param[data]+"</span>";
						}
					},
					{
						data:null,
						"render": function ( data, type, full, meta ) {
							return "<button type='button' class='btn btn-default'"+ 
								"onClick='modify("+full.MENU_ID+")'>修改</button>"+
								"<button type='button' onClick='del("+full.MENU_ID+")'"+ 
								"class='btn btn-default'>删除</button>";
						}
					}
				]
			});
			/*修改验证插件初始化 */
			$("#form").Validform({
			    tiptype: 2,
			    ajaxPost: true,
			    beforeSubmit: function (curform) {
			        $.ajax({
			            type: 'post',
			            url: path+"/back/menu/update.handler",
			            contentType: 'application/json',
			            dataType:"json",
			            data: JSON.stringify($("#form").serializeJSON()),
			            success: function (data) {
			                if (data.status = 'y') {
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
			    beforeSubmit: function (curform) {
			        $.ajax({
			            type: 'post',
			            url: path+"/back/menu/add.handler",
			            contentType: 'application/json',
			            dataType:"json",
			            data: JSON.stringify($("#addform").serializeJSON()),
			            success: function (data) {
			                if (data.status = 'y') {
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
		});
		/* 进入修改页面前 */
		function modify(id,key) {
			$.ajax({
				 url :path+"/back/menu/getById.handler",
			     async : true,
			     type : "POST",
			     data : {menuId:id},
			     dataType:'json',
			     success :function(data){
					if(data.status == 'y'){
						show(data.info);
					}
			     }
			})
		}
		/* 数据填充并显示模态框*/
		function show(data){
			getParent('1');
			$("#menuId").val(data.menuId);
			$("#menuLink").val(data.menuLink);
			$("#menuName").val(data.menuName);
			$("#menuIndex").val(data.menuIndex);
			$($("#menuState option[value='"+data.menuState+"']")[0]).attr('selected','true');
			$($("#menuParent1 option[value='"+data.menuParent+"']")[0]).attr('selected','true');
			$("#myModal").modal('show');
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
		/* 显示之前获取父类菜单 */
		$("#addModal").on('show.bs.modal', function () {
			getParent('2');
		});
		/* 获取所有父类菜单 */
		function getParent(i){
			var index = i;
			$.ajax({
	            type: 'post',
	            async:false,
	            url: path+"/back/menu/getParent.handler",
	            dataType:"json",
	            success: function (data) {
	                if (data.status == 'y') {
	                	$("#menuParent"+index).empty();
	                	$("#menuParent"+index).append($("<option value='0'></option>"));
	                	for(var i=0;i<data.info.length;i++){
	                		var menu = data.info[i];
	                		var option = "<option value='"+menu.menuId+"'>"+menu.menuName+"</option>"	
		                	$("#menuParent"+index).append($(option));
	                	}
	                }
	            }
	        })
		}
		/* 删除 */
		function del(id){
			var flag = window.confirm("确定删除？");
			if(flag){
				$.ajax({
		            type: 'post',
		            url: path+"/back/menu/delete.handler",
		            data: {menuId:id},
		            dataType:"json",
		            success: function (data) {
		                if (data.status == 'y') {
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
	</script>
<%-- 	<script src="${pageContext.request.contextPath}/js/back/parameter_list.js"></script> --%>
</body>
</html>