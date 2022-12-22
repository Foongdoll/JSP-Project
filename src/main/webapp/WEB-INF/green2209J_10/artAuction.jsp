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
	<jsp:include page="../../include/style.jsp"></jsp:include>
</head>
<script type="text/javascript">
	'use strict'
	
	function workCheck(idx){
		let level = "${sLevel}";
		
		if(level.trim() == ""){
			alert("로그인을 해주셔야 열람 가능합니다.");
			location.href="${ctp}/artLogin.art?sw=2";
			return;
		}
		else {
			location.href="${ctp}/artWorkInfor.ac?idx="+idx;			
		}
	}
	
	function writerModal(){
		
		$('#modalWriter').modal('show');
		
	}
	
	function searchCheck(){
		let searchContent = $("#searchContent").val();
		
		if(searchContent == ""){
			alert("검색하실 내용을 입력해주세요.");
			return;
		}
		else {
			auctionSearchForm.submit();
		}
		
	}
	
</script>
<body style="height: 3300px" >
	<div class="container" >
	<jsp:include page="../../include/header.jsp"></jsp:include>
		<hr/>
		<div class="content" style="height: 100%">
			<div class="row">
				<div class="col text-center menual" style="margin: 0px auto;">
					<ul style="list-style: none;" class="text-center">
						<li class="row" style="display: inline-block; border-right: 1px solid #666; width: 25%"><a href="#">CURRENT</a></li>
						<li class="row" style="display: inline-block; border-right: 1px solid #666; width: 25%"><a href="#">UPCOMING</a></li>
						<li class="row" style="display: inline-block; border-right: 1px solid #666; width: 25%"><a href="#">RESULT</a></li>
						<li class="row" style="display: inline-block; width:25%"><a href="#">SEARCH</a></li>
					</ul>
				</div>
				</div>
				<hr/>
					<div class="row">
						<div class="col title" style="width: 25%; margin-left: 70px; margin-top: 30px; text-align: center">
							제 33회<br/>
							Hong Kong Sale
						</div>
						<div class="col" style="width: 40%; margin-right: 130px; font-size: 0.5em ">
							일 시 : 2022.12.20(화)4:00 PM KST<br/>
							기 간 : 2022.12.06 (화) - 2022.12.20 (화)<br/>
							장 소 : 강남센터<br/>
							장 소 :그랜드 하얏트 홍콩, 살롱<br/>
							<br/>
							※ 기타 자세한 공지사항은 하단 'NOTICE' 참조<br/><br/>
							<input type="button" class="btn" onclick="location.href='${ctp}/artGesifan.ge?sw=1'" style="font-family: Nanum Gothic; width: 100px; background-color: #111; color: white; font-size: 0.5em" value="NOTICE">
							<input type="button" class="btn" style="font-family: Nanum Gothic; width: 100px; background-color: #111; color: white; font-size: 0.5em " value="CATALOGUE">
							</div>
						<div class="col" style="width: 35%;">
							<input type="button" class="btn" onclick="writerModal()" style="font-family: Nanum Gothic; margin-top: 30px; background-color: #111; color: white" value="작가 목록 보기"/>
						</div>
					</div>
					<div class="row inputtag" style="margin-top: 40px">	
					<form name="auctionSearchForm" method="post" action="${ctp}/artAuctionSearch.ac">
						<div class="col text-center" style="font-size: 0.7em;color: #333;margin-bottom: 5px">
							<select name="searchStr" class="btn btn-dark" style="height: 30px;font-size: 0.5em; ">
								<option value="작가명">작가명</option>
								<option value="작품명">작품명</option>
							</select>
							</div>				
							<div class="col text-center " style="font-size: 0.7em;">
							<input type="text" name="searchContent" id="searchContent" style="width:70%; height: 30px;" class="table"/>
							<button type="button" onclick="searchCheck()" class="btn btn-dark">검색</button>
							</div>
						</form>				
					</div>					
					<hr/>
					<div class="content">
						<table class="table table-borderless">
						<c:forEach var="vo" items="${vos}">
							<tr>
								<td>
								<c:if test="${vo.currentPrice == vo.boomnackchalPrice || vo.day_diff > 0}">
									<img  src="${ctp}/data/artAuction/${vo.workFSname}" width="60%" height="100%" />
								</c:if>
								<c:if test="${vo.currentPrice != vo.boomnackchalPrice && vo.day_diff <= 0}">
									<a href="javascript:workCheck(${vo.idx})">
										<img  src="${ctp}/data/artAuction/${vo.workFSname}" width="60%" height="100%" />
									</a>
								</c:if>	
								</td>
								<td>
								<h3>
									<span style="width: 100%;text-align: left;" class="badge badge-secondary">
									<c:if test="${vo.currentPrice == vo.boomnackchalPrice}"><h2>즉시 구매로 인해 낙찰되었습니다.</h2></c:if>
									<c:if test="${vo.currentPrice != vo.boomnackchalPrice}">
										작품명 : ${vo.work}<br/><br/><br/>
										작가명 : ${vo.workWriter}<br/><br/><br/>
										추정가 : ${vo.chuJungPrice}<br/><br/><br/>
										현재가 : <fmt:formatNumber value="${vo.currentPrice}"  pattern="#,###.#"/>원<br/><br/><br/>
										즉시구매가 : <fmt:formatNumber value="${vo.boomnackchalPrice}"  pattern="#,###.#"/>원<br/><br/><br/>
										경매마지막날짜 : ${fn:substring(vo.workLastDate,0,11)} 밤 12시<br/><br/><br/>
										<c:if test="${vo.day_diff < 0}">경매 종료까지 <font color="red"> ${fn:substring(vo.day_diff,1,2)+1}일</font> 남았습니다.</c:if> <br/><br/><br/>&nbsp;
										<c:if test="${vo.day_diff > 0}">경매가<font color="red">종료</font>되었습니다.</c:if> <br/><br/><br/>&nbsp;
										<c:if test="${vo.day_diff == 0}"><font color="red">D-Day</font> 오늘이 마지막 경매일입니다.</c:if> <br/><br/><br/>&nbsp;
										작품소개 : ${vo.workComment}
									</c:if>		
									</span><br/><br/><br/>
								</h3>
								</td>
							</tr>
							</c:forEach> 
						</table>
					</div>
		<!-- 블록 페이지 시작 -->
		<div class="text-center" style="margin-top: 200px">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAuction.ac?pageSize=${pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAuction.ac?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/artAuction.ac?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAuction.ac?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAuction.ac?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artAuction.ac?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
<!-- 블록 페이지 끝 -->
	</div>
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
	<div class="modal fade" id="modalWriter" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="background-color: #333">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">작 가 리 스 트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      	<table class="table table-borderless" style="color:white;text-align: center">
	      	<tr>
	      		<th>번호</th>
	      		<th>작가명</th>
	      		<th>작가소개</th>
	      		<th>출생지</th>
	      	</tr>
	      	<c:forEach var="wvo" items="${wvos}" varStatus="st">
						<tr>
		      		<td>${st.count}</td>
		      		<td>${wvo.writerName }</td>
		      		<td>${wvo.writerInfor }</td>
		      		<td>${wvo.writerHomeTown }</td>
						</tr>
						</c:forEach>
					</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
 </div>
</body>
</html>