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
	<div class="container-fluid">
	<div class="content">
						<table class="table table-borderless table-hover">
						<c:forEach var="vo" items="${vos}">
							<tr>
								<td>
									<a href="javascript:workCheck(${vo.idx})">
									<img  src="${ctp}/data/artAuction/${vo.workFSname}" width="60%" height="100%" />
									</a>
								</td>
								<td>
								<h3>
									<span style="width: 100%;text-align: left;" class="badge badge-secondary">
										작품명 : ${vo.work}<br/><br/><br/>
										작가명 : ${vo.workWriter}<br/><br/><br/>
										추정가 : ${vo.chuJungPrice}<br/><br/><br/>
										현재가 : <fmt:formatNumber value="${vo.currentPrice}"  pattern="#,###.#"/>원<br/><br/><br/>
										즉시구매가 : <fmt:formatNumber value="${vo.boomnackchalPrice}"  pattern="#,###.#"/>원<br/><br/><br/>
										경매마지막날짜 : ${fn:substring(vo.workLastDate,0,11)} 밤 12시<br/><br/><br/>
										작품소개 : ${vo.workComment}</span><br/><br/><br/>
								</h3>
								</td>
							</tr>
							</c:forEach> 
						</table>
					</div>
		<!-- 블록 페이지 시작 -->
		<div class="text-center" style="margin-top: 200px">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin3.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin3.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/myAdmin3.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin3.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin3.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin3.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
<!-- 블록 페이지 끝 -->
	</div>
	<p><br/></p>
</body>
</html>