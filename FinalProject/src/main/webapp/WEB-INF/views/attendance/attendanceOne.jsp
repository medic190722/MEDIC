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

		
	});
	
	function AllList(){
		location.href = "${pageContext.request.contextPath}/member/memberList.do";
	}
</script>


</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<c:import url="../common/menubar.jsp" />
		<div class="content-wrapper">
			<section class="content-header">
				<h1>출근조회</h1>
				<ol class="breadcrumb">
					<li><a href="/medic/common/main.do"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">근태관리</li>
					<li class="active">출근관리</li>
					<li class="active">출근조회</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
			
				<!-- ================================================================================== -->






				<div class="searchPatient" style="margin: 0 auto; margin-top: 20px;">

					<table class="table table-striped table-hover" id="listArea"
						style="width: 100%; text-align: center; margin: 0 auto;">
						<thead>
							<tr style="background: #41aeda;">
								<th style="text-align: center">사번</th>
								<th style="text-align: center">이름</th>
								<th style="text-align: center">출근시간</th>
								<th style="text-align: center">퇴근시간</th>
						
							</tr>
							<c:forEach items="${list}" var="e">
								<tr id="${e.empNo}" style="background: #fff;">
									<td>${e.empNo}</td>
									<td>${e.empName}</td>
									<td>${e.attend}</td>
									<td>${e.leave}</td>
									

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
	
	<script>
	function search(){
		location.href="${pageContext.request.contextPath}/member/searchMember.do?e_name="+$(e_name).val();
	}

	function enterkey(){
	   if(window.event.keyCode == 13){
	    	search();
	    }
	}
	</script>
	<!-- /.content-wrapper -->
	<c:import url="../common/footer.jsp" />
	<c:import url="../common/sidebar.jsp" />

	<!-- ./wrapper -->
	<c:import url="../common/scripts.jsp" />

</body>
</html>
