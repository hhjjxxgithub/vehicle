<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Validform_v5.3.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/base.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/valistyle.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/index.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>驾校开通申请</title>
<style>
#reg input {
	width: 40%;
}
</style>
</head>
<body>
	<!--内容部分每个界面不同的地方-->
	<div class="left con">
		<!--所在位置-->
		<div class="perSerTab">
			<span>当前位置：</span><a href="javascript:void(0)">【驾校申请】</a>
		</div>
		<!--内容部分-->
		<div class="perSerCon left">
			<div class="perSevchage left borderNo ">
				<p class="caseTailTop">驾校申请登记</p>
			</div>
			<form id="reg" method='post'>
				<div class="left persolSerCon borderNo">
					<table border="1" class="askTable">
						<tr>
							<td class="tdLable">驾校帐号</td>
							<td><input type="text" class="caseInput"
								name="schoolAccount" datatype="s1-5" errormsg="帐号至少1个字符,最多5个字符！"
								ajaxurl='${pageContext.request.contextPath}/front/school/checkAccount.handler'
								sucmsg="帐号可以使用！"/><br> <span
								class="Validform_checktip"></span></td>
							<td class="tdLable">驾校名称</td>
							<td><input type="text" class="caseInput" name="schoolName"
								datatype="s5-10" errormsg="名称至少5个字符,最多10个字符！"
								ajaxurl='${pageContext.request.contextPath}/front/school/checkName.handler'
								sucmsg="名称可以使用！" /><br> <span
								class="Validform_checktip"></span></td>
						</tr>
						<tr>
							<td class="tdLable">驾校密码</td>
							<td><input type="password" class="caseInput"
								name="schoolPwd" datatype="s5-16" errormsg="密码至少5个字符,最多16个字符！" /><br>
								<span class="Validform_checktip"></span></td>
							<td class="tdLable">营业执照编码</td>
							<td><input type="text" class="caseInput"
								name="schoolLicense" datatype="s5-10"
								errormsg="营业执照至少5个字符,最多10个字符！" 
								ajaxurl='${pageContext.request.contextPath}/front/school/checkLicense.handler'
								sucmsg="营业执照可以使用！"/><br> <span
								class="Validform_checktip"></span></td>
						</tr>
						<tr>
							<td class="tdLable">确认驾校密码</td>
							<td><input type="password" class="caseInput"
								name="schoolPwd2" datatype="s5-16" errormsg="保持两个密码一致"
								recheck='schoolPwd' /><br> <span
								class="Validform_checktip"></span></td>
							<td class="tdLable">法人代表姓名</td>
							<td><input type="text" class="caseInput" name="schoolMaster"
								datatype="s2-5" errormsg="姓名至少2个字符,最多5个字符！" /><br> <span
								class="Validform_checktip"></span></td>
						</tr>
						<tr>
							<td class="tdLable">驾校联系方式</td>
							<td><input type="text" class="caseInput" name="schoolPhone"
								datatype="s8-11" errormsg="联系方式至少8个字符,最多11个字符！" /><br> <span
								class="Validform_checktip"></span></td>
							<td class="tdLable">驾校简介</td>
							<td><input type="text" class="caseInput"
								name="schoolIntroduce" datatype="s15-50"
								errormsg="驾校简介至少15个字符,最多50个字符！" /><br> <span
								class="Validform_checktip"></span></td>
						</tr>
					</table>
				</div>
				<p class="casefoot">
					<button class="saveBut" type="submit">申请</button>
					<button class="closeBut" onclick="back()">返回</button>
				</p>
			</form>
		</div>
	</div>
	<!--底部-->
	<footer class="left footer">
		<div class="left footerLogo">
			<img src="${pageContext.request.contextPath}/img/red.png">
		</div>
		<br>
		<div class="left footText">
			<p>
				<span>主管单位：福建省交通管理运输厅 </span><span>承办单位:厦门思维科技有限公司</span>
			</p>
		</div>
	</footer>
</body>
<script>
$("#reg").Validform({
    tiptype: 3,
    ajaxPost: true,
    beforeSubmit: function (curform) {
        $.ajax({
            type: 'post',
            url: "${pageContext.request.contextPath}/front/school/addSchool.handler",
            contentType: 'application/json',
            data: JSON.stringify($("#reg").serializeJSON()),
            success: function (data) {
                if (data != 'y') {
                    window.alert("申请成功");
                    window.history.back();
                } else {
                    window.alert("申请失败");
                }
            }
        })
        return false;
    }
});
	function back() {
		window.history.back();
	}
</script>
</html>