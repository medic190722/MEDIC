<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function check() {
		var form = document.authenform;
		var authNum = ${authNum};
		
		console.log("이게멀까"+form);

		if (!form.authnum.value) {
			alert("인증번호를 입력하세요");
			return false;
		}
		if (form.authnum.value != authNum) {
			alert("틀린 인증 번호입니다. 인증번호를 다시 입력해주세요");
			form.authnum.value = "";
			return false;
		}
		if (form.authnum.value == authNum) {
			alert("인증완료");
			//location.href = "${pageContext.request.contextPath}/mailMit/mailMitList.do";
			return true;
			
		}

	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<center>
		<br> <br>
		<h5>인증 번호 7자리를 입력하세요</h5>

		<div class="container">
			<form method="post" action="../mailMit/mailMitList.do" name="authenform" onSubmit="return check();">
				<input type="text" name="authnum"><br> <br> <input
					type="submit" class="btn btn-info" value="Submit">
			</form>
		</div>
	</center>

</body>
</html>