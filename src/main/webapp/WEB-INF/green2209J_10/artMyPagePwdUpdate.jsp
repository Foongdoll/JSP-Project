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
<jsp:include page="../../include/joinStyle.jsp"></jsp:include>
<script>
	'use strict'
	
	$(document).ready(function(){
		$('#modalIpchal').modal('show');
	});
	
	function pwdUpdateCancel(){
		top.location.href="${ctp}/artMyPage.my";
	}
	
	
	function pwdUpdateCheck(){
		let uPwd = $("#uPwd").val();
		
		$.ajax({
			type : "post",
			url : "${ctp}/artMyPwdUpdateCheck.my",
			data : {uPwd : uPwd},
			success : function(res){
				if(res == "1"){
					alert("회원 인증 성공");
					$('#modalIpchal').modal('hide');
				}
				else{
					alert("회원 인증 실패");
					top.location.href="${ctp}/artMyPage.my";
				}
			},
			error : function(){
				alert("전송 실패");				
			}
		});
		
		
	}
	
	function nPwdLastCheck(){
		let nPwd = $("#nPwd").val();
		let nPwdCheck = $("#nPwdCheck").val();
		
		if(nPwd.trim() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#nPwd").focus();
			return;
		}
		else if(nPwdCheck.trim() == ""){
			alert("비밀번호 확인을 입력해주세요.");
			$("#nPwdCheck").focus();
			return;
		}
		else if(nPwd != nPwdCheck){
			alert("비밀번호가 서로 다릅니다");
			$("#nPwd").focus();
			return;
		}
		else {
			
			$.ajax({
				type : "post",
				url : "${ctp}/artNewPwdUpdate.my",
				data : {nPwd:nPwd},
				success : function(res) {
					if(res == "1"){
						alert("비밀번호가 변경되셨습니다.");
						top.location.href="${ctp}/artMyPage.my";
					}
					else {
						alert("비밀번호가 변경되지않으셨습니다.");
						let ans = confirm("비밀번호 변경을 다시 시도 하시겠습니까?");
						if(!ans) top.location.href="${ctp}/artMyPage.my";
						else {
							alert("비밀번호를 다시 입력해주세요.");							
						}
					}
				},
				error : function() {
					alert("전송 오류");
				}
			});
			
		}
	}
	
</script>
<body>
	<p><br/></p>
	<div class="container">
	<h2>비 밀 번 호 변 경</h2>
		<form name="nPwdUpdateForm">
			<table class="table table-borderless" style="margin-left:50px">
				<tr>
					<td>
					<p class="btn btn-dark">비밀번호를 입력해주세요</p>
						<input type="password" name="nPwd" id="nPwd" class="form-control">
					</td>
				</tr>
				<tr>
					<td>
					<p class="btn btn-dark">변경하실 비밀번호를 한번 더 입력해주세요</p>
						<input type="password" name="nPwdCheck" id="nPwdCheck" class="form-control">
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" onclick="nPwdLastCheck()">비밀번호 변경</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<p><br/></p>
	
  <div class="modal fade" id="modalIpchal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="background-color: #333">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회 원 본 인 인 증</h5>
        <button type="button" class="close" data-dismiss="modal" onclick="pwdUpdateCancel()" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<form name="pwdCheckForm"> 
      				<h2>비밀번호 입력</h2>
	      	<table class="table table-borderless" style="color:white; margin-left: 15%">
						<tr>
							<td>
								<input type="password" id="uPwd" name="uPwd" class="form-control"/>
							</td>
						</tr>
					</table>
				</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="pwdUpdateCancel()" data-dismiss="modal">닫기</button>
        <button type="button" onclick="pwdUpdateCheck()" class="btn btn-primary">회원 인증</button>
      </div>
    </div>
  </div>
 </div>
</body>
</html>