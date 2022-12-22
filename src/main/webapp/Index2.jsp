<%@page import="artAuction.ArtAuctionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String workName = request.getParameter("workName");
	pageContext.setAttribute("workName", workName);
	
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">   
<head>
<jsp:include page="/include/head.jsp"></jsp:include>
<title>Hyun's Auction</title>
</head>
<link href="cover.css" rel="stylesheet">
<jsp:include page="/include/indexStyle.jsp"></jsp:include>
<script>
	'use strict'
	
	
	
	$(document).ready(function(){
		if('${reportMsg}' == ""){}
		else {
			alert('${reportMsg}');	
		}
		
		if('${levelUpMsg}' == ""){}
		else {
			alert('${levelUpMsg}');	
		}
		
		if('${workName}' == ""){}
		else {
			$('#modalIpchal').modal('show');
		}
		
	})
	
	
		setInterval(function() {
			getipchalList();
    	}, 5000);
	
		function getipchalList(){
			$("#ipchalList").attr('src','${ctp}/artCurrentIpchalList.ac');
		}
		
	function nackChalCBf(nSw){
		
		$.ajax({
			type : "post",
			url : "${ctp}/nackChalCheck.ac",
			data : {nSw : nSw},
			success : function (){
			},
			error : function(){
				alert("전송 실패");
			}
		}); 
	}
	
	
	
		
</script>
<body class="text-center">
	<div class="container-fluid d-flex w-100 h-100 p-3mx-auto  flex-column">
		<jsp:include page="include/header.jsp"></jsp:include>
		<main role="main" class="inner cover">
			<div id="demo" class="carousel slide" data-ride="carousel">

				<!-- 인디케이터 -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- 스라이드 쇼  -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<video muted autoplay loop>
							<source src="video/Painting.mp4" type="video/mp4">
						</video>
						<img src="">
						<div class="carousel-caption d-none d-md-block">
							<h5>
								<a href="#"><b>#자유로운 작품보러가기</b></a>
							</h5>
						</div>
					</div>
					<div class="carousel-item">
						<video muted autoplay loop>
							<source src="video/Space.mp4" type="video/mp4">
						</video>
						<div class="carousel-caption d-none d-md-block">
							<h5>
								<a href="#"><b>#작업실 작품보러가기</b></a>
							</h5>
						</div>
					</div>
					<div class="carousel-item">
						<video muted autoplay loop>
							<source src="video/Printing.mp4" type="video/mp4">
						</video>
						<div class="carousel-caption d-none d-md-block">
							<h5>
								<a href="#"><b>#스캐치 작품보러가기</b></a>
							</h5>
						</div>
					</div>
				</div>

				<!-- 왼쪽 오른쪽 제어 -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
			<!--  --------------------------------------------------------------------------- -->
				<div class="w3-panel w3-light-grey" style="height: 500px;">
	  			<span style="font-size:100px;line-height:0.6em">✂</span>
	  			<h2>입 찰 현 황</h2>
	 				<i class="w3-xlarge"> 
						<iframe src="${ctp}/artCurrentIpchalList.ac" id="ipchalList" width="100%" height="350px" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>   				
	 				</i>
				</div>
					
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="carousel-caption d-none d-md-block">
							<div>
								<h2>
									<a href="${ctp}/artGesifan.ge?sw=1"><b>NOTICE</b></a>
								</h2>
							</div>
						</div>
						<a href="#">
							<img src="images/1.gif" width="40%" height="10%">
						</a>
					</div>
				</div>
				
			</main>
		<jsp:include page="/include/footer.jsp"></jsp:include>
	</div>
	<div class="modal fade" id="modalIpchal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">축하합니다~~~~~~</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<table class="table table-borderless" style="color:white;">
					<tr>
						<td>
							축하드립니다. 작품명 <h4><b>${workName}</b></h4>의 치열한 경매 속 끝끝내 낙찰되셨습니다~~<br/>
						</td>
					</tr>
					<tr>
						<td>
							닫기를 누르시면 메인에서는 더 이상 창이 뜨지않습니다. <br/> 마이페이지에서 어떠한 방법으로 수령하실지 선택해주세요.
						</td>
					</tr>
				</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="nackChalCBf(1)" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>