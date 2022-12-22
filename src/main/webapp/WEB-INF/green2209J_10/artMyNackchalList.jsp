<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="../../include/head.jsp"></jsp:include>
<title>Hyun's Auction</title>
</head>
<jsp:include page="../../include/style.jsp"></jsp:include>
<body>
	<p><br/></p>
	<div class="container">
  <table class="table table-borderless" style="color: white">
	<tr>
		<th style="width: 10%">번호 </th>
		<th style="width: 10%">작품명  </th>
		<th style="width: 20%">작가명 </th>
		<th style="width: 20%">낙찰 금액 </th>
		<th style="width: 10%">상 태 </th>
	</tr>
	<c:forEach var="vo" items="${vos}" varStatus="st">
	<tr>
		<td style="width: 10%">${st.count}</td>
		<td style="width: 10%">${vo.work}</td>
		<td style="width: 10%">${vo.workWriter}</td>
		<td style="width: 20%"><fmt:formatNumber value="${vo.ipchalPrice}"  pattern="#,###.#"/>원</td>
		<td style="width: 10%">${vo.cancelSw}</td>
	</tr>
	</c:forEach>
</table>
	</div>
	<p><br/></p>
</body>
</html>