<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home 화면</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<hr>
<section>
<div width="100vw" height="40vh">
 <input type="button" onclick="location.href='mypage.deco'" value="마이페이지"></input>
 <input type="button" onclick="location.href='cafeList.deco'" value="데이트코스 검색"></input>
 <input type="button" href="" value="금주의 핫플"></input>
 <input type="button" onclick="location.href='cafeInsert.deco'" value="업체등록"></input>
</div>
</section>
<hr>
<%@ include file="../bottom.jsp" %>
</body>
</html>