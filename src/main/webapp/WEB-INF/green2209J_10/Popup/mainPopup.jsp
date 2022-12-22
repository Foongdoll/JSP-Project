<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="../../../include/head.jsp"></jsp:include>+
<title>Hyun's Auction</title>
</head>
<jsp:include page="../../../include/style.jsp"></jsp:include>
<body>
	<p><br/></p>
	<div class="container">
	<div class="card bg-light mb-3" style="width: 100%;color: black">
  <div class="card-header"><h3>축하드립니다~~</h3></div>
  <div class="card-body">
    <h4 class="card-title">낙찰된 작품이 있습니다 ~~</h4>
    <p class="card-text">${res}</p>
  </div>
</div>
	</div>
	<p><br/></p>
</body>
</html>