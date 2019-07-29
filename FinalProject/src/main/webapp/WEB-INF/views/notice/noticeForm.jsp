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
  <!-- 위치 바꾸면 import url 주소 변경해줘야함 -->
  <c:import url="../common/header.jsp"/>
  	<style>
		div#notice-container{width:400px; margin:0 auto; text-align:center;}
		div#notice-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#notice-container label.custom-file-label{text-align:left;}
	</style>
	<script>
	function validate(){
		var content = $("[name=noticeContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <c:import url="../common/menubar.jsp"/>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>공지사항 작성</h1>
      <ol class="breadcrumb">
        <li><a href="/medic/common/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">공지사항 작성</li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
      	<!-- left Section -->
        <section class="col-lg-12">
			<div id="notice-container">
			<form name="noticeFrm" action="${pageContext.request.contextPath}/notice/noticeFormEnd.do" method="post" onsubmit="return validate();">
				<input type="text" class="form-control" placeholder="제목" name="ntitle" id="ntitle" required>
				<input type="text" class="form-control" name="nwriter" value="${member.empName}" readonly required>
			    <textarea class="form-control" name="ncontent" placeholder="내용 작성" required></textarea>
				<br />
				<input type="submit" class="btn btn-outline-success" value="저장" >
				<input type="button" class="btn btn-outline-danger" value="취소" onclick="nCancle();"/>
			</form>
		</div>
        </section>
        <script>
        	function nCancle() {
        		var answer = window.confirm("작성을 취소하시겠습니까?")
        		
        		if(answer){
    				location.href = "/medic/notice/noticeList.do";
        		} 
			}
        </script>
      </div>
    </section>
  </div>
 <c:import url="../common/footer.jsp"/>
 <c:import url="../common/sidebar.jsp"/>
</div>
<c:import url="../common/scripts.jsp"/>
</body>
</html>
