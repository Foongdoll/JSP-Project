<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../include/head.jsp"></jsp:include>
<jsp:include page="../../include/style.jsp"></jsp:include>
</head>
<script type="text/javascript">
	'use strict'
	window.onload=function(){
		$("#mid").focus();
	}
	
	function fCheck(){
		const regmid = /^[a-z]+[a-z0-9]{5,19}$/g;  // 영문 숫자 최소 5자 최대 19 자 
		const regpwd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; //최소 8자 16자 영어 숫자 특수문자 최소 1개씩
		
		let mid = $("#mid").val();
		let pwd = $("#pwd").val();
		
		if(mid == "admin" && pwd == "1234"){
			Loginform.submit();
		}
		else if(mid.trim() == "" || !regmid.test(mid)){
			alert("아이디 양식에 맞게 입력해주세요.");
			myForm.mid.focus();
			return false;
		}
		else if(pwd.trim() == "" || !regpwd.test(pwd)){
			alert("비밀번호에는 최소 8자 이상 하나이상의 대/소문자 숫자 및 특수문자를 넣어주세요");
			myForm.pwd.focus();
			return false;
		}
		else {
			Loginform.submit();
		}
		
	}

	
	function findmid(){
		let nickName = prompt("찾으시는 아이디의 닉네임을 입력해주세요");
		
		if(nickName.trim() == ""){
			alert("비밀번호 찾기를 중단합니다");
			myform.mid.focus();
			return;
		}
		
		let memCheck = prompt("추가 인증하실 항목번호를 입력해주세요 1. 전화번호 2. 이메일");
		let memCheckmsg;
		if(memCheck == 1){
			memCheckmsg = prompt("찾으시는 아이디의 전화번호를 입력해주세요");
		}
		else if(memCheck == 2){
			memCheckmsg = prompt("찾으시는 아이디의 이메일를 입력해주세요");
		}
		else {
			alert("유효하지않은 항목입니다.");
			return;
		}
		
		let checkValue = {
				nickName,
				memCheck,
				memCheckmsg
		};
		
		
		$.ajax({
			type : "post",
			url : "${ctp}/artFindMid.art",
			data : checkValue,
			success : function(res) {
				if(res == 3){
					alert("일치하는 회원정보를 찾을 수 없습니다.");
				}
				else if(res.trim() != ""){
					alert("회원 님의 아이디는 "+res+"입니다.");
				}				
				else {
					alert("아이디 찾기에 실패하셨습니다.");
				}
			},
			error : function() {
				alert("전송 실패");
			}
		}); 
	}
	
	
	function findpwd(){
		let mid = prompt("찾으시는 비밀번호의 아이디를 입력해주세요");
		
		if(mid.trim() == ""){
			alert("비밀번호 찾기를 중단합니다");
			myform.mid.focus();
			return;
		}
		
		let nickName = prompt("찾으시는 비밀번호의 닉네임을 입력해주세요");
		
		if(nickName.trim() == ""){
			alert("비밀번호 찾기를 중단합니다");
			myform.mid.focus();
			return;
		}

		let memCheck = prompt("추가 인증하실 항목번호를 입력해주세요 1. 전화번호 2. 이메일");
		let memCheckmsg;
		if(memCheck == 1){
			memCheckmsg = prompt("찾으시는 아이디의 전화번호를 입력해주세요");
		}
		else if(memCheck == 2){
			memCheckmsg = prompt("찾으시는 아이디의 이메일를 입력해주세요");
		}
		else {
			alert("유효하지않은 항목입니다.");
			return;
		}
		
		let checkValue = {
				mid,
				nickName,
				memCheck,
				memCheckmsg
		};
		
		$.ajax({
			type : "post",
			url : "${ctp}/artFindPwd.art",
			data : checkValue,
			success : function(res) {
				if(res == 3){
					alert("일치하는 회원정보를 찾을 수 없습니다.");
				}
				else if(res.trim() != ""){
					alert("임시 비밀번호는 "+res+"입니다. 안전한 사용을 위해 비밀번호변경을 꼭 해주시기 바랍니다.");
				}				
				else {
					alert("비밀번호 찾기에 실패하셨습니다.");
				}
			},
			error : function() {
				alert("전송 실패");
			}
		}); 
	}
	
</script>
<jsp:include page="../../include/loginStyle.jsp"></jsp:include>
<body class="text-center" style="height: 750px">
	<div class="container d-flex w-100 h-100 p-3mx-auto  flex-column">
		<jsp:include page="../../include/header.jsp"></jsp:include>
		<form name="Loginform" method="post" action="${ctp}/artLoginOk.art">
			<label>
				<p class="label-txt">ID</p> 
				<input type="text" name="mid" id="mid" style="color: white" placeholder="영문 숫자 최소 5자 최대 19 자 입력해주세요" class="input"  required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			<div class="mt-5"></div>
			<label>
				<p class="label-txt">PASSWORD</p> 
				<input type="password" name="pwd" id="pwd" style="color: white" placeholder="영문 숫자 특수문자를 최소 1개씩 조합해 입력해주세요"  class="input"  required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			<div class="mt-5"></div>
			<div class="mb-5"></div>
			<button type="button" onclick="fCheck()" style="width: 90%;margin-bottom: 3px">SUBMIT</button>
			<div class="mb-1"></div>
			<div>
			<button type="button" onclick="findmid()" style="width: 90%;margin-bottom: 3px">FIND ID</button>
			<div class="mb-1"></div>
			<button type="button" onclick="findpwd()" style="width: 90%;">FORGOT YOUER PASSWORD</button>
			</div>
			<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
			<input type="hidden" name="sw" value="${sw}"/>
		</form>
		<jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
</body>
</html>
