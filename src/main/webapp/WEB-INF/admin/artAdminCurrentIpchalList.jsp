<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../../include/head.jsp"></jsp:include>
<div class="container-fluid">
<table class="table table-borderless table-hover">
	<tr>
		<th style="width: 10%">번호 </th>
		<th style="width: 10%">작품명  </th>
		<th style="width: 10%">입찰자 성명 </th>
		<th style="width: 20%">입찰 가격 </th>
		<th style="width: 20%">입찰 시간 </th>
		<th style="width: 20%">해당 작품 경매 마감 </th>
		<th style="width: 10%">낙찰 여부 </th>
	</tr>
	<c:forEach var="vo" items="${vos}" varStatus="st">
	<tr>
		<td style="width: 10%">${st.count}</td>
		<td style="width: 10%">${vo.workName}</td>
		<td style="width: 10%">${vo.ipchalName}</td>
		<td style="width: 20%"><fmt:formatNumber value="${vo.ipchalprice}"  pattern="#,###.#"/>원</td>
		<td style="width: 20%">${fn:substring(vo.wDate,0,11)}</td>
		<td style="width: 20%">${fn:substring(vo.workLastDate,0,11)}</td>
		<td style="width: 10%">${vo.cancelSw}</td>
	</tr>
	</c:forEach>
</table>
	<!-- 블록 페이지 시작 -->
		<div class="text-center" style="margin-top: 200px">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin4.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin4.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/myAdmin4.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin4.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin4.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin4.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
<!-- 블록 페이지 끝 -->
</div>