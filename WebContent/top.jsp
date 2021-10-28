<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">

  <title>Document</title>
  <link rel="stylesheet" href="top_bottom.css">
</head>
<body>
  <header class="header">
    <div class="logo">
      DECO
    </div>
    <ul class="menu">
      <li><a href="cafeList.deco">Search</a></li>
      <li><a href="best.deco">Hot Place</a></li>
      <li><a href="mypage.deco">My Page</a></li>
      <li><a href="">About Us</a></li>
      <li><a href="cafeInsert.deco">inset카페</a></li>
      <li><a href="foodInsert.deco">inset식당</a></li>
      <li><a href="showsInsert.deco">isnet공연</a></li>
      <li><a href="etcInsert.deco">isnet이색</a></li>
     
    </ul>
    <div class="nickname">
     <!-- <li id="logintest"> -->
        <c:if test="${sessionScope.user == null}">
	<a href="home_login.deco">로그인</a>
	</c:if>
	<c:if test="${sessionScope.user != null}">
	<!-- 로그인 된 상태 -->
	<br>(${user.nickname }) 님. 반갑습니다. <br>
	<a href="logout.deco" class="menu">로그아웃</a>
	</c:if>
	<a href="mypage.deco" class="menu">마이페이지</a>
	<!-- </li> -->
    </div>
  </header>
</body>
</html>