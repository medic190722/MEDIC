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
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<!-- 사용자작성 css -->
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

					<!-- ================================================================================== -->


					<div style="text-align: center;">
						<h4>메일 보내기</h4>
						<br>
						<form action="${pageContext.request.contextPath}/mailMit/mailSending.do"
							method="post" enctype="multipart/form-data">
							<div>
								<input type="text" name="tomail" size="120" style="width: 100%"
									value="${mailMit.empEmail}" placeholder="이메일을 입력해주세요" class="form-control">
							</div>
							<div align="center">
								<!-- 제목 -->
								<input type="text" name="title" size="120" style="width: 100%"
									placeholder="제목을 입력해주세요" class="form-control">
							</div>
							<p>
							<div align="center">
								<!-- 내용 -->
								<textarea name="content" cols="120" rows="12"
									style="width: 100%; resize: none" placeholder="내용#"
									class="form-control"></textarea>
							</div>
							
							<input type="text" name="empEmail" style="display: none;" value="${m.empEmail}">
				
							<p>
							<div align="center">
								<input type="submit" value="메일 보내기" class="btn btn-warning">
								
							</div>
						</form>
					</div>


					<!-- ================================================================================== -->






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
