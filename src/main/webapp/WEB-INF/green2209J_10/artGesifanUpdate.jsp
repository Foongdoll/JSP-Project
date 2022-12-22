<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="../../include/head.jsp"></jsp:include>+
<title>Hyun's Auction</title>
</head>
<jsp:include page="../../include/style.jsp"></jsp:include>
<script>
	'use strict'
let cnt = 1;
	let hashArr = new Array();
	
	function addHash(){
		
		let hashTag = $("#hashTag").val();
		hashArr[cnt-1] = hashTag;	
		let addHash ='<span id="hash'+cnt+'"><font color="A4DF8A"> #'+hashTag+'</font><button type="button" name="hash'+cnt+'" onclick="delHash('+cnt+')" class="badge badge-pill badge-secondary">X</button></span> ';
		cnt++;
		$("#hashTag").val("");
		$("#demo").append(addHash);
	}
	// 해쉬 삭제
	function delHash(hCnt){
		$("#hash"+hCnt).remove();
		cnt--;
	}
	// 폼의 모든 정보를 넘기기
	
	function artGesifanUpdateOk(){
		const regPwd = /^[0-9]+$/;
		let totHash = "";
		let gesifanPwd = $("#gesifanPwd").val();
		let title = $("#title").val();
		let content = $("#content").val();
		
		
		if(gesifanPwd.trim() == ""){
			alert("게시글비밀번호는 필수입력사항입니다.");
			myform.gesifanPwd.focus();
			return;
		}
		else if(!regPwd.test(gesifanPwd)){
			alert("게시글 비밀번호는 숫자만 입력가능합니다.");
			myform.gesifanPwd.focus();
			return;
		}
		else if(title == ""){
			alert("게시글의 제목을 입력해주세요.");
			myform.title.focus();
			return;
		}
		else if(content == ""){
			alert("게시글의 내용을 입력해주세요");
			myform.content.focus();
			return;
		}
		if(cnt > 1){
			for(let i = 0; i < cnt-1; i++){
					totHash += hashArr[i]+"/hash/";
				}
			}
			$("#totHash").val(totHash);
			updateform.submit();
		}

		
</script>
<body style="height: 1400px">
	<div class="container">
  <jsp:include page="../../include/header.jsp"></jsp:include>
  	<form name="updateform" method="post" action="${ctp}/artGesifanUpdateOk.ge" enctype="multipart/form-data">
			<table class="table table-borderless" style="background-color: #ccc;margin-top: 70px">
				<tr>
				 	<td>
					 	<h3>
					  	<span class="badge badge-pill badge-secondary"><input type="file" name="fName" id="fName" />파일은 최대 1개만 첨부가능합니다.</span>
					  	<button type="button" onclick="" style="font-weight: bolder;margin-left: 2%" class="badge badge-pill badge-secondary">B</button><br/>
					 		<span class="badge badge-pill badge-secondary mt-2">게시글 비밀번호</span> 
					 		<input type="password" name="gesifanPwd" id="gesifanPwd" value="${vo.gesifanPwd}" class="mt-2" maxlength="10"/>
					 	</h3>	
				  </td>
				</tr>
				<tr>
					<td>
					<h3>
						<select name="part" class="badge badge-pill badge-secondary">
						<option <c:if test="${vo.part == '자유'}">selected</c:if>>자유</option>
						<option <c:if test="${vo.part == '그림 잡담'}">selected</c:if>>그림 잡담</option>
						<option <c:if test="${vo.part == '그림 문의'}">selected</c:if>>그림 문의</option>
						<c:if test="${sLevel == 0}"><option <c:if test="${vo.part == '공지'}">selected</c:if>>공지사항</option></c:if>
					</select>
					</h3>	 
					</td>
				</tr>
				<tr>
					<th><input type="text" name="title" id="title" value="${vo.title}" placeholder="제목을 입력해주세요." class="form-control"/></th>
				</tr>
				<tr>
					<td>
						<textarea rows="10" name="content" id="content" class="form-control" placeholder="내용을 입력해주세요">${vo.content}</textarea>
					</td>
				</tr>
				<tr>
					<td class="table">
					<c:set var="cnt" value="1"></c:set>
					<h4>
						<input type="text" id="hashTag" class="form-control" placeholder="해쉬태그를 다시 입력해주세요"  style="width: 20%"/>
						<button type="button" onclick="addHash()" class="badge badge-pill badge-secondary mt-2">#추가</button>
					</h4>	
						<div class="row">
							<span id="demo"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<h2>
							<button type="button" onclick="artGesifanUpdateOk()" class="badge badge-pill badge-secondary">등록</button>
							<button type="button" onclick="location.href='${ctp}/artGesifan.ge'" class="badge badge-pill badge-secondary">뒤로가기</button>
							<span title="비밀글 여부">🔐</span>
							<input type="checkbox" name="secretSw" data-toggle="toggle" data-onstyle="outline-warning" data-offstyle="outline-light" data-style="border">
						</h2>
					</td>
				</tr>
			</table>
			<input type="hidden" name="idx" value="${vo.idx}"/>
			<input type="hidden" name="totHash" id="totHash"/>
			<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
		</form>
  <jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
</body>
</html>