<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% 
	pageContext.setAttribute("newLine", "\n");
%>
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
    
     	window.onload=function(){
        if('${res}' == ""){
        }	
        else {
    		alert('${res}');    
        }
      } 
    function goodCheck(idx){
        
        $.ajax({
            url : "${ctp}/artGoodplus.gu",
            type : "post",
            data : {idx:idx},
            success : function(){
                location.reload();
            },
            error : function(){
                alert("전송 실패");
            }
        });
    }

    function guestInput(){
    	let nickName = $("#nickName").val(); 
    	let content = $("#content").val();
    	let hostIp = $("#hostIp").val();
    	
    	let query = {
    		nickName,
    		content,
    		hostIp
    	}
        $.ajax({
            url : "${ctp}/artGuestInput.gu",
            type : "post",
            data : query,
            success : function(res){
            	if(res == "1"){
								alert("글이 등록되셨습니다.");            		
                location.reload();
            	}
            	else if(res == "01"){
								alert("별명을 입력해주세요.");            		
            	}
            	else if(res == "02"){
								alert("내용을 입력해주세요.");            		
            	}
            	else {
								alert("별명을 입력해주세요.");            		
            	}
            },
            error : function(){
                alert("전송 실패");
            }
        });
    }
    
   
    function guestDelete(idx){
    	
    	
    	$.ajax({
    		type : "post",
    		url : "${ctp}/guestDelete.gu",
    		data : {idx:idx},
    		success : function(){
    			alert("댓글이 삭제되었습니다.");
    			location.reload();
    		},
    		error : function(){
    			alert("전송 오류");
    		}
    	});
    	
    }	
    
</script>
<body>
    <p><br/></p>
    <div class="container">
  <jsp:include page="../../include/header.jsp"></jsp:include>
    <h2 style="margin-top: 70px">방명록</h2>
    <table class="table table-borderless table-hover" style="background-color: #ccc;">
        <tr>
            <th style="width: 10%">번호</th>
            <th style="width: 10%">별명</th>
            <th style="width: 40%">내용</th>
            <th style="width: 15%">작성일</th>
            <th style="width: 10%">추천</th>
            <c:if test="${sLevel  == 0}">
            <th style="width: 18%">비고</th>
            </c:if>
        </tr>
        <c:forEach var="vo" items="${vos}">
        <tr style="height: 20%">
            <td>${vo.idx}</td>
            <td>${vo.nickName}</td>
            <td>
            	${fn:replace(vo.content,newLine,'<br/>')}
            	<c:if test="${vo.hour_diff <= 24 }">
								<img src="${ctp}/images/new.gif">
            	</c:if>
            </td>
            <td>
            	<c:if test="${vo.day_diff > 0 && vo.hour_diff > 24}">${fn:substring(vo.wDate,0,11)}</c:if>
            	<c:if test="${vo.day_diff > 0 && vo.hour_diff <= 24}">${fn:substring(vo.wDate,0,19)}</c:if>
            	<c:if test="${vo.day_diff < 1}">${fn:substring(vo.wDate,11,19)}</c:if>
            </td>
            <td>
                ${vo.good }
           <a href="javascript:goodCheck(${vo.idx})">   <font color="red"><i class="fa-solid fa-heart"></i></font></a>
            </td>
            <c:if test="${sLevel == 0}">
	            <td>
	            	<button type="button" onclick="guestDelete(${vo.idx})" class="btn btn-dark">삭제</button>
	            </td>
            </c:if>
        </tr>
        </c:forEach>
                    <tr>
	        <form name="commentForm">
                        <td colspan="1" style="width: 15%">
                            별명 : 
                            <input type="text" name="nickName" id="nickName" class="form-control"/>
                        </td>
                        <td colspan="3">
                            내용 :
                            <textarea name="content" id="content" rows="1" class="form-control"></textarea>
                        </td>
                        <td colspan="1"> 
                            <h4><button type="button" onclick="guestInput()" class="badge badge-pill badge-secondary form-control mt-3">글등록</button></h4>
              				  <input type="hidden" id="hostIp" name="hostIp" value="${pageContext.request.remoteAddr}"/>
                        </td>
                    </tr>
            </form>
                </table>
							            <!-- 블록 페이지 시작 -->
							<div class="text-center">
							  <ul class="pagination justify-content-center">
							    <c:if test="${pag > 1}">
							      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGuest.gu?pageSize=${pageSize}&pag=1">첫페이지</a></li>
							    </c:if>
							    <c:if test="${curBlock > 0}">
							      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGuest.gu?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
							    </c:if>
							    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
							      <c:if test="${i <= totPage && i == pag}">
							    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/artGuest.gu?pageSize=${pageSize}&pag=${i}">${i}</a></li>
							    	</c:if>
							      <c:if test="${i <= totPage && i != pag}">
							    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGuest.gu?pageSize=${pageSize}&pag=${i}">${i}</a></li>
							    	</c:if>
							    </c:forEach>
							    <c:if test="${curBlock < lastBlock}">
							      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGuest.gu?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
							    </c:if>
							    <c:if test="${pag < totPage}">
							      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGuest.gu?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
							    </c:if>
							  </ul>
							</div>
							<!-- 블록 페이지 끝 -->
							<!-- 검색기 시작 -->
            <form name="Searchform" method="post" action="${ctp}/artGuestSearCh.gu">
                <table class="table table-borderless text-center" >
                    <tr>
                        <td>
                            <select name="cateGory" id="cateGory">
                                <option value="nickName">글쓴이</option>
                                <option value="content">내용</option>
                            </select>
                            <input type="text" name="SearChContent" id="SearChContent"/>
                            <input type="submit" value="검색" class="btn btn-info"/>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="sw" value="1"/>
            </form>
							<!-- 검색기 끝 -->
  <jsp:include page="../../include/footer.jsp"></jsp:include>
    </div>
    <p><br/></p>
</body>
</html>
