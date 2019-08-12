<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<form
			action="${pageContext.request.contextPath}/mailCheck/emailAuth.do"
			method="post">
			<input type="text" name="emailId"> 
			<input type="text" name="emailPwd">
			<input type="submit">
			
		</form>
	</div>


</body>
</html>