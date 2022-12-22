<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctp" value="${pageContext.request.contextPath}" />
<style>
	.modal-content{
		background-color: #333;
	}
</style>
<script type="text/javascript">
	'use strict'
	
	function sm(){
		myform.submit();
	}
	function sm2(){
		myForm.submit();
	}
	
	function notImpl() {
		alert("준비중인 서비스입니다.");		
	}
	
	
</script>
<header class="masthead" style="width: 100%">
	<div class="inner text-center">
		<h1>
			<a href="${ctp}/"style="text-decoration: none; margin-left: 30px; margin-top: 20px">
				Green Auction
			</a>
		</h1>
		<div>
		<c:if test="${sLevel == null}">
			<h5 class="nav nav-masthead">
				<a href="${ctp}/artLogin.art"
					style="text-decoration: none; margin-left: 20px;">Login</a>
			</h5>
		</c:if>
		<c:if test="${sLevel != null}">
			<h5 class="nav nav-masthead">
				<a href="${ctp}/artLogout.art"
					style="text-decoration: none; margin-left: 20px;">Logout</a>
			</h5>
		</c:if>
		</div>
		<div class="ml-5">
			<h5 class="nav nav-masthead">
				<a href="${ctp}/artJoin.art"
					style="text-decoration: none; margin-left: 20px;">Sign Up</a>
			</h5>
		</div>
		<c:if test="${sLevel == 0}">
		<div class="ml-5">
			<h5 class="nav nav-masthead">
				<a href="${ctp}/artAdmin.ad"
					style="text-decoration: none; margin-left: 20px;">Admin</a>
			</h5>
		</div>
		</c:if>
		<c:if test="${sLevel >= 0 || sLevel < 4}">
		<div class="ml-5">
			<h5 class="nav nav-masthead">
				<a href="${ctp}/artMyPage.my"
					style="text-decoration: none; margin-left: 20px;">MyPage</a>
			</h5>
		</div>
		</c:if>
		<nav class="nav justify-content-start">
			<a class="nav-link active" href="${ctp}/">
			<i class="fa fa-home fa-2x"></i></a>
			<div class="dropdown">
				<button class="nav-link active btn dropdown-toggle ml-3 text-light"
					style="height: 49px" data-toggle="dropdown">Auction</button>
				<div class="dropdown-menu ">
					<a class="dropdown-item" href="${ctp}/artAuction.ac">경매장</a> 
					<a class="dropdown-item" href="javascript:notImpl()">경매결과</a>
					<a class="dropdown-item" href="javascript:notImpl()">경매안내</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="nav-link active btn dropdown-toggle ml-3 text-light"
					style="height: 49px" data-toggle="dropdown">Member</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${ctp}/artGesifan.ge">자유 게시판</a> 
					<a class="dropdown-item" href="${ctp}/artGuest.gu">방명록</a>
					<a class="dropdown-item" href="javascript:notImpl()">자유 시장</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="nav-link active btn dropdown-toggle ml-3 text-light"
					style="height: 49px" data-toggle="dropdown">About</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${ctp}/artGesifan.ge?sw=1">공지사항</a> 
					<a class="dropdown-item"href="javascript:notImpl()">채용공고</a> 
					<a class="dropdown-item" href="javascript:notImpl()">위치안내</a> 
					<a class="dropdown-item" href="javascript:notImpl()">FAQ</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="nav-link active btn ml-3 text-light"
					style="height: 49px" onclick="location.href='${ctp}/artGuest.gu'" >Guest</button>
			</div>
			<c:if test="${sLevel >= 0 || sLevel < 4}">
				<c:if test="${sLevel == 3}">
				<div class="dropdown">
					<button class="nav-link active btn ml-3 text-light" style="height: 49px" data-toggle="modal" data-target="#myModal2"><i class="fa-sharp fa-solid fa-palette"></i>&nbsp;작품 등록하기</button>
				</div>
				</c:if>
				<c:if test="${sLevel != 3}">
				<div class="dropdown">
				 	<button type="button" class="nav-link active btn ml-3 text-light" style="height: 47px" data-toggle="modal" data-target="#myModal">
				 		작가 등록하기
				  </button>
				</div>
				</c:if>
			</c:if>
		</nav>
	</div>
	<!-- Button to Open the Modal -->
 

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">작가 등록 회원 인증</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body"><p>※인증 완료 시 작가 등록하기 화면으로 넘어갑니다.※</p>		
        	<form name="myform" method="post" action="${ctp}/artWorkWriterInput.ac">
        	<h3>비밀번호</h3>
        	<input type="password" name="pwd" class="form-control" required/>
        	<h3><button type="button" onclick="sm()" class="badge badge-fill badge-secondary">인 증</button></h3>
        	</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="badge badge-fill badge-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
	<!-- Button to Open the Modal -->
 

  <!-- The Modal -->
  <div class="modal" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">작품 등록 회원 인증</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body"><p>※인증 완료 시 작품 등록하기 화면으로 넘어갑니다.※</p>		
        	<form name="myForm" method="post" action="${ctp}/artWorkInput.ac">
        	<h3>작 가 활 동 명</h3>
        	<input type="text" name="writerNmae" class="form-control" required/>
        	<h3><button onclick="sm()2" class="badge badge-fill badge-secondary">인 증</button></h3>
        	</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="badge badge-fill badge-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</header>