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
	
	function reportCheck(sw,idx){
		let query = {
				sw,
				idx
		}
		
		if(sw == 1){
			
			$.ajax({
				type : "post",
				url : "${ctp}/reportProcess.ad",
				data : query,
				success : function(res){
					alert(res);
					location.reload();
				},
				error : function(){
					alert("전송 실패");					
				}
			});
			
			
		}
		else if(sw == 2){
			
			$.ajax({
				type : "post",
				url : "${ctp}/reportProcess.ad",
				data : query,
				success : function(res){
					alert(res);
					location.reload();
				},
				error : function(){
					alert("전송 실패");					
				}
			});
		}
	}
	
	function reportMemCheck(nickName){
		
		$.ajax({
			type : "post",
			url : "${ctp}/adminReportMemPenalty.ad",
			data : {nickName:nickName},
			success : function(res){
				alert(res);
				location.reload();				
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
		<table class="table table-hover table-borderless">
			<tr>
				<th>번호</th>
				<th>신고 게시글</th>
				<th>게시글 글쓴이</th>
				<th>신고자</th>
				<th>신고내용</th>
				<th>신고 날짜</th>
				<th>신고 점수</th>
				<th>진행 상태</th>
			</tr>		
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${vo.idx }</td>
					<td><a href="location.href=${ctp}/artAdminGesigleContent.ad?idx=${vo.idx}&pageSize=${pageSize}&pag=${pag}"><font color="black">${vo.title}</font></a></td>
					<td>${vo.writer}</td>
					<td>${vo.reporter }</td>
					<td>${vo.content }</td>
					<td>${vo.rDate }</td>
					<td>
						${vo.reportCnt }
					</td>
					<td>
						${vo.currentSw }
						<c:if test="${vo.currentSw == '접수'}">
						<button type="button" onclick="reportCheck(1,${vo.idx})" class="btn btn-dark">처리중</button>
						</c:if>
						<c:if test="${vo.currentSw == '처리중'}">
						<button type="button" onclick="reportCheck(2,${vo.idx})" class="btn btn-dark">처리완료</button>
						</c:if>
						<button type="button" onclick="reportMemCheck('${vo.writer}')" class="btn btn-dark">패널티 누적</button>
						</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<p><br/></p>
</body>
</html>