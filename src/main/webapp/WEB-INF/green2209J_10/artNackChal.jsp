<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <jsp:include page="../../include/head.jsp"></jsp:include>
	<jsp:include page="../../include/style.jsp"></jsp:include>
</head>
<script>
	'use strict'
	
	function nackChalCancelCheck(){
		let ans = confirm("정말 낙찰 취소를 원하시나요?");
		
		if(!ans) return;
				
		$('#modalIpchal').modal('show');
		
	}
	
	function artPickUp(work,sw){
		if(sw == 1){
			$("#work1").val(work);
			$('#modalPickUp').modal('show');
		}
		else {
			$("#work2").val(work);
			$('#modalPickUp2').modal('show');
		}
	}
	
	function workJudgeCheck(){
		let ans = confirm("심사 접수하시겠습니까?");
		if(!ans) return;
		
		let workJudgeContent = $("#workJudge").val();
		let work = '${vo.work}'
		let ipChalPrice = '${vo.ipchalPrice}'
		
		let query = {
				workJudgeContent, 
				work,
			  ipChalPrice
		}
		
		$.ajax({
			type : "post",
			url : "${ctp}/artWorkJudge.my",
			data : query,
			success : function(){
				alert("심사 접수가 정상 처리되었습니다. 최대 일주일까지 걸릴수있으니 연락을 기다려주세요.");
				location.reload();
			},
			error : function(){
				alert("전송 실패");
			}
		});
		
	}
	
	function cancelSwCheck(sw){
		let cardNum = $("#cardNum").val();
		let work = "";
		if(sw == 1){
			work = $("#work1").val();
		}
		else {
			work = $("#work2").val();
		}
		let query = {
				cardNum,
				sw,
				work
		}
			
			$.ajax({
				type : "post",
				url : "${ctp}/artCancelSwUpdate.ac",
				data : query,
				success : function(res){
					alert(res);
					location.reload();
				},
				error : function(){
					alert("전송 오류");
				}
			});
	}
	
	function nackchalsuccess(wIdx,work) {
		let ans = confirm("정말로 배송 완료 처리하시겠습니까?");
		
		if(!ans) return;
		
		let query = {
				work,
				wIdx
		}
		$.ajax({
			type : "post",
			url : "${ctp}/artWorkSuccess.ac",
			data : query,
			success : function(){
				location.reload();
				alert("배송 완료 처리 되셨습니다.");
			},
			error : function(){
				alert("전송 오류");
			}
			
		});
		
	}
	
</script>
<body style="height: 100%">
	<div class="container">
	<c:if test="${fn:length(vos) == 0}"><h2>입찰하신 작품이 없습니다.</h2></c:if>
	<c:if test="${fn:length(vos) != 0}">
	<c:forEach var="vo" items="${vos}"> 
	<c:if test="${vo.work == null}"><h3>낙찰되신 작품이 없습니다.</h3></c:if>
	<c:if test="${vo.cancelSw != '낙찰' }">
		<h3>현재 낙찰되신 <font color="blue">${vo.work}</font>는 ${vo.cancelSw} 처리되어있습니다.</h3>
		<c:if test="${vo.cancelSw == '배달수령' || vo.cancelSw == '직접수령'}">
		<button type="button" onclick="nackchalsuccess('${vo.idx}','${vo.work}')" class="btn btn-dark">배송 완료</button>
		<p>배송 완료 버튼은 작품을 수령하시고 눌러주세요 !</p>
		</c:if>
		<c:if test="${vo.cancelSw == '배송 완료'}">
		<p>저희 옥션을 이용해주셔서 감사합니다. 또 다른 멋진 작품의 낙찰에 성공하시길 바랍니다!!</p>
		</c:if>
		</c:if>
	<c:if test="${vo.cancelSw == '낙찰'}">
		<table class="table table-borderless" style="color: white">
			<tr>
				<td>
					<p>※낙찰되신 상품을 수령하실 주소는 정확하게 입력해주세요※</p>
				</td>
			</tr>
			<tr>
				<td>
					<p>
						작품명 	 : ${vo.work }     <br/>
						작가명 	 : ${vo.workWriter }     <br/>  
						작품크기 : ${vo.workSize } cm   <br/>
						낙찰금액 : <fmt:formatNumber value="${vo.ipchalPrice}"  pattern="#,###.#"/>원 <br/>
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<p>
					<br/>수령방법을 선택해주세요.<br/>혹시라도 낙찰취소 심사를 원하시면 '낙찰 취소'버튼을 눌러주세요.</p>
					<button type="button" onclick="nackChalCancelCheck()" class="btn btn-dark" >낙 찰 취 소</button>
				</td>
			</tr>
			<tr>
				<td>
					<p>상 품 수 령 방 법</p>
					<ul style="list-style: none">
						<li><button onclick="artPickUp('${vo.work}',1)" class="btn btn-dark mb-4">직접수령</button></li>
						<li><button onclick="artPickUp('${vo.work}',2)" class="btn btn-dark">택배</button></li>
					</ul>
				</td>
			</tr>
		</table>
 </c:if>
 <hr/>
 </c:forEach>
 </c:if>
	</div>
	
	 <div class="modal fade" id="modalIpchal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="background-color: #333">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">낙 찰 취 소</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<form name="nackChalCancelForm"> 
	      				<h4>※낙찰 취소 심사를 위한 사유가 정당하지 않을 경우 취소가 불가능할수있습니다.※<br/>※사유의 내용에 허위사실이 포함되어있는게 확인된다면 심사는 즉시 중단되며 낙찰처리됩니다.※</h4>
		      	<table class="table table-borderless" style="color:white;">
							<tr>
								<td>
									<textarea rows="3" name="workJudge" id="workJudge" class="form-control"></textarea>
								</td>
							</tr>
						</table>
					</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" onclick="workJudgeCheck()" class="btn btn-primary">심사 접수</button>
	      </div>
	    </div>      
	  </div>
  </div>
  
  
	 <div class="modal fade" id="modalPickUp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="background-color: #333">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">직 접 수 령</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	   	<form name="nackChalCancelForm"> 
	      <div class="modal-body">
	      				<h4>※직접 수령 주소 : 서울특별시 종로구 평창31길 11 (평창동 465-10)※</h4>
		      	<table class="table table-borderless" style="color:white;">
							<tr>
								<td>
									<p>위 주소로 직접 오셔서 간단한 본인인증 절차에 응해주시면 바로 픽업가능하십니다.</p>
								</td>
							</tr>
							<tr>
								<td>
									카드 번호 : 
									<input type="text" id="cardNum" name="cardNum" class="form-control"/>
								</td>
							</tr>
						</table>
						<input type="hidden" name="work" id="work1"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" onclick="cancelSwCheck(1)" class="btn btn-primary">직 접 수 령</button>
	      </div>
 			</form>
	    </div>
	  </div>
  </div>
  
	 <div class="modal fade" id="modalPickUp2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="background-color: #333">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">택 배 수 령</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	    <form name="nackChalCancelForm"> 
	      <div class="modal-body">
		      	<table class="table table-borderless" style="color:white;">
			      	<tr>
								<td>
									<p>택배 배송은 3~5일 소요됩니다. 문의 사항이있으신분은 문의게시판에 문의주시기 바랍니다.</p>
								</td>
							</tr>
							<tr>
								<td>
									카드 번호 : 
									<input type="text" id="cardNum" name="cardNum" class="form-control"/>
								</td>
							</tr>
						</table>
						<input type="hidden" name="work" id="work2"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" onclick="cancelSwCheck(2)" class="btn btn-primary">택 배 수 령</button>
	      </div>
			</form>
	    </div>
	  </div>
  </div>
  
	 
</body>
</html>