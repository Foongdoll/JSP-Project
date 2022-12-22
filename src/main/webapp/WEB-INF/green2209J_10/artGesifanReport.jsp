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
<jsp:include page="../../include/style.jsp"></jsp:include>
<script>
	'use strict'

	
	function reportCheck(){
		let reportcontent = $("#reportcontent").val();
		
		if(reportcontent == ""){
			alert("신고 내용을 입력해주세요.");
			$("#reportcontent").focus();
			return;
		}
		else {
			reportForm.submit();
		}
		
	}
</script>
<body>
	<p><br/></p>
	<div class="container">
  <jsp:include page="../../include/header.jsp"></jsp:include>
		<h2 style="margin-top: 70px">게 시 글 신 고</h2>
		<form name="reportForm" method="post" action="${ctp}/argGesifanReportOk.ge">
		<table class="table table-borderless" style="background-color: #ccc;">
		<tr>
			<td colspan="3">
				신고사유 : 
				<select name="reportSw">
					<option value="">불필요한 도배</option>
					<option value="">지나친 욕설</option>
					<option value="">지나친 비방</option>
					<option value="">불법광고</option>
				</select>
			</td>
		</tr>
			<tr>
				<td>
					신고하실 게시글 : ${vo.title}
				</td>
				<td>
					글쓴이 : ${vo.nickName}
				</td>
				<td>
					글이 써진 날짜 : ${fn:substring(vo.wDate,0,19)}
				</td>
			</tr>
			<tr>
				<td colspan="3">
					글의 내용 
					<textarea rows="10"  class="form-control" readonly>${vo.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					신고 내용 
					<textarea rows="10" name="reportcontent" class="form-control"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" onclick="reportCheck()" class="btn btn-dark">신고하기</button>
					<button type="button" onclick="location.href='${ctp}/artGesifanContent.ge?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}'" class="btn btn-dark">뒤로가기</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="idx" value="${vo.idx}" />
	</form>	
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
	<p><br/></p>
</body>
</html>