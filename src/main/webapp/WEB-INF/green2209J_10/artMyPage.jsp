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
<style>
	ul li {
		list-style: none;
	}

</style>
<body>
	<p><br/></p>
	<div class="container">
  <jsp:include page="../../include/header.jsp"></jsp:include>
  <h2>마 이 페 이 지</h2>
  <table class="table table-borderless  btn btn-dark" style="color: white;color:white">
		<tr>
			<td style="width: 20%">
				<h3><a  data-toggle="collapse" href="#a" aria-expanded="false" aria-controls="a"><b>회원 서비스</b></a></h3>
				<ul class="collapse" id="a">
					<li><a href="${ctp}/artMyPage1.my" target="artMyPageI">개인정보변경</a></li>
					<li><a href="${ctp}/artMyPage2.my" target="artMyPageI">비밀번호변경</a></li>
					<li><a href="${ctp}/artMyPage3.my" target="artMyPageI">회원 탈퇴</a></li>
				</ul>	
				<h3><a  data-toggle="collapse" href="#b" aria-expanded="false" aria-controls="b"><b>내가 낙찰한 작품</b></a></h3>
				<ul class="collapse" id="b">
					<li><a href="${ctp}/artMyPage4.my" target="artMyPageI">낙찰한 작품 수령</a></li>
					<li><a href="${ctp}/artMyPage5.my" target="artMyPageI">내가 입찰한 내역</a></li>
					<li><a href="${ctp}/artMyPage6.my" target="artMyPageI">배송 완료 내역</a></li>
				</ul>	
			</td>
			<td style="width: 20%;">
				<p>
					<b>회원님의 정보</b><br/><br/>
					성명 : ${vo.name}<br/><br/>
					닉네임 : ${vo.nickName}<br/><br/> 
					성별 : ${vo.gender}<br/><br/>
					생일 : ${fn:substring(vo.birthday,0,11)}<br/><br/>
					가입일 : ${fn:substring(vo.startDate,0,10)}<br/><br/>
					방문 포인트 : ${vo.point}<br/><br/>
					회원 등급 : 
					<c:if test="${sLevel == 1}">준회원</c:if>
					<c:if test="${sLevel == 2}">정회원</c:if>
					<c:if test="${sLevel == 3}">작가</c:if>					
					<c:if test="${sLevel == 0}">관리자</c:if>					
					<br/><br/>
				</p>
			</td>
			<td style="width: 60%">
				<iframe scr="${ctp}/artMyPage.my" name="artMyPageI" width="100%" height="500px" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0></iframe>
			</td>
		</tr>
  </table>
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
	<p><br/></p>
</body>
</html>