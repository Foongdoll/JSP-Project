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
<body>
	<p><br/></p>
	<div class="container">
  <jsp:include page="../../include/header.jsp"></jsp:include>
  <h2>낙 찰 확 정 페 이 지</h2>
  <table class="table table-borderless" style="margin-top: 100px;color: #eee;font-size: 1.5em; text-align: left">
			<tr>
				<td>
					<img  src="${ctp}/data/artAuction/${aucVo.workFSname}" width="100%" height="100%" />
				</td>
				<td>
					<h3>
						<span class="badge badge-fill badge-secondary" style="text-align: left">&nbsp;
							작품명 : ${aucVo.work}<br/><br/><br/>&nbsp;
							작가명 : ${aucVo.workWriter}<br/><br/><br/>&nbsp;
							추정가 : ${aucVo.chuJungPrice}<br/><br/><br/>&nbsp;
							마지막 입찰한 사람 : ${resIpchal}<br/><br/><br/>&nbsp;
							경매마지막날짜 : ${fn:substring(aucVo.workLastDate,0,11)}<br/><br/><br/>&nbsp;
							작품소개 : ${aucVo.workComment}<br/>
						</span>
					</h3>
				</td>
			</tr>
		</table>
		<table class="table table-borderless">
			<tr>
				<td>
					작품
				</td>
			</tr>
			<tr>
				<td>
					주소 
					<input type="text" id="fullAddress" name="fullAddress" value="${vo.address}"/>
				</td>
			</tr>
		</table>
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
	<p><br/></p>
</body>
</html>