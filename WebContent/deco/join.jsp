<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day3 [2]-회원 등록</title>
<!-- 스타일 참고  -->
<script>
   function validCheck() {
      const frm = document.frmReg;
      //1. 패스워드는 8글자 이상이어야 한다.
      if (frm.password.value.length < 4){
         alert('패스워드는 4글자 이상으로 하세요.');
         frm.password.focus();            // 포커스(커서) 이동 
         return false;                  //함수가 종료.
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
<%@ include file="../top.jsp" %>
<section>
	<div style="width: 70%; margin: auto;">
		<h3>회원 등록</h3>
		<form action="memberAction.deco" name="frmReg" method="post">
			<table style="width: 100%">
				<tr>
					<td><label>이름</label></td>
					<!--  required 필수 입력  , readonly : 읽기만.-->
					<td><input type="text" name="name" placeholder="이름 이력(필수)"
						required></td>
				</tr>
				<tr>
					<td><label>패스워드</label></td>
					<td><input type="password" name="password" placeholder="password을 입력하세요"></td>
				</tr>
				<tr>
					<td><label>이메일</label></td>
               		<td>
	               		<input type="text" name="str_email01" id="str_email01" style="width:100px"> @ 
						<input type="text" name="str_email02" id="str_email02" style="width:100px;">
						<select style="width:100px;margin-right:10px" name="str_email02" id="selectEmail"> 
						<option value="1">직접입력</option> 
						<option value="naver.com" selected>naver.com</option> 
						<option value="hanmail.net">hanmail.net</option> 
						<option value="hotmail.com">hotmail.com</option> 
						<option value="nate.com">nate.com</option> 
						<option value="yahoo.co.kr">yahoo.co.kr</option> 
						<option value="empas.com">empas.com</option> 
						<option value="dreamwiz.com">dreamwiz.com</option> 
						<option value="freechal.com">freechal.com</option> 
						<option value="lycos.co.kr">lycos.co.kr</option> 
						<option value="korea.com">korea.com</option> 
						<option value="gmail.com">gmail.com</option> 
						<option value="hanmir.com">hanmir.com</option> 
						<option value="paran.com">paran.com</option> 
						</select>
					</td>
				</tr>
				<tr>
					<td><label>성별</label></td>
					<td><input type="radio" value="남" name="gender">남자
						<input type="radio" value="여" name="gender" checked>여자
						<!-- checked  는 기본 선택 --></td>
				</tr>
				<tr>
					<td><label>나이</label></td>
					<td><input type="number" name="age" min="10" max="99"
						value="30"></td>
					<!-- value는 기본값. type="number" 일 때는 min,max 속성 설정 가능.-->
				</tr>
				<tr>
					<td><label>전화번호</label></td>
					<td><input type="text" name="phone" placeholder="전화번호을 입력하세요"></td>
				</tr>
				<tr>
					<td><label>주소</label></td>
					<td>
						<input name="addr" type="button" id="member_post" value="주소찾기" onclick="findAddr()">
                      <input name="addr" id="member_addr"  >
					</td>
				</tr>
				<tr>
					<td><label>닉네임</label></td>
					<td><input type="text" name="nickname" placeholder="닉네임을 입력하세요"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center"><input
						type="submit" value="가입하기"> <!-- submit : 서버에게 데이터를 제출 (form action 속성값에 설정된 url 로 데이터 전달.)
						action 이 .html 은 데이터 전송확인은 못합니다. url 이동만 확인!!--> <input
						type="reset" value="다시쓰기"></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<%@ include file="../bottom.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api -->


<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">
$('#selectEmail').change(function(){ 
$("#selectEmail option:selected").each(function () { 
if($(this).val()== '1'){ 
   $("#str_email02").val('');
   $("#str_email02").attr("disabled",false); //활성화 
}else{ //직접입력이 아닐경우
   $("#str_email02").val($(this).text()); //선택값 입력
$("#str_email02").attr("disabled",true); //비활성화
 } }); }); </script>
</body>
</html>