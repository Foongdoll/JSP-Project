<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="../../include/head.jsp"></jsp:include>
<title>Hyun's Auction</title>
</head>
<jsp:include page="../../include/style.jsp"></jsp:include>
<style>
	.inputForm {
      display: inline-block;
      height: 40px;
      padding: 0 10px;
      vertical-align: middle;
      border: 1px solid #dddddd;
      width: 60%;
      color: #999999;
      border-radius: 5px;
    }
    
    .container label {
      display: inline-block;
      padding: 10px 20px;
      margin-top: 2px;
      color: #fff;
      vertical-align: middle;
      background-color: rgba(0, 53, 109, 0.95);
      cursor: pointer;
      height: 40px;
      margin-left: 10px;
      border-radius: 5px;
    }

      
</style>
<script type="text/javascript">
	'use strict'
	
	function workCheck(){
		const regStartPrice = /[^0-9]/g;
		let work = $("#work").val();
		let size1 = $("#workSize1").val();
		let size2 = $("#workSize12").val();
		let startPrice = $("#startPrice").val();
		let workStartDate = $("#workStartDate").val();
		let workLastDate = $("#workLastDate").val();
		let workComment = $("#workComment").val();

		
		if(work == ""){
			alert("작품명을 입력해주세요.");
			$("#work").focus();
			return;
		}
		else if(size1 == "" || size2 == ""){
			alert("작품 크기를 입력해주세요.");
			$("#workSize1").focus();
			return;
		}
		else if(startPrice == ""){
			alert("경매 시작가를 입력해주세요.");
			$("#startPrice").focus();
			return;
		}
		else if(regStartPrice.test(startPrice)){
			alert("경매시작가는 숫자만 입력가능합니다.");
			$("#startPrice").focus();
			return;
		}
		else if(workStartDate == ""){
			alert("경매 시작날짜를 입력해주세요.");
			$("#workStartDate").focus();
			return;
		}
		else if(workLastDate == ""){
			alert("경매 종료날짜를 입력해주세요.");
			$("#workLastDate").focus();
			return;
		}
		else if(workComment == ""){
			alert("작품 설명을 입력해주세요.");
			$("#workComment").focus();
			return;
		}
		else if(wfName == ""){
			alert("작품 사진을 업로드 해주세요.");
			$("#wfName").focus();
			return;
		}
		
			let fName = $("#wfName").val();
			let maxSize = 1024 * 1024 * 20; //업로드 가능한 최대 파일의 용량은 10MByte로 한다.
			
			let fileLength = document.getElementById("wfName").files.length;
			let fileSize = 0;
			
			for(let i = 0; i < fileLength; i++){
				fName = document.getElementById("wfName").files[i].name;
			  let ext = fName.substring(fName.lastIndexOf(".")+1); // 확장자 발췌
				let uExt = ext.toUpperCase();
				fileSize += document.getElementById("wfName").files[i].size;
				
				if(uExt != "JPG" && uExt != "PNG" && uExt != "GIF" && uExt != "MP4")
					alert("업로드 가능한 파일은 'JPG/GIF/PNG 입니다.");
				}
			 	if(maxSize < fileSize){
					alert("업로드 가능한 파일의 최대 용량은 20MByte입니다.");
					return;
			 	}
			 workForm.submit();
	}
</script>
<body>
	<p><br/></p>
	<div class="container">
  <jsp:include page="../../include/header.jsp"></jsp:include>           
  <form name="workForm" method="post" action="${ctp}/artWorkInputOk.ac" enctype="multipart/form-data">
  <h2>그림 등록</h2>
		<table class="table table-hover table-borderless" style="margin-top: 70px">
			<tr>
				<td>
				<span class="badge badge-fill badge-light">	<input type="file" name="wfName" id="wfName"/></span>
					<h3><button type="button" id="sendButton" class="badge badge-fill badge-light">파일 등록 미리보기</button></h3>
					<font color="white">※경매에 등록하실 작품 이미지※</font>
					<h3><span class="badge badge-fill badge-light">작 가 활 동 명 : ${vo.writerName}</span></h3>
					<h3><span class="badge badge-fill badge-light">성 별 : ${vo.writerGender}</span></h3>
					<h3><span class="badge badge-fill badge-light">생 년 : ${fn:substring(vo.writerBirthday,0,4)}</span></h3>
					<h3><span class="badge badge-fill badge-light">출 생 지 : ${vo.writerHomeTown }</span></h3>
					자기 소개
					<textarea rows="4" name="inFor" id="inFor" class="form-control" readonly>${fn:replace(vo.writerInfor,newLine,'<br/>')}</textarea>
				</td>
				<td>
					<h3 ><img src="${ctp}/images/noimage.jpg" class="uploadImage" height="400px"></h3>
				</td>	
			</tr>
			<tr>
				<td>
					<h3><span class="badge badge-fill badge-light">작품명</span></h3>
					<input type="text" name="work" id="work" placeholder="작품명을 입력해주세요" class="form-control"/>
					<h3><span class="badge badge-fill badge-light">작품 크기(cm)</span></h3>
					<input type="text" name="workSize1" id="workSize1" placeholder="가로 길이" class="form-control"/>
					<input type="text" name="workSize2" id="workSize2" placeholder="세로 길이" class="form-control"/>
					<h3><span class="badge badge-fill badge-light">즉시구매가</span></h3>
					<input type="text" name="boomnackchalPrice" id="boomnackchalPrice" placeholder="즉시 구매가를 입력해주세요" class="form-control"/>
				</td>
				<td>
					<h3><span class="badge badge-fill badge-light" style="margin-right: 3px">추정 가격 <button type="button" onclick="cPrice()">추정가격산출</button></span></h3>
					<input type="text" name="chuJungPrice" id="chuJungPrice" readonly class="form-control"/>
					<h3><span class="badge badge-fill badge-light">시작 입찰가</span></h3>
					<input type="text" name="startPrice" id="startPrice" placeholder="0원" class="form-control"/>
					<h3><span class="badge badge-fill badge-light">경매 시작날짜</span></h3>
					<input type="date" name="workStartDate" id="workStartDate"  class="form-control"/>
					<h3><span class="badge badge-fill badge-light">경매 끝나는날짜</span></h3>
					<input type="date" name="workLastDate" id="workLastDate"  class="form-control"/>
					<h3><span class="badge badge-fill badge-light">작품 설명</span></h3>
					<textarea rows="3" name="workComment" id="workComment" placeholder="작품 설명을 입력해주세요" class="form-control" ></textarea>
				</td>
			</tr>     
			<tr>
				<td>
					<h3><button type="button" class="badge badge-fill badge-light" onclick="workCheck()">작품 등록</button></h3>
				</td>
			</tr>
		</table>
		<input type="hidden" name="writerBirthYear" value="${fn:substring(vo.writerBirthday,0,4)}"/>
		<input type="hidden" name="workWriter" value="${vo.writerName}"/>
	</form>	
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
	<p><br/></p>
</body>
<script>
	'use strict'
 
	function cPrice(){
		let nansu = Math.random() * 200000000;
		let resNansu = Math.round(nansu);
		
		let result = resNansu.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$("#chuJungPrice").val(result+"원");
	}
	
	 document.querySelector("#sendButton").addEventListener('click',()=>{
			
						
      let selectFile = document.querySelector("#wfName").files[0];
			
      const file = URL.createObjectURL(selectFile);
      
      document.querySelector(".uploadImage").src = file;

    })
      
</script>
</html>