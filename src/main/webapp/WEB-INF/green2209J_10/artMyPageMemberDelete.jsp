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
	
	function memDeleteCheck(){
		let dMid = $("#dMid").val();
		let dPwd = $("#dPwd").val();
		
		if(dMid.trim() == ""){
			alert("아이디를 입력해주세요");
			$("#dMid").focus();
			return;
		}
		else if(dPwd.trim() == ""){
			alert("비밀번호를 입력해주세요");
			$("#dPwd").focus();
			return;
		}
		else {
			
		}
		
	}
	
</script>
<body>
	<p><br/></p>
	<div class="container">
		<h2>회 원 탈 퇴 신 청</h2>
		<form name="memDeleteForm" method="post" action="${ctp}/artMemberDeleteOk.my">
			<table class="table table-borderless" style="color: white">
				<tr>
					<td>
						<p>※퇴원 탈퇴를 하시면 더 이상 이 계정으로는 로그인이 불가능하십니다.<br/>탈퇴 이후 30일 이내에 계정 복구가 가능하십니다.※</p>
					</td>
				</tr>
				<tr>
					<td>
						아이디 : <input type="text" id="dMid" name="dMid" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td>
						비밀번호 : <input type="password" id="dPwd" name="dPwd" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td>
						<button onclick="memDeleteCheck()" class="btn btn-dark">회 원 탈 퇴</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<p><br/></p>
</body>
</html>