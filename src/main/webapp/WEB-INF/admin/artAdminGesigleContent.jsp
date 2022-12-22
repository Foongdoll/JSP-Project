<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <jsp:include page="../../include/head.jsp"></jsp:include>
</head>
<script type="text/javascript">
	'use strict'
	
		let Pwdres;	
	

		window.onload=function(){
			 if('${res}' == ""){}	
			 else{
         	let pag = ${pag}
        	let pageSize = ${pageSize}
        	let ans = confirm("${res} 비밀번호를 입력하시겠습니까?");
        	
        	if(!ans){
        		location.href="${ctp}/artGesifan.ge?pag="+pag+"&pageSize="+pageSize;
        	}
        	else {
        		let pag = ${pag}
	    			let pageSize = ${pageSize}
	    			let pwdCheckIdx = '${pwdCheckIdx}'
	    			let pwd = prompt("\n비밀번호를 입력해주세요.");
	    			
	    			if(pwd == null){
							alert("취소를 누르셔서 게시판 메인으로 돌아갑니다.");	    				
	        		location.href="${ctp}/myAdmin5.ad?pag="+pag+"&pageSize="+pageSize;
	        		return;
	    			}
	    			
	    			let query = {
    					pwdCheckIdx,
    					pwd
	    			}
	    			
	    			$.ajax({
	    					type : "post",
	    					url : "${ctp}/artSecretPwdCheck.ge",
	    					data : query,
	    					success : function(data){
	    						if(data == "1"){
	    							location.href="${ctp}/artSecretContent.ge?idx="+pwdCheckIdx+"&pag="+pag+"&pageSize="+pageSize;
	    						}
	    						else {
	    							alert("비밀번호가 일치하지않습니다.");
	    							location.href="${ctp}/myAdmin5.ad";
	    						}
	    					},
	    					error : function(){
	    						alert("전송 오류");
    						}
    				});
       		}
    	  }
  	  }
		function gesifanGoodCheck(idx){
			$.ajax({
				type : "post",
				url : "${ctp}/artGesifanGoodCheck.ge",
				data : {idx:idx},
				success : function(res){
					if(res == "1"){
						location.reload();
					}
					else {
						alert("이미 추천을 하셨습니다.");						
					}
				},
				error : function(){
					alert("전송 실패");
				}
			});
		}
		
		function commentCheck(){
			let idx = '${vo.idx}'
			let comment = $("#comment").val();
			let hostIp = $("#hostIp").val();
			let query = {
					idx,
					comment,  
					hostIp
			}
			$.ajax({
				type : "post",
				url : "${ctp}/artGesifanComment.ge",
				data : query,
				success : function(){
					location.reload();
				},
				error : function(){
					alert("전송 실패");					
				}
			});
		} 
		
		function commentUpdateCheck(idx){
			$("#comment"+idx).hide();
			
			let commentUpdate = '<input type="text" id="comUp'+idx+'" name="comUp'+idx+'" class="form-control"/><h4><button type="button" onclick="commentUpdateGo('+idx+')" class="badge badge-fill badge-secondary mt-1">수정</button></h4>';
			
			$("#commentDemo"+idx).html(commentUpdate);
		}

		function commentUpdateGo(idx){
			let comUp = $("#comUp"+idx).val();
			let sw = 1;
			let query = {
					comUp,
					idx,
					sw
			}
			
			$.ajax({
				type : "post",
				url : "${ctp}/artGesifanComment.ge",
				data : query,
				success : function(res) {
					if(res == "1"){
						alert("댓글이 수정되었습니다.");						
						location.reload();
					}
				},
				error : function(){
					alert("전송 실패");
				}
			});
		}
		
		function commentDeleteCheck(idx){
			let sw = 2;
			let query = {
					idx,
					sw
			}	
			
			$.ajax({
				type : "post",
				url : "${ctp}/artGesifanComment.ge",
				data : query,
				success : function(res) {
					if(res == "1"){
						alert("댓글이 삭제되었습니다.");
						location.reload();
					}
				},
				error : function(){
						alert("전송 오류");
				}
			});
			
		}
		
		
</script>
<body>
	<div class="container-fluid">
	<h2 style="margin-top: 70px">게 시 글</h2>
		<table class="table table-borderless" style="background-color: #ccc;">
			<tr>
				<td colspan="4">
					<h3><button type="button" onclick="location.href='${ctp}/myAdmin5.ad?pag=${pag}&pageSize=${pageSize}'" class="badge badge-pill badge-secondary" >게시판관리로가기</button></h3>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<h3 style="font-weight: bolder;">${vo.title}</h3>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<font color="4077E5">글쓴이</font> : ${vo.nickName} <font color="4077E5">추천</font> : ${vo.good } <font color="4077E5">조회수</font> : ${vo.readNum} ${fn:substring(vo.wDate,2,19)}
				</td>
			</tr>
			<tr>
				<td style="height: 400px;font-size: 1.4em" colspan="2">
					${fn:replace(vo.content,newLine,'<br/>')}
				</td>
			</tr>
			<tr>
				<td colspan="4"><c:if test="${vo.fSName == null}">사진없음</c:if>
					<c:if test="${vo.fSName != null}">
						<h3><span class="badge badge-fill badge-secondary">첨부한 이미지</span></h3>
							<img src="${ctp}/data/artGesifan/${vo.fName}">
					</c:if>		
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<h3>
						<button type="button" onclick="javascript:gesifanGoodCheck('${vo.idx}')" class="badge badge-pill badge-secondary ml-2">추천 ${vo.good}</button>
						<font color="4077E5" style="font-size: 0.7em ">${resHashTag}</font>
					</h3>
					<hr/>
					<table class="table">
						<c:forEach var="Comvo" items="${Comvos}" varStatus="st">
							<tr class="text-center">
								<th style="width: 20%">닉네임 : ${Comvo.nickName}</th>
								<th style="width: 60%">
										<span id="comment${Comvo.idx}">${Comvo.comment}</span>
										<span id="commentDemo${Comvo.idx}"></span>
								</th>
								<th style="width: 20%">
									<c:if test="${vo.day_diff > 0 && vo.hour_diff > 24}">${fn:substring(Comvo.wDate,0,11)}</c:if>
    		       		<c:if test="${vo.day_diff > 0 && vo.hour_diff <= 24}">${fn:substring(Comvo.wDate,0,19)}</c:if>
		           		<c:if test="${vo.day_diff < 1}">${fn:substring(Comvo.wDate,11,19)}</c:if>
									<c:if test="${vo.nickName == sNickName || sLevel == 0}">
										<button type="button" onclick="commentUpdateCheck(${Comvo.idx})" class="badge badge-pill badge-secondary" >댓글 수정</button>
										<button type="button" onclick="commentDeleteCheck(${Comvo.idx})" class="badge badge-pill badge-secondary" >삭제</button>
									</c:if>
								</th>
							</tr>
						</c:forEach>
					</table>
				<form name="myform">
					<div class="card mb-2">
								<div class="card-header bg-light">
								        <i class="fa fa-comment fa"></i> REPLY
								</div>
								<div class="card-body">
									<ul class="list-group list-group-flush">
									    <li class="list-group-item">
										<div class="form-inline mb-2">
											<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
										</div>
											<textarea class="form-control" id="comment" rows="3"></textarea>
											<h3>
											<button type="button" class="badge badge-pill badge-secondary" onClick="commentCheck()">댓글 등록</button>
											</h3>
									    </li>
									</ul>
								</div>
							</div>
					<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
				</form>
				</td>
			</tr>
			<tr>
				<td>
					<h3 colspan="2">
						<c:if test="${vo.nickName == sNickName || sLevel == 0}">
							<button type="button" onclick="location.href='${ctp}/artGesifanUpdate.ge?idx=${vo.idx}'" class="badge badge-pill badge-secondary" >게시글 수정</button>
							<button type="button" onclick="location.href='${ctp}/artGesifanDelete.ge?idx=${vo.idx}'" class="badge badge-pill badge-secondary" >삭제</button>
						</c:if>
							<button type="button" onclick="location.href='${ctp}/artGesifanReportGo.ge?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize }'" class="badge badge-pill badge-secondary" >신고하기</button>
					</h3>
				</td>  
				<td>
					<c:if test="${vo.secretSw != 'on'}">
						<h3 style="margin-left: 10%">
						 <c:if test="${preVo.preIdx != 0}">
			          👈 <a href="${ctp}/artGesifanContent.ge?idx=${preVo.preIdx}&pageSize=${pageSize}&pag=${pag}" class="badge badge-pill badge-secondary">이전글 : ${preVo.preTitle}</a><br/>
			        </c:if>
			        <c:if test="${nextVo.nextIdx != 0}">
			          👉 <a href="${ctp}/artGesifanContent.ge?idx=${nextVo.nextIdx}&pageSize=${pageSize}&pag=${pag}" class="badge badge-pill badge-secondary">다음글 : ${nextVo.nextTitle}</a>
			        </c:if>
			       </h3>
					</c:if>	
				</td>
			</tr>
		</table>
	</div>
</body>
</html>