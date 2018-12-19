<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>后台管理</title>
</head>
<body class="app ">
<div id="spinner"></div>

		<div id="app">
			<div class="main-wrapper" >
				<jsp:include page="/WEB-INF/back/top.jsp"  flush="true"></jsp:include>
				<jsp:include page="/WEB-INF/back/left.jsp"  flush="true"></jsp:include>
     			<iframe  name="view" width="100%" height="700px" scrolling="auto"
     			style="margin-top:35px"></iframe>
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

		<!--Morris js-->
		<script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/plugins/morris/raphael.min.js"></script>	

		<!--Scripts js-->
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
		<!--Dashboard js-->
	<%-- 	<script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
		<script src="${pageContext.request.contextPath}/js/apexcharts.js"></script> --%>
		
		<script>
			 $($("aside")[0]).mouseout(function(){
				$("#a").click(); 
			})  
			 $($(".dropdown-menu")[0]).mouseout(function(){
				$("#a1").click(); 
			})
			var path = "${pageContext.request.contextPath}";
			/* 加载菜单 */
			$(function(){
				$.ajax({
					type:'post',
					url:path+"/back/menu/getMenu.handler",
					data:{roleId:5},
					dataType:'json',
					success:function(data){
						/* 一级菜单 */						
						for(var i = 0;i<data.info[0].length;i++){
							var menu = (data.info[0])[i];
							var first = "<li class='slide'>"
							+"<a class='side-menu__item'  data-toggle='slide' href='###'><i class='side-menu__icon fa fa-desktop'></i><span class='side-menu__label'>"+menu.menuName+"</span><i class='angle fa fa-angle-right'></i></a>"
							+"<ul class='slide-menu' id='first"+menu.menuId+"'></ul></li>";
							$("#ul").append($(first));
						}	
						/* 二级菜单 */
						for(var i = 0;i<data.info[1].length;i++){
							var menu = (data.info[1])[i];
							var second = "<li><a target='view' class='slide-item'  href='"+path+menu.menuLink+"'><span>"+menu.menuName+"</span></a></li>";
							$("#first"+menu.menuParent).append($(second));
						}
					}
				})
			})
			/* iframe 自动适应 */
			function calcPageHeight(doc) {
			    var cHeight = Math.max(doc.body.clientHeight, doc.documentElement.clientHeight);
			    var sHeight = Math.max(doc.body.scrollHeight, doc.documentElement.scrollHeight);
			    var height  = Math.max(cHeight, sHeight);
			    return height;
			}
				//根据ID获取iframe对象
				var ifr = document.getElementById('iframe');
				ifr.onload = function() {
				  //解决打开高度太高的页面后再打开高度较小页面滚动条不收缩
				ifr.style.height='0px';
			    var iDoc = ifr.contentDocument || ifr.document;
			    var height = calcPageHeight(iDoc);
			    if(height < 850){
			    	height = 850;
			    }
			    ifr.style.height = height + 'px';
			 }
		</script>
</body>

</html>