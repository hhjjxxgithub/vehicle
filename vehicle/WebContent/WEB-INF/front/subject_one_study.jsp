<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<title>Insert title here</title>
</head>
<style>
    #sub{
     margin-left: 700px;
     margin-top: 20px;
    }
    #head{
     margin-left: 700px;
    }
</style>
<body>
    <div class="table">
		<h3 id="head">科目一学习</h3>
		<form id='reg' >
	        <input type='hidden'  name='score' id='score' style='display:none' >
		<div class='search'>
		</div>
        </form>
        <table  align="center">
            <tbody id="tbody">
                	<c:forEach items="${page.list}" var="subject" varStatus="c">
                	<tr>
	         <%--        	<td colspan='4'>${(page-1)*10+c.count}、${subject.SUBJECT_TITLE}</td> --%>
	                </tr>
                	<tr>
	                	<td><input type='radio' name='${subject.SUBJECT_ID}' value='${subject.SUBJECT_SCOREA}'>${subject.SUBJECT_OPTIONA}</></td>
	                	<td><input type='radio' name='${subject.SUBJECT_ID}' value='${subject.SUBJECT_SCOREB}'>${subject.SUBJECT_OPTIONB}</></td>
	                	<td><input type='radio' name='${subject.SUBJECT_ID}' value='${subject.SUBJECT_SCOREC}'>${subject.SUBJECT_OPTIONC}</></td>
	                	<td><input type='radio' name='${subject.SUBJECT_ID}' value='${subject.SUBJECT_SCORED}'>${subject.SUBJECT_OPTIOND}</></td>
	                </tr>
                	</c:forEach>
            </tbody>
        </table>
        <input type='button' value='提交' onClick='submit()' id="sub">
      </div>
</body>
<script>
function submit(){
	if(window.confirm("确定提交？")){
		var i = 0;
		$("#tbody input:checked").each(function(index,ele){
			i += parseInt($(ele).val());
		})	
		$("#score").val(i);
		$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/front/score/testResult.handler",
		data:{'score':$("#score").val()},
		success:function(data){
			if(data.status == 'y'){
				window.alert(data.info);
				window.location.href = "${pageContext.request.contextPath}/back/new.jsp";
			}else{
				window.alert(data.info);
			}
		}
	})
	}
}
</script>
</html>