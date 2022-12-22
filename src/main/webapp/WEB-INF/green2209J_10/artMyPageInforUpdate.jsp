<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="../../include/head.jsp"></jsp:include>
<title>Hyun's Auction</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../include/head.jsp"></jsp:include>
<jsp:include page="../../include/style.jsp"></jsp:include>
<jsp:include page="../../include/joinStyle.jsp"></jsp:include>
</head>
<script>
	'use strict'
	
		
	function fCheck() {
		const regname = /^[가-힣a-zA-Z]{2,20}/; // 한글 영어 소문자 대문자
		const regbirthday = /^[0-9]{4}-[0-9]{2}-[0-9]{2}/;
		const regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;// 숫자 영어 @ 숫자 영어 . 영어 
		const regtel = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; // 01? 가운데 3자리 4자리 마지막 4자리 전화 번호 형식
				
		
		let name = document.getElementById("name").value;
		let email = document.getElementById("email").value;
		let tel = document.getElementById("tel").value;
		let birthday = document.getElementById("birthday").value;
		let address1 = document.getElementById("sample6_address").value;
		let address2 = document.getElementById("sample6_detailAddress").value;
		let aggrement1 = $("#aggrement1").is(":checked");
		
		
		if(name.trim() == "" || !regname.test(name)){
			alert("이름은 최소 2자 한글 또는 영어 소/대문자만 입력가능합니다.");
			$("#name").focus();
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
		else {
			let gender = memberInforUpdateForm.gender.value;
			
			
			let query = {
					name,
					email,
					tel,
					gender,
					birthday,
					address1,
					address2,
					aggrement1
			}
			
			
			
			$.ajax({
				type : "post",	
				url : "${ctp}/artmemberInforUpdateOk.my",
				data : query,
				success : function() {
					alert("회원 정보가 수정되었습니다.");
					top.location="${ctp}/artMyPage.my"
				},
				error : function() {
					alert("전송 실패");
				}
			});
			
			
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
<body class="text-center" style="height: 1330px">
	<div class="container-fluide d-flex w-100 h-100 p-3mx-auto  flex-column">
		<div class="containe text-center">
			<form name="memberInforUpdateForm">
				<label class="form-group" style="margin-left: 60px">
					<p class="label-txt ">ID</p> <br/>
					<input type="password" name="mid" id="mid" value="${vo.mid}" class="input" maxlength="19" readonly>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group" style="margin-left: 60px">
					<p class="label-txt">PASSWORD</p> <br/>
					<input type="password" name="pwd" id="pwd" value="${vo.pwd}" class="input" readonly>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group" style="margin-left: 60px">
					<p class="label-txt">NAME</p> <br/>
					<input type="text" name="name" id="name" value="${vo.name}" class="input" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group" style="margin-left: 60px">
					<p class="label-txt">GENDER</p>
					<div style="color: rgb(120, 120, 120);">MALE</div> <input
					type="radio" name="gender" id="gender1" class="input" value="남자" <c:if test="${vo.gender == '남자' }">checked</c:if>>
					<div class="line-box">
						<div class="line"></div>
					</div><br/>
					<div style="color: rgb(120, 120, 120);">FEMALE</div> <input
					type="radio" name="gender" id="gender2" class="input" value="여자" <c:if test="${vo.gender == '여자' }">checked</c:if>>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group" style="margin-left: 60px">
					<p class="label-txt">EMAIL</p><br/>
					<input type="text" name="email" id="email" value="${vo.email}" class="input" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group" style="margin-left: 60px">
					<p class="label-txt">PHONE</p> <br/>
					<input type="text" name="tel" id="tel" value="${vo.tel}" class="input" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group" style="margin-left: 60px">
					<p class="label-txt">BIRTHDAY</p> <br/>
					<input type="date" name="birthday" id="birthday" value="${fn:substring(vo.birthday,0,11)}" class="input"/>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mt-5"></div>
				<label class="form-group" style="margin-left: 60px">
					<p class="label-txt">ADDRESS</p> <br/>
					<p style="font-size: 0.8em;font-family: sans-serif">정확한 주소를 입력해주세요<br/>
					(!작품 입찰시 배송될 기본 주소로 등록됩니다.)</p>
					<input type="text" class="input" name="sample6_postcode" id="sample6_postcode" value="${address}">
					<input type="button" class="input" onclick="sample6_execDaumPostcode()" value="우편 번호 검색"><br>
					<input type="text" class="input" name="sample6_address" id="sample6_address" value="${detailAddress}"><br>
					<input type="text" class="input" name="sample6_detailAddress" id="sample6_detailAddress" value="${extraAddress}">
					<input type="text" class="input" name="sample6_extraAddress" id="sample6_extraAddress" value="${extraAddress_2}">
					<div class="line-box">
						<div class="line"></div>
					</div>
				</label>
				<div class="mb-5"></div>
				<button type="button" onclick="fCheck()" class="form-group">회 원 정 보 수 정</button>
				<input type="hidden" name="mid" value="${vo.mid}"/>
			</form>
		</div>
	</div>
</body>
</html>