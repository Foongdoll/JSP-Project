<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="../../include/head.jsp"></jsp:include>
<title>Hyun's Auction</title>
</head>
<jsp:include page="../../include/style.jsp"></jsp:include>
<script>
	'use strict'
	
	function ipchalCheck(){
		let ipchalPrice = $("#ipchalPrice").val();
		
		
		if(ipchalPrice.trim() == ""){
			alert("입찰 가격란에 공백이 존재할수없습니다.");
			return;
		}
		else if(ipchalPrice < ${vo.currentPrice}){
			alert("현재가 보다 낮은 금액으로 입찰하실수없습니다.");
			return;
		}
		else if(ipchalPrice >= ${vo.boomnackchalPrice}){
			let boomnackchalPrice = ${vo.boomnackchalPrice};
			let result = boomnackchalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			
			let ans = confirm("해당 작품의 즉시 구매가는 "+result+"원입니다\n즉시 구매하시겠습니까?");
			if(!ans) return;
			else {
				$('#modalIpchal').modal('show');
				return;
			}
		}
		else {
		let resultPrice = ipchalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		
		let ans = confirm("정말 "+resultPrice+"원으로 입찰하시겠습니까?");
		if(!ans) return;
		else IpchalForm.submit(); 
			
		}
	}
	
	function nowBuysm(){
		nowBuyForm.submit();
	}
	
</script>
<body style="height: 2000px">
	<p><br/></p>
	<div class="container">
  <jsp:include page="../../include/header.jsp"></jsp:include>
  <form name="IpchalForm" method="post" action="${ctp}/WorkIpchalOk.ac">
		<table class="table table-borderless" style="color:white; height: 70%">
			<tr>
				<td>
				<h3><span class="badge badge-fill badge-secondary">입 찰 하 실 작 품</span></h3>
					<img src="${ctp}/data/artAuction/${vo.workFSname}" width="100%" height="70%">
				</td>
			</tr>
			<tr>
				<td>
					<h3><span class="badge badge-fill badge-secondary">작 품 명 : ${vo.work}</span></h3>
				</td>
				<td >
				입찰하실 가격
					<input type="number" name="ipchalPrice" id="ipchalPrice" class="form-control" required/>
				</td>
			</tr>
			<tr>
				<td>
					<h3><span class="badge badge-fill badge-secondary">작 가 명 : ${vo.workWriter}</span></h3>
				</td>
			</tr>
			<tr>
				<td>
					<h3><span class="badge badge-fill badge-secondary">입찰 마감일 : ${fn:substring(vo.workLastDate,0,11)}</span></h3>
					※모든 경매는 따로 공지사항이 없을 시 마감일 밤 12시에 마감됩니다.
				</td>
			</tr>
			<tr>
				<td>
					<h3>
						<span class="badge badge-fill badge-secondary">시작 입찰가격: <fmt:formatNumber value="${vo.startPrice}"  pattern="#,###.#"/>원</span>
						<span class="badge badge-fill badge-secondary">현재 입찰가격:
						<c:if test="${currentPrice != ''}"><fmt:formatNumber value="${vo.currentPrice}"  pattern="#,###.#"/></c:if>
						<c:if test="${currentPrice == ''}">0</c:if> 원</span></h3>
						<span class="badge badge-fill badge-secondary">즉시 구매가격: <fmt:formatNumber value="${vo.boomnackchalPrice}"  pattern="#,###.#"/>원</span>
					</h3>
				</td>
				<td>
					<h3>
						<button type="button" onclick="ipchalCheck()" class="badge badge-fill badge-secondary">입찰하기</button>
						<button type="button" onclick="location.href='${ctp}/artWorkInfor.ac?idx=${vo.idx}'" class="badge badge-fill badge-secondary">뒤로가기</button>
					</h3>
				</td>
			</tr>
		</table>
		<input type="hidden" name="workIdx" value="${vo.idx}"/> 
		<input type="hidden" name="memberIdx" value="${Artvo.idx}"/>
		</form>
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
	<p><br/></p>
	
	
	
<div class="modal fade" id="modalIpchal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">즉 시 구 매</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form name="nowBuyForm" method="post" action="${ctp}/artAuctionNowBuy.ac">
      <div class="modal-body">
      	<table class="table table-borderless" style="color:white;">
			<tr>
				<td>
				<h3><span class="badge badge-fill badge-secondary">즉 시 구 매 하 실 작 품</span></h3>
					<img src="${ctp}/data/artAuction/${vo.workFSname}" width="100%">
				</td>
			</tr>
			<tr>
				<td>
					<h3><span class="badge badge-fill badge-secondary">작 품 명 : ${vo.work}</span></h3>
				</td>
			</tr>
			<tr>
				<td>
					<h3><span class="badge badge-fill badge-secondary">작 가 명 : ${vo.workWriter}</span></h3>
				</td>
			</tr>
			<tr>
				<td>
				   즉시 구매 하시겠습니까?<br/>
					 일반적으로 소비자는 자신이 체결한 전자상거래 계약에 대해 그 계약의 내용을 불문하고 그 청약철회 및 계약해제의 기간(통상 7일) 내에는 <br/>
					 청약철회 등을 자유롭게 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제1항).
				</td>
			</tr>
		</table>
		<input type="hidden" name="workIdx" value="${vo.idx}"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" onclick="nowBuysm()" class="btn btn-primary">즉시 구매</button>
      </div>
		</form>
    </div>
  </div>
</div>
	
</body>
</html>