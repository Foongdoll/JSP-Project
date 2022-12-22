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
<script>
	'use strict'
	
	function secession(name,nickName){
		let ans = confirm(name+"님을 탈퇴처리하시겠습니까?");
		
		if(!ans) return;
		
		$.ajax({
			type : "post",
			url : "${ctp}/adminSecession.ad",
			data : {nickName:nickName},
			success : function (){
				alert("회원 정보가 삭제되었습니다.");
				location.reload();
			},
			error : function(){
				alert("전송 실패");
			}
		});
		
	}
	
	function levelChange(idx){
		let memLevel = memLevelForm.memLevel.value;
		
		let query = {
				idx,
				memLevel
		}
		
		$.ajax({
			type : "post",
			url : "${ctp}/adminMemberLevelUpdate.ad",
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
	
	function memUpdate(idx,cnt,level){
		$("#memLevel"+cnt).hide();
 				let inputStr = "<form name='memLevelForm'>"
				inputStr += "<select name='memLevel'>"
				inputStr += "<option value='1'<c:if test='"+level+" == 1'>selected</c:if>>준회원</option>"
				inputStr += "<option value='2'<c:if test='"+level+" == 2'>selected</c:if>>정회원</option>"
				inputStr += "<option value='3'<c:if test='"+level+" == 3'>selected</c:if>>작가</option>"
				inputStr += "<option value='0'<c:if test='"+level+" == 4'>selected</c:if>>관리자</option>"
				inputStr += "</select>"
				inputStr += "<input type='button' onclick='levelChange("+idx+")' value='등급 수정' class='btn btn-warning'/>"
				inputStr += "</form>"
				
			$("#member"+cnt).html(inputStr);
		
	}
	
</script>
<body>
	<div class="container-fluid">
	<h2>회원 리스트</h2>
		<table class="table table-borderless table-hover" style="text-align: center;margin-top: 10%;padding: 20px">
		<tr>
			<th style="width: 5%">번호 </th>
			<th style="width: 10%">성명  </th>
			<th style="width: 10%">닉네임 </th>
			<th style="width: 5%">성별 </th>
			<th style="width: 20%">전화번호 </th>
			<th style="width: 10%">생일 </th>
			<th style="width: 10%">가입일 </th>
			<th style="width: 10%">회원등급 </th>
			<th style="width: 10%">회원탈퇴 </th>
			<th style="width: 10%">비고 </th>
		</tr>
		<c:set var="cnt" value="1"></c:set>
		<c:forEach var="vo" items="${vos}" varStatus="st">
		<tr>
			<td>${st.count}</td>
			<td>${vo.name }</td>
			<td>${vo.nickName }</td>
			<td>${vo.gender }</td>
			<td>${vo.tel }</td>
			<td>${fn:substring(vo.birthday,0,11) }</td>
			<td>${fn:substring(vo.startDate,0,11) }</td>
			<td>
				<span id="member${cnt}"></span>
				<div id="memLevel${cnt}">
					<c:if test="${vo.level == 0}">
						관 리 자
					</c:if>
					<c:if test="${vo.level == 1}">
						준 회 원
					</c:if>
					<c:if test="${vo.level == 2}">
						정 회 원
					</c:if>
					<c:if test="${vo.level == 3}">
						작 가
					</c:if>
				</div>
			</td>
			<td>
				<c:if test="${vo.memDelete == 1}">
					활동중
				</c:if>
				<c:if test="${vo.memDelete != 1}">
					탈퇴 신청
				</c:if>
				</td>
					<td>
						<c:if test="${vo.memDelete != 1}">
							<button type="button" onclick="secession('${vo.name }','${vo.nickName}')" class="btn btn-dark">탈 퇴 처 리</button>
						</c:if>
						<button type="button" onclick="memUpdate(${vo.idx},${cnt},${vo.level})" class="btn btn-dark">등급 수정</button>
					</td>
				</tr>
		<c:set var="cnt" value="${cnt + 1}"></c:set>
		</c:forEach>
	</table> 
<!-- 블록 페이지 시작 -->
		<div class="text-center" style="margin-top: 200px">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin1.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin1.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/myAdmin1.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin1.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin1.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin1.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
<!-- 블록 페이지 끝 -->
	</div>
</body>
</html>