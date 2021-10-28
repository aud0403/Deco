<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="css/home_login.css">
<title>DECO 당신의 하루를 꾸미다.</title>
</head>
<body>
  <div class="deco">
    <div class="decoTitleTop">
      <span class="decoTitleTop_1">Deco</span>
      <span class="decoTitleTop_2">rate Your Day</span>
    </div>
    <div class="decoTitleMiddle">
      <span class="decoTitleMiddle_1">With</span>
      <span class="decoTitleMiddle_2">DECO!</span>
    </div>
    <div class="decoTitleBottom">당신의 하루를 꾸미다</div>
    <div class="decoContent">
      <div class="login">
        <div class="subTitle">DECO</div>
      <form action="http://localhost:8087/deco/login.deco" method="get">
        <input type="email" name="userId" placeholder="email"><br>
        <input type="password" name="password" placeholder="password"><br>
        <input class="loginButton" type="submit" value="Log In">
      </form>
        <ul class="test">
          <li><a class="firstA" href="password.deco">아이디 찾기</a></li>
          <li><a href="password2.deco">비밀번호 찾기</a></li>
          <li><a href="join.deco">회원가입</a></li>
        </ul>
    </div>
    <div class="slide">
    </div>
  </div>
</div>
</body>


















<%-- <body>
  <h1>DECO</h1>
  <form action="login.deco" method="post">
    <label for="">아이디 : </label>
    <input type="text" name="userId"><br>
    <label for="">비밀번호 : </label>
    <input type="password" name="password">
    <input type="submit" value="login">
  </form>
    <div>아직 회원이 아니신가요?</div>
    <a href="password.deco">회원 찾기</a>     <!-- onClick="window.open('http://localhost:8087/deco/password.deco','회원찾기','width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">회원찾기</a> --> 
    <a href="join.deco">회원가입</a>
   <hr>
    <h5>오늘의 카페 추천</h5>
    <c:forEach var="vo" items="${CafeList}">
    <ul>
    	<li>이름 : ${vo.name }</li>
       <li>설명 : ${vo.content }</li>
       <li>전화번호 : ${vo.phone }</li>
       <li>대표메뉴 : ${vo.menu }</li>
       <li>평점 : ${vo.grade }</li>
       <li>영업시간 : ${vo.opentime} ~ ${vo.closetime}</li>
       <li>위치 : ${vo.location }</li>
       <li> <img alt="cafe-out" src="/image/${vo.outimage}" width="150px" height="150px"></li>
    </ul>
    </c:forEach>
</body> --%>
</html>