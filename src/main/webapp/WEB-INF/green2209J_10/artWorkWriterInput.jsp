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
	
	function writerCheck(){
		let homeTown = $("#homeTown").val(); 
		let inFor = $("#inFor").val();
		
		if(homeTown == ""){
			alert("출생지를 적어주세요.");
			$("#homeTown").focus();
			return;
		}
		else if(inFor == ""){
			alert("자기소개를 적어주세요.");
			$("#inFor").focus();
			return;
		}
		
		let fName = $("#wfName").val();
		if(fName != ""){
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
		}
		
		
		writerForm.submit();
	}
</script>
<body>
	<p><br/></p>
	<div class="container">
  <jsp:include page="../../include/header.jsp"></jsp:include>
  <form name="writerForm" method="post" action="${ctp}/artWorkWriterInputOk.ac" enctype="multipart/form-data">
		<table class="table table-hover table-borderless" style="margin-top: 70px">
			<tr>
				<td>
				<p><font color="white">첨부 파일 미리보기</font></p>
					<input type="file" name="wfName" id="wfName" onchange="readURL(this);">
					<img id="preview" width="70%" height="250px" src="${ctp}/images/noimage.jpg" />
				</td>
				<td style="color: white;margin-top: 5px">
					현재 작가 등록 중인 회원님의 정보
					<p>성명 : ${vo.name}</p>
					<p>닉네임 : ${vo.nickName} </p>
					<p>성별 : ${vo.gender}</p>
					<p>가입일 : ${fn:substring(vo.startDate,0,10)}</p>
					<p>방문 포인트 : ${vo.point}</p>
				</td>
			</tr>
			<tr style="height: 100%">
				<td style="padding: 20px">
					<h3><span class="badge badge-fill badge-light">작 가 활 동 명</span></h3>
					<p><font color="white">※작가 활동명은 닉네임과 같게 쓰셔야합니다.※<br/> ※다른 프로필 내용은 공개 비공개를 선택하실 수 있으니 걱정안하셔도 됩니다.※</font></p>
					<font color="white" style="margin-left: 3px">닉네임 : <input type="radio" name="writerName" value="${vo.nickName}"/></font>
					<h3><span class="badge badge-fill badge-light">성 별</span></h3>
					<input type="text" name="gender" class="inputForm"  value="${vo.gender}" style="margin-bottom: 2px" readonly><br/>
					<h3><span class="badge badge-fill badge-light">개인 정보 공개 여부</span></h3>
					<font color="white">공개 : <input type="radio"  name="writeropenSw" value="공개" checked/></font>
					<font color="white" style="margin-left: 3px">비공개 : <input type="radio" name="writeropenSw" value="비공개"/></font>
				</td>
				<td style="padding: 20px">
					<h3><span class="badge badge-fill badge-light">생 일</span></h3>
					<p><font color="white">※가급적 본인 명의 아이디로 작가 등록을 부탁드립니다.※<br/>※혹시라도 수정해야한다면 고객센터에 1:1문의해주세요※</font></p>
					<input type="text" name="birthDay" class="inputForm" value="${fn:substring(vo.birthday,0,10)}"  style="margin-bottom: 2px" readonly><br/>
					<h3><span class="badge badge-fill badge-light">출 생 지</span></h3>
					<p><font color="white">※출생지는 시 까지만 입력해주세요.※<br/>※혹시 외국 출생이시라면 나라만 적어주세요※</font></p>
					<input type="text" class="inputForm" name="homeTown" id="homeTown" placeholder="예)충청북도 청주시" style="margin-bottom: 2px"><br/>
				</td>	
			</tr>  
			<tr>
				<td colspan="2" style="width: 80%">
					<h3><span class="badge badge-fill badge-light">자기소개</span></h3>
					<textarea rows="4" name="inFor" id="inFor" placeholder="자기소개를 입력해주세요" class="form-control"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<h3><button type="button" class="badge badge-fill badge-light" onclick="writerCheck()">작가 등록</button></h3>
				</td>				
			</tr>
		</table>
	</form>	
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
	<p><br/></p>
</body>
<script>
	'use strict'
 
	function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}
      
</script>
</html>