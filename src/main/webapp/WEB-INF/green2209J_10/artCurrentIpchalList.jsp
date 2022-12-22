<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../../include/head.jsp"></jsp:include>
<table class="table">
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
		<td style="width: 10%">
			${vo.cancelSw}
			<c:if test="${vo.cancelSw == '낙찰'}"><i class="fa-solid fa-feather"></i></c:if>
		</td>
	</tr>
	</c:forEach>
</table>