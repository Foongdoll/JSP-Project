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
						<li><a href="${ctp}/myAdmin1.ad" target="artAdminPageI">회원 리스트</a></li>
					</ul>
				</li>
				<li class="title">
				 	<h2><a data-toggle="collapse" href="#b" aria-expanded="false" aria-controls="b"><b>작품 관리</b></a></h2>
				  <ul class="collapse" id="b">
						<li><a href="${ctp}/myAdmin2.ad" target="artAdminPageI">작가 리스트</a></li>
						<li><a href="${ctp}/myAdmin3.ad" target="artAdminPageI">작품 리스트</a></li>
						<li><a href="${ctp}/myAdmin4.ad" target="artAdminPageI">입찰 내역</a></li>
					</ul>
				</li>
				<li class="title">
					<h2><a data-toggle="collapse" href="#d" aria-expanded="false" aria-controls="d"><b>게시판 관리</b></a></h2>
					<ul class="collapse" id="d">
						<li><a href="${ctp}/myAdmin5.ad" target="artAdminPageI">게시글 관리</a></li>
						<li><a href="${ctp}/myAdmin6.ad?sw=1" target="artAdminPageI">공지사항 리스트</a></li>
						<li><a href="${ctp}/myAdmin7.ad?sw=3" target="artAdminPageI">1:1 문의</a></li>
						<li><a href="${ctp}/myAdmin8.ad" target="artAdminPageI">댓글 관리</a></li>
						<li><a href="${ctp}/myAdmin9.ad" target="artAdminPageI">신고 내역</a></li>
					</ul>
				</li>
				<li class="title">
					<h2><a href="${ctp}/Index2.jsp"><b>돌아가기</b></a></h2>
				</li>
			</ul>
		</nav>
    <div class="col-10">
    	<iframe name="artAdminPageI" id="ipchalList" width="100%" height="100%" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0></iframe>
    </div>
	</div>
</div>

	
</body>
</html>