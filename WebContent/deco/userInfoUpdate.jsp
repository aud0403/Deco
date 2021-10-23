<%@page import="com.deco.dao.UsersDao"%>
<%@page import="com.deco.dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deco :: 회원정보</title>
<!-- 스타일 참고  -->
<link rel="stylesheet" href="">
<script>
	function validCheck() {
		const frm = document.frmReg;
		//1. 패스워드는 8글자 이상이어야 한다.
		if (frm.password.value.length < 4){
			alert('패스워드는 4글자 이상으로 하세요.');
			frm.password.focus();				// 포커스(커서) 이동 
			return false;						//함수가 종료.
		}
		//2. 나이 : 태그 min,max 무시 -> 20 ~ 70 값 범위로 검사합니다.
		if(frm.age.value < 15 || frm.age.value > 70 ){    //  return false 할 조건으로 작성. 이 위치는 위의 조건이 거짓일 때만 실행됩니다. 
			alert('나이는 15세 이상 70세 이하로만 가능합니다. ');
			frm.age.focus();
			return false;
		}
	 
	    if(frm.name.value.length<2){
	        alert("이름을 2자 이상 입력해주십시오.")
	        frm.name.focus();
	        return false;
	    }
		
		//체크한것 이 한개도 없으면 여기와서 실행합니다.
		
		return false;
	}
	
	function findAddr(){
    	new daum.Postcode({
            oncomplete: function(data) {
            	
            	console.log(data);
            	
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var jibunAddr = data.jibunAddress; // 지번 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_post').value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("member_addr").value = roadAddr;
                } 
                else if(jibunAddr !== ''){
                    document.getElementById("member_addr").value = jibunAddr;
                }
            }
        }).open();
    }
	
</script>
</head>
<body>
<!--<c:if test="${alert!=null }">
	<script type="text/javascript">
		alert('회원 정보가 수정되었습니다.');
	</script>
</c:if>
-->
	<div style="width: 70%; margin: auto;">
		<h3>Deco :: 회원정보</h3>  <!-- 이메일 , 지역 -->
		<form action="userInfoModify.deco" name="frmReg" method="post" > 
			<input type="hidden" name="idx" value="${dto.idx }" >  
			<!--브라우저에 출력은 안되고 파라미터로 필요한값은 type을 hidden으로 한다. -->
			<table>
				<tr>
					<td><label>닉네임</label></td>
				
					<td><input type="text" name="nickname" placeholder="" value="${dto.nickname }" readonly>
					

					</td>   	<!-- 닉네임은 변경할수 없고 읽기만 -->
				</tr>
				<tr>
					<td><label>이름</label></td>
				
					<td><input type="text" name="name" placeholder="" value="${dto.name }"
						readonly></td>   	<!-- 이름은 변경할수 없고 읽기만 -->
				</tr>
				<tr>

					<td><label>이메일</label></td>
					<td><input type="email" name="email" value="${dto.email }"readonly></td>
				</tr>
					<!-- value는 기본값. type="number" 일 때는 min,max 속성 설정 가능.-->
				<tr>
				    <td><label>성별</label></td>
					<td><input type="text" value="${dto.gender }" name="gender" readonly>
						
					</td>
					</tr>
					<tr>
					<td><label>나이</label></td>
					<td><input type="number" name="age" min="10" max="99"
						value="${dto.age }"></td>
					<!-- value는 기본값. type="number" 일 때는 min,max 속성 설정 가능.-->
				</tr>
				<tr>
					<td><label>전화번호</label></td>
					<td><input type="text" name="phone" placeholder="전화번호을 입력하세요" value="${dto.phone }"></td>
				</tr>
				<tr>
					<td><label>주소</label></td>
					<td>
					<input name="addr" type="button" id="member_post" value="주소찾기" onclick="findAddr()">
 							<input name="addr" id="member_addr" value="${dto.addr }">
					
					</td>
				
					
					</tr>
				
				<tr>
					<td colspan="2" style="text-align: center">
					<input type="submit" value="수정하기"> 	
					<input type="reset" value="취소하기" onclick = "location.href='/deco/home.jsp'">
				</tr>
			</table>
		</form>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>