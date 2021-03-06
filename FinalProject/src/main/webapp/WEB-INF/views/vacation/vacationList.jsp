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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>
	function insert() {
		location.href = "${pageContext.request.contextPath}/vacation/vacationInset.do";
	}

	$(function() {

		$("#listArea td")
				.mouseenter(function() {
					$(this).parent().css({
						"background" : "darkgray",
						"cursor" : "pointer"
					});
				})
				.mouseout(function() {
					$(this).parent().css({
						"background" : "white"
					});
				})
				.click(
						function() {
							var vCode = $(this).parent().children().eq(0)
									.text();

							console.log(vCode);

							location.href = "${pageContext.request.contextPath}/vacation/vacationOne.do?vCode="
									+ vCode;
						});
	});

	function enterkey() {
		if (window.event.keyCode == 13) {
			search();
		}
	}

	function search() {
		var vName = $(vNameId).val();
		console.log(vName);
		location.href="${pageContext.request.contextPath}/vacation/searchVacation.do?vName="+vName
	}
	
	function clickOn() {
		var vName = $(vNameId).val();
		console.log(vName);
		location.href="${pageContext.request.contextPath}/vacation/searchVacation.do?vName="+vName
	}
</script>




</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<c:import url="../common/menubar.jsp" />
		<div class="content-wrapper">
			<section class="content-header">
				<h1>휴가 및 병가리스트</h1>
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




					<div class="container">

						<div style="text-align: center;">
							<div class="has-feedback"
								style="width: 400px; display: inline-block">
								<input type="search" class="form-control input-sm" id="vNameId"
									name="vNameId" onkeyup="enterkey();" value="" placeholder="작성자명"/>
							</div>
							
							<button id="firstOutReceipt" type="submit"
								class="btn btn-primary" onclick="clickOn();"
								style="background: #697282; border-color: #333;">검 색</button>
							
							
						</div>


						<div class="searchPatient"
							style="margin: 0 auto; margin-top: 20px;">

							<table class="table table-striped table-hover" id="listArea"
								style="width: 1200px; text-align: center; margin: 0 auto;">
								<thead>
									<tr style="background: #4BA0BE;">
										<th style="text-align: center">휴가 코드</th>
										<th style="text-align: center">작성인</th>
										<th style="text-align: center">날짜</th>
										<th style="text-align: center">승인유무</th>

									</tr>
									<c:forEach items="${list}" var="v">
										<tr id="${v.vCode}" style="background: #fff;">
											<td>${v.vCode}</td>
											<td>${v.empName}</td>
											<td>${v.vDate} ~ ${v.vDateEnd}</td>
											<td>${v.vYn}</td>

										</tr>
									</c:forEach>
							</table>
							<div style="text-align: center;">
								<c:out value="${pageBar}" escapeXml="false" />
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
