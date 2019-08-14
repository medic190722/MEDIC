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


</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<c:import url="../common/menubar.jsp" />
		<div class="content-wrapper">
			<section class="content-header">
				<h1>입원환자업무</h1>
				<ol class="breadcrumb">
					<li><a href="/medic/common/main.do"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Main</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
				
				<!-- ================================================================================== -->






				<div class="searchPatient" style="margin: 0 auto; margin-top: 20px;">

					<table class="table table-striped table-hover" id="listArea"
						style="width: 1300px; text-align: center; margin: 0 auto;">
						<thead>
							<tr style="background: #41aeda;">
								<th style="text-align: center;width: 10%;">날짜</th>
								<th style="text-align: center;width: 5%;">병동</th>
								<th style="text-align: center;width: 10%;">환자이름</th>
								<th style="text-align: center;width: 10%;">담당의사</th>
								<th style="text-align: center;width: 20%;">검사항목</th>
								<th style="text-align: center;width: 20%;">내용</th>
								<th style="text-align: center;width: 5%;">실행여부</th>
								<th style="text-align: center;width: 10%;">업무이행</th>
								
							</tr>
							<c:forEach items="${list}" var="n">
								<tr id="${n.pNo}" style="background: #fff;">
									<td style="display:none;">${n.pNo}</td>
									<td>${n.orderDate}</td>
									<td>${n.wardCode}</td>
									<td>${n.pName}</td>
									<td>${n.empName}</td>
									<td>${n.orderExamination}</td>
									<td>${n.doctorOrder}</td>
									<td>${n.checkYn}</td>
									<td><button class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/nurse/updateOrderYn.do?pNo=${n.pNo}&doctorOrder=${n.doctorOrder}'">업무이행</button></td>
									

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
