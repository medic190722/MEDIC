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
  <script>
  function backGo() {
	  location.href="${pageContext.request.contextPath}/vacation/vacationList.do";
  }
  </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <c:import url="../common/menubar.jsp"/>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        	휴가신청
      </h1>
      <ol class="breadcrumb">
        <li><a href="/medic/common/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">휴가신청</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Main row -->
      <div class="row">
       
       
       <!--  ================================================================================================= -->
       
		<div id="container">
		
		<div class="searchPatient"
							style="margin: 0 auto; margin-top: 20px; width: 500px;">
			<form name="MedicineFrm" action="${pageContext.request.contextPath}/vacation/vacationFormEnd.do" method="post">
				<label for="empNo" style="margin-top:10px;">사번</label>	<input type="text" class="form-control" placeholder="사번" name="empNo" id="empNo"  value="${m.empNo }"  readonly>
				<label for="vDate" style="margin-top:10px;">출발날짜</label><input type="date" class="form-control" placeholder="출발 날짜" name="vDate" id="vDate" required >
				<label for="vDateEnd" style="margin-top:10px;">복귀날짜</label><input type="date" class="form-control" placeholder="복귀 날짜" name="vDateEnd" id="vDateEnd" required >
				<textarea name="vContent" id="vContent" cols="80" rows="10" style="resize: none; margin-top:10px;"placeholder="내용입력" required></textarea>
				
	
				<%-- <input type="text" class="form-control" name="boardWriter" value="${member.userId}" readonly required> --%>
				
			    
				<br />
				<div style="text-align: right;">
					<input type="submit" class="btn btn-primary" 
					style="background: #697282; border-color: #333;" value="추가" >
					<input class="btn btn-primary" type="button" onclick="backGo()"
					style="background: #697282; border-color: #333;" value="취소">
				</div>
			</form>
		</div>
       
       <!--  ================================================================================================= -->
       
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
