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


					<div class="col-md-2">
						<br> <br> <br> <br> <br> <br> <br>
						<br> <Br>
						<div class="box box-solid" style="height: 350px">
							<Br> <Br>
							<div class="box-header with-border">
								<h3 class="box-title">Folders</h3>

								<div class="box-tools">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="box-body no-padding">
								<ul class="nav nav-pills nav-stacked">
									<li><a
										href="${pageContext.request.contextPath}/mailMit/mailMitList.do"><i
											class="fa fa-envelope-o"></i> 메일 보내기</a></li>
									<li class="active"><a
										href="${pageContext.request.contextPath}/mail/mail.do""><i
											class="fa fa-inbox"></i> 받은 메일 <span
											class="label label-primary pull-right">12</span></a></li>

									<li><a href="#"><i class="fa fa-file-text-o"></i> 보낸
											메일</a></li>

									<li><a href="#"><i class="fa fa-trash-o"></i> 휴지통</a></li>
								</ul>
							</div>
						</div>
					</div>






					<div class="col-md-9">
						<br> <br> <br> <br> <br> <br>
						<div class="box box-primary" style="text-align: center;">
							<div class="box-header with-border">
								<h3 class="box-title">메일 전송</h3>
							</div>

							<div class="box-body no-padding">
								<br>
								<form
									action="${pageContext.request.contextPath}/mailMit/mailSending.do"
									method="post" enctype="multipart/form-data">
									<div align="center">
										<input type="text" name="tomail" size="120" style="width: 90%"
											value="${mailMit.empEmail}" placeholder="이메일을 입력해주세요"
											class="form-control">
									</div>
									<div align="center">
										<!-- 제목 -->
										<input type="text" name="title" size="120" style="width: 90%"
											placeholder="제목을 입력해주세요" class="form-control">
									</div>
									<p>
									<div align="center">
										<!-- 내용 -->
										<textarea name="content" cols="120" rows="12"
											style="width: 90%; resize: none" placeholder="내용#"
											class="form-control"></textarea>
									</div>

									<input type="text" name="empEmail" style="display: none;"
										value="${m.empEmail}">

									<p>
									<div align="center">
										<input type="submit" value="메일 보내기" class="btn btn-warning">

									</div>
								</form>
								<br> <br> <br> <br> <br>
							</div>
						</div>
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
