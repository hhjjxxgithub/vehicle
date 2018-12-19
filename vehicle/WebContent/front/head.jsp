<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">   
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<style>
.info{
background-color: white;
margin-left: 500px;
}
</style>
</head>
<body>	
<div class="indexConPh left">
        <!--事项查询部分-->
        <div class="indexConFind">
           <ul class="tabUl"><li ><span class="tabActive"></span>驾校查询</li></ul>
            <div class="tabCon">
                <div style="display: block">
	                <input type="text" placeholder="请输入驾校关键字">
	                <input type="button" style="top:22px">
                </div>
            </div>
        </div>
</div>
 <!--图片滚动部分-->
        <div class="conServerCon left">
            <h3><span class="scrollHspan">驾驶警示</span></h3>
            <div class="scrollDiv">
                <ul class="scrollUl">
                    <li><a href="#"><p><img src="${pageContext.request.contextPath}/img/1.jpg"> </p>
                    <p>酒后驾驶</p></a> </li>
                    <li><a href="#"><p><img src="${pageContext.request.contextPath}/img/2.gif"> </p>
                        <p>超速驾驶</p></a> </li>
                    <li><a href="#"><p><img src="${pageContext.request.contextPath}/img/3.gif"> </p>
                        <p>斑马线前未减速</p></a> </li>
                    <li><a href="#"><p><img src="${pageContext.request.contextPath}/img/4.gif"> </p>
                        <p>高速违规停车</p></a> </li>
                    <li><a href="#"><p><img src="${pageContext.request.contextPath}/img/5.jpg"> </p>
                        <p>危险驾驶</p></a> </li>
                    <li><a href="#"><p><img src="${pageContext.request.contextPath}/img/6.gif"> </p>
                        <p>危险驾驶</p></a> </li>
                </ul>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="https://bot.4paradigm.com/web/assets/ics-web-sdk-js.js"></script>
<script type="text/javascript">
window.onload = function() {
IcsWebSdkJs.init('https://bot.4paradigm.com/web/chat/2754/67678401-f861-4080-b611-d95505cd1284')
}
</script>
</html>