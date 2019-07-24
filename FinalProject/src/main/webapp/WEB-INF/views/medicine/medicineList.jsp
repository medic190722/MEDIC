<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의약품 리스트</title>
 <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  
	<style>
		/*글쓰기버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
		
		
	</style>
	<script>
		/* function fn_goMedicineForm() {
			location.href = "${pageContext.request.contextPath}/board/boardForm.do";
		} */
	
	
		$(function(){
			$("tr[id]").on("click",function(){
				var medCode = $(this).attr("id");
				console.log("medCode="+medCode);
				location.href = "${pageContext.request.contextPath}/medicine/medicineView.do?no="+medCode;
			});
		});
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<section id="medicine-container" class="sidebar">
			<input type="button" value="의약품 추가" id="btn-add"
				class="btn btn-outline-success" onclick="fn_goMedicineForm();" />
			<table id="tbl-medicine" class="table table-bordered table-hover">
				<tr>
					<th>약품 코드</th>
					<th>약품 명</th>
					<th>재고 수량</th>
					
				</tr>
				<c:forEach items="${list}" var="m">
					<tr id="${m.medCode}">
						<td>${m.medCode}</td>
						<td>${m.medName}</td>
						<td>${m.medCount}</td>
						

					</tr>
				</c:forEach>
			</table>
			<c:out value="${pageBar}" escapeXml="false" />
		</section>
	</div>
</body>
</html>