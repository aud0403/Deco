<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DECO 당신의 하루를 꾸미다.</title>
</head>
<body>
  <h1>DECO</h1>
  <form action="login.deco" method="post">
    <label for="">아이디 : </label>
    <input type="text" name="userId"><br>
    <label for="">비밀번호 : </label>
    <input type="password" name="password">
    <input type="submit" value="login">
  </form>
    <div>아직 회원이 아니신가요?</div>
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
<%@ include file="../bottom.jsp" %>
</body>
</html>