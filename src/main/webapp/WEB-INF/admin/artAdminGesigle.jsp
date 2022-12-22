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
<script type="text/javascript">
	'use strict'
	
		function gesifanPartCheck(sw){
			$.ajax({
				type : "post",
				url : "${ctp}/artGesifanPartTr.ge",
				data : {sw:sw},
				async : false,
				success : function(res){
					location.href="${ctp}/myAdmin5.ad?sw="+sw;
				},
				error : function(){
					alert("전송 실패");					
				}
			});
		}
	
	
	function sm(){
		pageForm.submit();
	}
</script>
<body>
	<p><br/></p>
	<div class="container-fluid">
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
					<a href="location.href=${ctp}/artAdminGesigleContent.ad?idx=${vo.idx}&pageSize=${pageSize}&pag=${pag}"><font color="black">${vo.title}</font></a>
							<c:if test="${vo.hour_diff <= 24 }">
								<img src="${ctp}/images/new.gif">
            	</c:if>
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
					공지사항 : <i class="fa-solid fa-meteor fa-lg"></i>  비밀글 : <i class="fa-sharp fa-solid fa-lock"></i> 그림 문의 : <i class="fa-sharp fa-solid fa-user-group"></i>
				</td>
			</tr>
		</table>
		<!-- 블록 페이지 시작 -->
		<div class="text-center">
		  <ul class="pagination justify-content-center">
		 		 <li style="margin-right: 5px">
		  <form name="pageForm" method="post" action="${ctp}/myAdmin5.ad">
		  	<select onchange="sm()" id="pageSize" name="pageSize">
						<option <c:if test="${pageSize == 5}">selected</c:if>>15</option>
						<option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
						<option <c:if test="${pageSize == 25}">selected</c:if>>25</option>
						<option <c:if test="${pageSize == 30}">selected</c:if>>30</option>
					</select>
				</form>	
				</li>	
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin5.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin5.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/myAdmin5.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin5.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin5.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/myAdmin5.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
<!-- 블록 페이지 끝 -->
<!-- 검색기 시작 -->
     <form name="Searchform" method="post" action="${ctp}/artAdminGesigleSearch.ad">
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
	</div>
	<p><br/></p>
</body>
</html>