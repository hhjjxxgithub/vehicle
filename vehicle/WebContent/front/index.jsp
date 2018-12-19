<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
	iframe{
		width: 100%;
	}
</style>
</head>
<body id='b'>
	<jsp:include page="/front/top.jsp" flush="true"></jsp:include>
	<iframe name="right" src="${pageContext.request.contextPath}/front/head.jsp"  
	frameborder="0" scrolling="no" id ="iframe"></iframe>
</body>
<script>

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
</html>