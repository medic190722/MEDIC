<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Medic</title>
<c:import url="../common/header.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<c:import url="../common/menubar.jsp" />
		<div class="content-wrapper">
			<section class="content-header">
				<h1>Medic</h1>
				<ol class="breadcrumb">
					<li><a href="/medic/common/main.do"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Main</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
				<div class="row">

					<!-- ------------------------------------------------------------------------- -->



					<div style="text-align: center;">
					<div><br><br><br><br><br><br><br>
						<div style="width: 400px; height: 300px; background-color: #D5D5E0; text-align: center; margin: 0 auto;">
						<br><Br>
							<h2>NAVER 로그인</h2>
							<form
								action="${pageContext.request.contextPath}/mailCheck/emailAuth.do"
								method="post">
								
								<br> <input type="text" name="emailId"
									style="width: 300px; height: 30px;"
									placeholder="이메일을 입력해주세요(abcd@naver.com)"><br>
								<br> <input type="text" name="emailPwd"
									style="width: 300px; height: 30px;" placeholder="비밀번호를 입력해주세요">
								<br>
								<br> <input class="btn btn-info" type="submit" value="로그인">

							</form>
						</div>
						</div>
					</div>





					<!-- ------------------------------------------------------------------------- -->

				</div>
				<!-- /.row (main row) -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<c:import url="../common/footer.jsp" />
		<c:import url="../common/sidebar.jsp" />
	</div>
	<!-- ./wrapper -->
	<c:import url="../common/scripts.jsp" />

</body>
</html>
