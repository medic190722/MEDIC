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
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <c:import url="../common/menubar.jsp"/>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>공지 상세보기</h1>
      <ol class="breadcrumb">
        <li><a href="/medic/common/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">공지상세</li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
        <section class="col-lg-12">
		<div id="notice-container">
			<input type="text" class="form-control" placeholder="제목" name="ntitle" id="ntitle" value="${notice.ntitle}" required>
			
			<input type="text" class="form-control" name="nwriter" value="${notice.nwriter}" readonly required>
		
		    <textarea class="form-control" name="ncontent" placeholder="내용" required>${notice.ncontent }</textarea>
		    
		    <br>
		    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'">리스트로</button>
		    <c:if test="${m.empNo == 1000}">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeUpdateView.do?nno=${notice.nno}'">수정 페이지</button>
			</c:if>
		</div>
        </section>
      </div>
    </section>
  </div>
 <c:import url="../common/footer.jsp"/>
 <c:import url="../common/sidebar.jsp"/>
</div>
<c:import url="../common/scripts.jsp"/>
</body>
</html>
