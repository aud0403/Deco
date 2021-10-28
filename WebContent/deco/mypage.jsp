<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::deco::마이페이지</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<section>
<hr>
<h1>마이페이지</h1>
<input type="button" value="회원정보" onclick = "location.href='userInfo.deco'">
<input type="button" value="내가 쓴 찜목록" onclick = "location.href='cafeDibsList.deco'">
<input type="button" value="내가 쓴 리뷰목록" onclick = "location.href='reviewList.deco'">
<input type="button" value="회원탈퇴" onclick = "deleteCmt()">
</section>
<hr>
<%@ include file="../bottom.jsp" %>

<script>
function deleteCmt(){
		const yn = confirm('아이디를 삭제하시겠습니까?');
		if(yn){
			location.href='userInfoDelete.deco';
		}else {
			alert('아이디 삭제를 취소합니다.');
		}
	}
</script>	
</body>
</html>