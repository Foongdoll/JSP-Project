<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="../../include/head.jsp"></jsp:include>
<title>Hyun's Auction</title>
</head>
<script>
	'use strict'
	
	function commentDeleteCheck(idx){
		let sw = 2;
		let query = {
				idx,
				sw
		}	
		
		$.ajax({
			type : "post",
			url : "${ctp}/artGesifanComment.ge",
			data : query,
			success : function(res) {
				if(res != ""){
					alert(res);
					location.reload();
				}
			},
			error : function(){
					alert("전송 오류");
			}
		});
	}
	
</script>
<body>
	<p><br/></p>
	<div class="container-fluid">
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>글번호</th>
			<th>댓글쓴이</th>
			<th>댓글내용</th>
			<th>댓글쓴날짜</th>
			<th>아이피</th>
			<th>비고</th>
		</tr>
		<c:forEach var="vo" items="${vos}">
		<tr>
			<td>${vo.idx }</td>
			<td>${vo.gesifanIdx }</td>
			<td>${vo.nickName }</td>
			<td>${vo.comment }</td>
			<td>${vo.wDate }</td>
			<td>${vo.hostIp }</td>
			<td>
				<button type="button" onclick="commentDeleteCheck(${vo.idx})">삭제</button>
			</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 블록 페이지 시작 -->
		<div class="text-center" style="margin-top: 200px">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin8.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin8.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/myAdmin8.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin8.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin8.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin8.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
<!-- 블록 페이지 끝 -->
	</div>
	<p><br/></p>
</body>
</html>