<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="../../include/head.jsp"></jsp:include>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>Hyun's Auction</title>
</head>
<jsp:include page="../../include/style.jsp"></jsp:include>
<script>
	'use strict'
	
	function artIpchalCancel(){
		let ans = prompt("정말로 입찰을 취소하시겠습니까?\n취소하시려면 '입찰취소'를 입력해주세요.");
		if(ans != "입찰취소")	{
			alert("잘못 입력하셨습니다.");
			return;
		}	
		else {
			let idx = ${vo.idx};
			
			$.ajax({
				type : "post",
				url : "${ctp}/artIpchalCancel.ac",
				data : {idx:idx},
				success : function(res){
					if(res == "1"){
						alert("입찰취소되셨습니다.");
						location.reload();
					}
				},
				error : function(){
						alert("전송 실패");
				}
			});
			
		}
		
	}
</script>
<body>
	<p><br/></p>
	<div class="container-fluid">
  <jsp:include page="../../include/header.jsp"></jsp:include>
		<table class="table table-borderless" style="margin-top: 100px;color: #eee;font-size: 1.5em; text-align: left">
			<tr>
				<td>
					<img  src="${ctp}/data/artAuction/${vo.workFSname}" width="100%" height="100%" />
				</td>
				<td>
					<h3>
						<span class="badge badge-fill badge-secondary" style="text-align: left;padding: 10px">&nbsp;
							작품명 : ${vo.work}<br/><br/><br/>&nbsp;
							작가명 : ${vo.workWriter}<br/><br/><br/>&nbsp;
							추정가 : ${vo.chuJungPrice}<br/><br/><br/>&nbsp;
							마지막 입찰한 사람 : 
							<c:forEach var="ipchalListvo" begin="0" end="0" items="${vos}" varStatus="st">
								${ipchalListvo.ipchalName}
							</c:forEach>
							<br/><br/><br/>&nbsp;
							경매마지막날짜 : ${fn:substring(vo.workLastDate,0,11)}<br/><br/><br/>&nbsp;
							<c:if test="${vo.day_diff < 0}">경매 종료까지 <font color="red"> ${fn:substring(vo.day_diff,1,2)}일</font> 남았습니다.</c:if> <br/><br/><br/>&nbsp;
							<c:if test="${vo.day_diff == 0}"><font color="red">D-Day</font> 오늘이 마지막 경매일입니다.</c:if> <br/><br/><br/>&nbsp;
							<c:if test="${vo.day_diff < 0}">${fn:substring(vo.day_diff,1,1)}</c:if> <br/><br/><br/>&nbsp;
							작품소개 : ${vo.workComment}<br/>
						</span>
					</h3>
					<h2 style="margin: 0px">
							<%-- <c:if test="${vo.day_diff > 0}">경매가<font color="red">종료</font>되었습니다.</c:if> --%> <br/><br/><br/>&nbsp;
						<%-- <c:if test="${overLastDate <= 0 && cancelSw != '낙찰'}"> --%>
							<button type="button" class="badge badge-pill badge-secondary" onclick="location.href='${ctp}/artWorkIpchalGo.ac?idx=${vo.idx}'" style="height: 47px">입찰하기</button>
						<%-- </c:if> --%>
							<button type="button" onclick="location.href='${ctp}/artAuction.ac'" class="text-light badge badge-pill badge-secondary"  style="height: 47px">경매리스트보러가기</button>
					</h2>
					<h1>
						<span class="badge badge-fill badge-secondary">
							현재가 : ${vo.currentPrice}원<br/>
						</span>
					</h1>
					<p>※${vo.work} 입찰자 리스트※</p>		
        	<table class="table" style="color: white">
	        	<c:forEach var="ipchalListvo" items="${vos}" varStatus="st">
	        		<tr>
	        			<td>
	        				${st.count}
	        			</td>
	        			<td>
	        				입찰자 성명 : ${ipchalListvo.ipchalName}
	        			</td>
	        			<td>
	        				입찰  가격 : <fmt:formatNumber value="${ipchalListvo.ipchalprice}" pattern="#,###.#"/>원
	        			</td>
	        			<td>
	        				진행 상태 : ${ipchalListvo.cancelSw }
	        			</td>
	       			</tr>
	       			</c:forEach>
	       			<c:set var="ipchalFirstName" value=" ${ipchalListvo.ipchalName}"></c:set>
        	</table>
     	<!-- 블록 페이지 시작 -->
				<div class="text-center" style="margin-top: 200px">
				  <ul class="pagination justify-content-center">
				    <c:if test="${pag > 1}">
				      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artWorkInfor.ac?pageSize=${pageSize}&pag=1&workidx=${workidx}">첫페이지</a></li>
				    </c:if>
				    <c:if test="${curBlock > 0}">
				      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artWorkInfor.ac?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}&workidx=${workidx}">이전블록</a></li>
				    </c:if>
				    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
				      <c:if test="${i <= totPage && i == pag}">
				    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/artWorkInfor.ac?pageSize=${pageSize}&pag=${i}&workidx=${workidx}">${i}</a></li>
				    	</c:if>
				      <c:if test="${i <= totPage && i != pag}">
				    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/artWorkInfor.ac?pageSize=${pageSize}&pag=${i}&workidx=${workidx}">${i}</a></li>
				    	</c:if>
				    </c:forEach>
				    <c:if test="${curBlock < lastBlock}">
				      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artWorkInfor.ac?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}&workidx=${workidx}">다음블록</a></li>
				    </c:if>
				    <c:if test="${pag < totPage}">
				      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artWorkInfor.ac?pageSize=${pageSize}&pag=${totPage}&workidx=${workidx}">마지막페이지</a></li>
				    </c:if>
				  </ul>
				</div>
			<!-- 블록 페이지 끝 -->
				</td>
			</tr>
			<tr>
				<td>
				</td>		
			</tr>
		</table>
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
	<p><br/></p>
</body>
</html>