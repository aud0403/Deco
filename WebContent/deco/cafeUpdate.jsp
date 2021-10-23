<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafe글 수정하기</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<section>
<h1>카페 업데이트</h1>
<hr>
<form  method="post" action="cafeModify.deco" >
<div style="width:80%; margin:auto;">
<h3>카페</h3>
<input type="hidden" name="idx"value="${cafe.idx}">
<ul > 
	<li> 
	 <ul >
	 	<li>지역</li>
	 	<li> <input type ="text" name="location"value="${cafe.location}" required="required"> </li>
	 	<li>상호</li>
	 	<li><input type ="text" name="name"value="${cafe.name}" required="required"></li>
	 	<li>평점</li>
	 	<li><input type ="text" name="grade"value="${cafe.grade}" required="required"> </li>
	 </ul>
	</li>
	<li> 
		<ul >
		 <li>내용</li>
		 <li><input type ="text" name="content"value="${cafe.content}" required="required"></li>
		</ul>
	</li>
	<li> 
	 	<ul>
	 	 <li> 메뉴</li>
	 	 <li>  <input type ="text" name="menu"value="${cafe.menu}" required="required"></li>
	 	</ul>
	</li>
	<li> 
	 <ul >
	  <li> 
	 	<img alt="cafe" src="">
	  </li>
	 </ul>
	</li>
	<li> 
	 <ul >
	 	
		<li>영업시간</li>
		<li><input type ="text" name="opentime"value="${cafe.opentime}" required="required"></li>
		<li><input type ="text" name="closetime"value="${cafe.closetime}" required="required"></li>
	 </ul>
	</li>
	<li> 
		<ul >
			<li> 주소 </li>
			<li> <input type ="text" name="addr"value="${cafe.addr}" required="required"></li>
		</ul>
	</li>
	 <li> 
	  <ul >
	  	<li> 전화 번호</li>
	  	<li> <input type ="text" name="phone"value="${cafe.phone}" required="required"></li>
	  </ul>
	 </li>
</ul>
<div>
	<input type="submit" value="저장" class="">
	<input type="reset" value="다시쓰기" class="">
	<input type="button" value="목록" onclick="location.href='list.deco'" class="">
	
</div>
</div>
</form>
</section>
<%@ include file="../bottom.jsp" %>

</body>
</html>