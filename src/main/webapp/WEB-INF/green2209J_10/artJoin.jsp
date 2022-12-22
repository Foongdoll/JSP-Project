<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../include/head.jsp"></jsp:include>
<jsp:include page="../../include/style.jsp"></jsp:include>
<jsp:include page="../../include/joinStyle.jsp"></jsp:include>
</head>
<script>
	'use strict'
	
		let midCheck;
		let nickCheck;
		
		function midnickCheck(no){
			
			if(no == 1){ // 아이디 중복 체크
				let mid = $("#mid").val();
			
				if(mid.trim() == ""){
					alert("아이디를 입력해주세요.");
					$("#mid").focus();
					return;
				}
			
				$.ajax({
					type : "post",
					url : "${ctp}/artMidNickCheck.art",
					data : {mid: mid},
					success : function(res){
						if(res != 1){
							midCheck = 1;
							alert(mid+"은(는) 사용 가능한 아이디입니다.");
							$("#mid").attr("readonly",true);
						}
						else {
							alert(mid+"은(는) 이미 사용중인 아이디입니다.");
						}
						
					},
					error : function() {
							alert("전송 실패");
					}
				});
				return;
			}
			else if(no == 2){ // 닉네임 중복 체크
				let nickName = $("#nickName").val();
			
				if(nickName.trim() == ""){
					alert("닉네임을 입력해주세요.");
					myform.nickName.focus();
					return;
				}
				
				$.ajax({
					type : "post",
					url : "${ctp}/artMidNickCheck.art",
					data : {nickName: nickName},
					success : function(res){
						if(res != 1){
							nickCheck = 1;
							alert(nickName+"은(는) 사용 가능한 닉네임입니다.");
							$("#nickName").attr("readonly",true);
						}
						else {
							alert(nickName+"은(는) 이미 사용중인 닉네임입니다.");
						}
					},
					error : function() {
							alert("전송 실패");
					}
				});
			} 
		}
	
	function fCheck() {
		const regmid = /^[a-z]+[a-z0-9]{5,19}$/g;  // 영문 숫자 최소 5자 최대 19 자 
		const regpwd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; //최소 8자 16자 영어 숫자 특수문자 최소 1개씩
		const regname = /^[가-힣a-zA-Z]{2,20}/; // 한글 영어 소문자 대문자
		const regbirthday = /^[0-9]{4}-[0-9]{2}-[0-9]{2}/;
		const regnickName = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/; // 2자 이상 16자 이하, 영어 또는 숫자 또는 한글로 구성
		const regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;// 숫자 영어 @ 숫자 영어 . 영어 
		const regtel = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; // 01? 가운데 3자리 4자리 마지막 4자리 전화 번호 형식
				
		
		let mid = document.getElementById("mid").value;
		let pwd = document.getElementById("pwd").value;
		let name = document.getElementById("name").value;
		let nickname = document.getElementById("nickName").value;
		let email = document.getElementById("email").value;
		let tel = document.getElementById("tel").value;
		let birthday = document.getElementById("birthday").value;
		let address1 = document.getElementById("sample6_address").value;
		let address2 = document.getElementById("sample6_detailAddress").value;
		let aggrement1 = $("#aggrement1").is(":checked");
		
		
		if(mid.trim() == "" || !regmid.test(mid)){
			alert("아이디에는 최소 5자이상 영문과 숫자를 최소 1개씩 넣어주세요");
			$("#mid").focus();
			return false;
		}
		else if(pwd.trim() == "" || !regpwd.test(pwd)){
			alert("비밀번호에는 최소 8자 이상 하나이상의 대/소문자 숫자 및 특수문자를 넣어주세요");
			$("#pwd").focus();
			return false;
		}
		else if(name.trim() == "" || !regname.test(name)){
			alert("이름은 최소 2자 한글 또는 영어 소/대문자만 입력가능합니다.");
			$("#name").focus();
			return false;
		}
		else if(nickname.trim() == "" || !regnickName.test(nickname)){
			alert("별명에 공백이있거나 20자가 넘어가면 안됩니다.");
			$("#nickName").focus();
			return false;
		}
		else if(email.trim() == "" || !regemail.test(email)){
			alert("올바르지않는 이메일 형식입니다.");
			$("#email").focus();
			return false;
		}
		else if(birthday.trim() == "" || !regbirthday.test(birthday)){
			alert("올바르지않는 생일 형식입니다.");
			$("#birthday").focus();
			return false;
		}
		else if(tel.trim() == "" || !regtel.test(tel)){
			alert("올바르지않는 전화번호 형식입니다.");
			$("#tel").focus();
			return false;
		}		
		else if(!aggrement1){
			alert("개인정보 동의는 필수입니다");
			return false;
		}
		else if(midCheck != 1){
			alert("아이디 중복 체크를 해주세요");
			myform.idCheck.focus();
			return;
		}
		else if(nickCheck != 1){
			alert("닉네임 중복 체크를 해주세요");
			myform.nickCheck.focus();
			return;
		}
		else {
			joinForm.submit();
		}
		
	}
	
	
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
	

	
	
</script>
<jsp:include page="../../include/joinStyle.jsp"></jsp:include>
<body class="text-center" style="height: 2100px">
	<div class="container d-flex w-100 h-100 p-3mx-auto  flex-column">
		<jsp:include page="../../include/header.jsp"></jsp:include>
		<div class="containe text-center">
			<form name="joinForm" method="post" action="${ctp}/artJoinOk.art">
				<label class="form-group">
					<p class="label-txt ">ID</p> <br/>
					<input type="button" id="idCheck" value="아이디 중복 체크" onclick="midnickCheck(1)" class="btn btn-dark" style="width: 100px;font-size: 0.4em;"/>
					<input type="text" name="mid" id="mid" placeholder="최소 5 글자 이상 영문과 숫자를 최소 1개씩 입력해주세요"  class="input" maxlength="19" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group">
					<p class="label-txt">PASSWORD</p> <br/>
					<input type="password" name="pwd" id="pwd" placeholder="최소 8자 영어 숫자 특수문자를 혼합해주세요" class="input" maxlength="20" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group">
					<p class="label-txt">NAME</p> <br/>
					<input type="text" name="name" id="name" placeholder="최소 2 글자 이상 한글과 영어 대/소 문자만 입력해주세요" class="input" maxlength="20" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group">
					<p class="label-txt">NICKNAME</p> <br/>
					<input type="button" id="nickCheck" value="닉네임 중복 체크" onclick="midnickCheck(2)" class="btn btn-dark" style="width: 100px;font-size: 0.4em;"/>
					<input type="text" name="nickName" id="nickName" placeholder="최소 2 글자 이상 한글과 영어 대/소 문자만 입력해주세요" class="input" maxlength="16" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group">
					<p class="label-txt">GENDER</p>
					<div style="color: rgb(120, 120, 120);">MALE</div> <input
					type="radio" name="gender" id="gender1" class="input" value="남자" checked>
					<div class="line-box">
						<div class="line"></div>
					</div><br/>
					<div style="color: rgb(120, 120, 120);">FEMALE</div> <input
					type="radio" name="gender" id="gender2" class="input" value="여자">
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group">
					<p class="label-txt">EMAIL</p> <br/>
					<input type="text" name="email" id="email" placeholder="일반적인 이메일 형식을 입력해주세요" class="input" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group">
					<p class="label-txt">PHONE</p> <br/>
					<input type="text" name="tel" id="tel" placeholder="전화번호는 사이에 '-'을 입력해주세요" class="input" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group">
					<p class="label-txt">BIRTHDAY</p> <br/>
					<input type="date" name="birthday" id="birthday" placeholder="정확한 생일을 입력해주세요" class="input" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group">
					<p class="label-txt">ADDRESS</p> <br/>
					<p style="font-size: 0.8em;font-family: sans-serif">정확한 주소를 입력해주세요<br/>
					(!작품 입찰시 배송될 기본 주소로 등록됩니다.)</p>
					<input type="text" class="input" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호">
					<input type="button" class="input" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" class="input" name="sample6_address" id="sample6_address" placeholder="주소"><br>
					<input type="text" class="input" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" class="input" name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목">
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
					<table>
						<tr>
							<td>
					<input type="checkbox" class="btn btn-primary" name="aggrement1" id="aggrement1" value="1" required/>
					<span>개인정보 수집 및 이용에 동의합니다.</span>
							</td> 
						</tr>
						<tr>
							<td>
					<input type="checkbox" class="btn btn-primary" name="aggrement2" id="aggrement2" value="1" > 
					<span>이벤트 및 마케팅 활용 및 홍보성 정보 수신에 동의합니다.</span>
							</td> 
						</tr>
					</table>	
				<div class="mb-5"></div>
				<button type="button" onclick="fCheck()" class="form-group">회 원 가 입</button>
			</form>
		</div>
		<jsp:include page="../../include/footer.jsp"></jsp:include>
	</div>
</body>
</html>
