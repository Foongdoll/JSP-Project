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
<body>
	<p><br/></p>
	<div class="container">
	<h2>작가 리스트</h2>
		<table class="table table-borderless table-hover" style="text-align: center;margin-top: 10%;padding: 20px">
			<tr>
				<th style="width: 5%">번호 </th>
				<th style="width: 25%">작가명</th>
				<th style="width: 20%">성별 </th>
				<th style="width: 20%">고향 </th>
				<th style="width: 30%">자기소개 </th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td>${vo.writerName }</td>
				<td>${vo.writerGender }</td>
				<td>${vo.writerHomeTown}</td>
				<td>${vo.writerInfor }</td>
			</tr>
				<tr>
					<td style="width: 50%" colspan="2">
						<img src="${ctp}/data/artAuction/${vo.workFSname}" width="100%">
					</td>
					<td colspan="2">
						<p>작품명 : ${vo.work}</p>					
						<p>작품 크기 : ${vo.workSize}</p>					
						<p>작품 추정가 : ${vo.chuJungPrice}</p>					
						<p>작품 시작가 : <fmt:formatNumber value="${vo.startPrice}"  pattern="#,###.#"/>원</p>					
						<p>작품 현재가 : <fmt:formatNumber value="${vo.currentPrice}"  pattern="#,###.#"/>원</p>					
						<p>작품 즉시구매가 : <fmt:formatNumber value="${vo.boomnackchalPrice}"  pattern="#,###.#"/>원</p>					
						<p>작품 경매시작일 : ${fn:substring(vo.workStartDate,0,11)}</p>					
						<p>작품 경매마감일 :	${fn:substring(vo.workLastDate,0,11)}</p>					
					</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 블록 페이지 시작 -->
		<div class="text-center" style="margin-top: 200px">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAdminWriterInfor.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAdminWriterInfor.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/artAdminWriterInfor.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAdminWriterInfor.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAdminWriterInfor.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAdminWriterInfor.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
<!-- 블록 페이지 끝 -->
	

	</div>
	<p><br/></p>
</body>
</html>