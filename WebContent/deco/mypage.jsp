<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deco ::마이페이지</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<section>
<hr>
<h1>마이페이지</h1>
<input type="button" value="회원정보" onclick = "location.href='userInfo.deco'">
<input type="button" value="내가 쓴 찜목록" onclick = "location.href='dibsList.deco'">
<input type="button" value="내가 쓴 리뷰목록" onclick = "location.href='reviewList.deco'">
<input type="button" value="회원탈퇴" onclick = "location.href='userInfoDelete.deco'">
</section>
<hr>
<%@ include file="../bottom.jsp" %>
</body>
</html>