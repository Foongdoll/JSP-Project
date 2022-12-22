<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <jsp:include page="../../include/head.jsp"></jsp:include>
<style>
	ul, li{
		list-style: none;
		padding:0px;
		font-size: 1.1em;
	}
	
	.admin_nav{
		background-color: #023e7d;
		color: #fff;
		height: 100vh;
	}
	.title{
		border-bottom: 3px solid rgba(255, 255, 255, 0.5);
	}
</style>
</head>
<body>
	<div class="container-fluid">
	<!-- 어드민 네비바 -->
	<div class="row d-flex flex-row">
		<nav class="col-2 admin_nav">
			<ul>
				<li class="title">
					<h2><a  data-toggle="collapse" href="#a" aria-expanded="false" aria-controls="a"><b>회원 관리</b></a></h2>
						<ul class="collapse" id="a">
							<li>회원 리스트</li>
							<li>탈퇴 신청 회원 관리</li>
							<li>블랙 리스트</li>
						</ul>
				</li>
				<li class="title">
				 	<h2><a data-toggle="collapse" href="#b" aria-expanded="false" aria-controls="b"><b>작품 관리</b></a></h2>
				  <ul class="collapse" id="b">
						<li>작가 리스트</li>
						<li>경매 중인 작품 리스트</li>
						<li>입찰 내역</li>
						<li>신고 내역</li>
						<li>블랙 리스트</li>
					</ul>
				</li>
				<li class="title">
					<h2><a data-toggle="collapse" href="#c" aria-expanded="false" aria-controls="c"><b>경매 관리</b></a></h2>
					<ul class="collapse" id="c">
						<li>경매 전체 통제</li>
						<li>1:1 문의</li>
						<li>신고 내역</li>
						<li>입찰 내역</li>
						<li>환불 관리</li>
					</ul>
				</li>
				<li class="title">
					<h2><a data-toggle="collapse" href="#d" aria-expanded="false" aria-controls="d"><b>게시판 관리</b></a></h2>
					<ul class="collapse" id="d">
						<li>게시글 관리</li>
						<li>공지사항 리스트</li>
						<li>댓글 관리</li>
						<li>신고 내역</li>
					</ul>
				</li>
				<li class="title">
					<h2><a data-toggle="collapse" href="#f" aria-expanded="false" aria-controls="f"><b>이벤트 관리</b></a></h2>
					<ul  class="collapse" id="f">
						<li>현재 진행중인 이벤트 관리</li>
						<li>이벤트 캘린더</li>
					</ul>
				</li>
				<li class="title">
					<h2><a href="#"><b>돌아가기</b></a></h2>
				</li>
			</ul>
		</nav>
    <div class="col-10">
    	<iframe  width="100%" height="100%" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0></iframe>
    </div>
	</div>
</div>

	
</body>
</html>