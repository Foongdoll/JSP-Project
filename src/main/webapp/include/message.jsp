<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<head>
<script>
	'use strict'
	let nickName = "${sNickName}";
	let msg = "${msg}";
	let url = "${url}";
	let reportMsg = "${reportMsg}";
	let levelUpMsg = "${levelUpMsg}";
	
	if(msg == "artJoinOk") msg = "회원가입이 정상처리되었습니다 !"; 
	else if(msg == "artJoinNo") msg = "회원가입이 정상처리되지않았습니다.";
	else if(msg == "artLoginOk") msg = "환영합니다~~ "+nickName+"님 로그인되셨습니다";
	else if(msg == "artLoginNo") msg = "로그인에 실패하셨습니다.";
	else if(msg == "LogoutOk") msg = nickName+"님 로그아웃 되셨습니다.";
	else if(msg == "artGesifanInputOk") msg = "게시글이 등록되었습니다.";
	else if(msg == "artGesifanInputNo") msg = "게시글이 등록되지않았습니다.";
	else if(msg == "artGesifanUpdateOk") msg = "게시글이 수정되었습니다.";
	else if(msg == "artGesifanDeleteOk") msg = "게시글이 삭제되었습니다.";
	else if(msg == "ArtWorkWriterOk") msg = "회원 인증 성공 !";
	else if(msg == "ArtWorkWriterNo") msg = "회원 인증 실패 비밀번호를 확인해주세요.";
	else if(msg == "ArtWorkWriterInputOk") msg = "작가 등록 성공";
	else if(msg == "ArtWorkInputOk") msg = "회원 인증 성공";
	else if(msg == "ArtWorkInputNo") msg = "회원 인증 실패 활동중인 작가명을 확인해주세요.";
	else if(msg == "ArtWorkDBInputOk") msg = "작품이 등록되었습니다.";
	else if(msg == "WorkIpchalOk") msg = "입찰이 완료되었습니다.";
	else if(msg == "ArtmemberInforUpdateOk") msg = "회원 정보 수정이 완료되었습니다.";
	else if(msg == "artLoginDeleteID") msg = "로그인에 실패하셨습니다.";
	else if(msg == "artMemberDeleteOk"){
		msg = "회원 탈퇴에 성공하셨습니다.\n로그아웃되었습니다.";
		top.location.href=url;
	}
	else if(msg == "argGesifanReportOk") msg = "정상적으로 신고 접수되셨습니다.";
	else if(msg == "AuctionNowBuyOk") msg = "정상적으로 즉시 구매되셨습니다.\n마이페이지를 확인해주세요.";
	
	
		alert(msg);
	if(reportMsg != ""){
		alert(reportMsg);		
	}
	
	if(levelUpMsg != ""){
		alert(levelUpMsg);		
	}
	
	location.href= url;
</script>
</head>