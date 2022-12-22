<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <jsp:include page="../../include/head.jsp"></jsp:include>
</head>
<body>
	<div class="container-fluid">
		<h2>작가 리스트</h2>
		<table class="table table-borderless table-hover" style="text-align: center;margin-top: 10%;padding: 20px">
		<tr>
			<th style="width: 5%">번호 </th>
			<th style="width: 10%">
					작가명
				
			</th>
			<th style="width: 5%">성별 </th>
			<th style="width: 20%">생일</th>
			<th style="width: 10%">고향 </th>
			<th style="width: 10%">자기소개 </th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
		<tr>
			<td>${st.count}</td>
			<td>
				<a href="${ctp}/artAdminWriterInfor.ad?writerName=${vo.writerName}&writerInfor=${vo.writerInfor}">
					${vo.writerName }
				</a>
			</td>
			<td>${vo.writerGender }</td>
			<td>${fn:substring(vo.writerBirthday,0,11) }</td>
			<td>${vo.writerHomeTown}</td>
			<td>${vo.writerInfor }</td>
		</tr>
	</c:forEach>
	</table> 
	
		<!-- 블록 페이지 시작 -->
		<div class="text-center" style="margin-top: 200px">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin2.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin2.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/myAdmin2.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin2.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin2.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin2.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
<!-- 블록 페이지 끝 -->
	
	</div>
</body>
</html>