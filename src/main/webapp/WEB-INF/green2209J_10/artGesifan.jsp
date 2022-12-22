<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% String mid = (String)session.getAttribute("sMid"); 
	 pageContext.setAttribute("mid", mid);             %>
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
      if('${res}' == ""){}	
      else alert('${res}');    
      
    	if('${reportmsg}' == ""){}
			else {
				alert('${reportmsg}');	
			}
			
			if('${levelUpMsg}' == ""){}
			else {
				alert('${levelUpMsg}');	
				}
	    } 
	
		function gesifanPartCheck(sw){
			$.ajax({
				type : "post",
				url : "${ctp}/artGesifanPartTr.ge",
				data : {sw:sw},
				async : false,
				success : function(res){
					location.href="${ctp}/artGesifan.ge?sw="+sw;
				},
				error : function(){
					alert("전송 실패");					
				}
			});
		}
	
	
	function inputCheck(){
		let mid = '${mid}';
		
		if(mid == ""){
			let ans = confirm("로그인이 필요한 서비스입니다. \n로그인 화면으로 가시겠습니까?");
			
			if(ans)
				location.href='${ctp}/artLogin.art?sw=1'
			else 
				return; 
		}
		else {
			location.href='${ctp}/artGesifanInput.ge'
		}
		
	}
	
	function sm(){
		pageForm.submit();
	}
	
	
</script>
<body style="height: 1300px">
	<p><br/></p>
	<div class="container">
  <jsp:include page="../../include/header.jsp"></jsp:include>
  <h2 style="margin-top: 70px" ><span id="demo"></span>게 시 판</h2>
 <h3>
 	<button onclick="gesifanPartCheck(0)" class="badge badge-pill badge-secondary">게시판 전체보기</button>
 	<button onclick="gesifanPartCheck(1)" class="badge badge-pill badge-secondary">공지사항</button>
 	<button onclick="gesifanPartCheck(2)" class="badge badge-pill badge-secondary">잡담게시판</button>
 	<button onclick="gesifanPartCheck(3)" class="badge badge-pill badge-secondary">문의게시판</button>
 	<button onclick="gesifanPartCheck(4)" class="badge badge-pill badge-secondary">자유게시판</button>
 </h3>
		<table class="table table-borderless table-hover" style="background-color: #ccc; " > 
			<tr>
				<th style="width: 10%">번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>추천</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${curScrStartNo}</td>
					<td>
					<c:if test="${vo.secretSw == 'on'}"><i class="fa-sharp fa-solid fa-lock"></i></c:if>
					<c:if test="${vo.part == '공지사항'}"><i class="fa-solid fa-meteor fa-lg"></i></c:if>
					<c:if test="${vo.part == '그림 문의'}"><i class="fa-sharp fa-solid fa-user-group"></i></c:if>
					<c:if test="${mid == null}"><a href="javascript:inputCheck()" >${vo.title}</a></c:if>
					<c:if test="${mid != null}"><a href="location.href=${ctp}/artGesifanContent.ge?idx=${vo.idx}&pageSize=${pageSize}&pag=${pag}"><font color="black">${vo.title}</font></a></c:if>
							<c:if test="${vo.hour_diff <= 24 }">
								<img src="${ctp}/images/new.gif">
            	</c:if>
            	<c:if test="${vo.comcnt > 0}">
            		(${vo.comcnt })
            	</c:if>
            	<c:if test="${vo.fSName != null}"><i class="fa-sharp fa-solid fa-image"></i></c:if>
					</td>
					<td>${vo.nickName}</td>
						<td>
           		<c:if test="${vo.day_diff > 0 && vo.hour_diff > 24}">${fn:substring(vo.wDate,0,11)}</c:if>
           		<c:if test="${vo.day_diff > 0 && vo.hour_diff <= 24}">${fn:substring(vo.wDate,0,19)}</c:if>
           		<c:if test="${vo.day_diff < 1}">${fn:substring(vo.wDate,11,19)}</c:if>
           	</td>
					<td>${vo.good}</td>
					<td>${vo.readNum}</td>
				</tr>
				<c:set var="curScrStartNo" value="${curScrStartNo - 1}"></c:set>
			</c:forEach>
			<tr>
				<td colspan="6">
					<h2>
						<button onclick="javascript:inputCheck()" style="margin: 0" class="badge badge-pill badge-secondary"><i class="fa-sharp fa-solid fa-pen-nib"></i>&nbsp;글쓰기</button>
					</h2>
					공지사항 : <i class="fa-solid fa-meteor fa-lg"></i>  비밀글 : <i class="fa-sharp fa-solid fa-lock"></i> 그림 문의 : <i class="fa-sharp fa-solid fa-user-group"></i>
				</td>
			</tr>
		</table>
		<!-- 블록 페이지 시작 -->
		<div class="text-center">
		  <ul class="pagination justify-content-center">
		 		 <li style="margin-right: 5px">
		  <form name="pageForm" method="post" action="${ctp}/artGesifan.ge">
		  	<select onchange="sm()" id="pageSize" name="pageSize">
						<option <c:if test="${pageSize == 5}">selected</c:if>>15</option>
						<option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
						<option <c:if test="${pageSize == 25}">selected</c:if>>25</option>
						<option <c:if test="${pageSize == 30}">selected</c:if>>30</option>
					</select>
				</form>	
				</li>	
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGesifan.ge?pageSize=${pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGesifan.ge?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/artGesifan.ge?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGesifan.ge?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGesifan.ge?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/artGesifan.ge?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
<!-- 블록 페이지 끝 -->
<!-- 검색기 시작 -->
     <form name="Searchform" method="post" action="${ctp}/artGesifanSearCh.ge">
         <table class="table table-borderless text-center" >
             <tr>
                 <td>
                     <select name="cateGory">
                         <option value="title">제목</option>
                         <option value="nickName">글쓴이</option>
                         <option value="content">내용</option>
                         <option value="hashtag">해시태그</option>
                     </select>
                     <input type="text" name="SearChContent"/>
                     <input type="submit" value="검색" class="btn btn-info"/>
                 </td>
             </tr>
         </table>
     </form>
<!-- 검색기 끝 -->
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
	<p><br/></p>
</body>
</html>