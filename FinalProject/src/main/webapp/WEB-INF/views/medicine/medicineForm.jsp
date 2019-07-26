<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Medic</title>
  
  <c:import url="../common/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <c:import url="../common/menubar.jsp"/>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        	Medic
      </h1>
      <ol class="breadcrumb">
        <li><a href="/medic/common/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Main</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Main row -->
      <div class="row">
       
       <!-- ======================================================================================================================== -->
       	<div id="container">
		
		<div class="searchPatient"
							style="margin: 0 auto; margin-top: 20px;">
			<form name="MedicineFrm" action="${pageContext.request.contextPath}/medicine/medicineFormEnd.do" method="post">
				<input type="text" class="form-control" placeholder="의약품 코드" name="medCode" id="medCode" required>
				<input type="text" class="form-control" placeholder="의약품 명" name="medName" id="medName" required>
				<input type="number" class="form-control" placeholder="수량" name="medCount" id="medCount" required>
				<%-- <input type="text" class="form-control" name="boardWriter" value="${member.userId}" readonly required> --%>
				
			    
				<br />
				<input type="submit" class="btn btn-outline-success" value="추가" >
				<input class="gray_btn" type="reset" value="취소">
			</form>
		</div>
		
<!-- ======================================================================================================================== -->       

      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 <c:import url="../common/footer.jsp"/>
 <c:import url="../common/sidebar.jsp"/>
</div>
<!-- ./wrapper -->
<c:import url="../common/scripts.jsp"/>


</body>
</html>
