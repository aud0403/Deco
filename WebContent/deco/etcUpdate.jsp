<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>etc글 수정하기</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<section>
<h1>카페 업데이트</h1>
<hr>
<form  method="post" action="etcModify.deco" >
<div style="width:80%; margin:auto;">
<h3>카페</h3>
<input type="hidden" name="eidx"value="${etc.eidx}">
<ul > 
	<li> 
	 <ul >
	 	<li>지역</li>
	 	<li> <input type ="text" name="location"value="${etc.location}" required="required"> </li>
	 	<li>상호</li>
	 	<li><input type ="text" name="name"value="${etc.name}" required="required"></li>
	 	<li>평점</li>
	 	<li><input type ="text" name="grade"value="${etc.grade}" required="required"> </li>
	 </ul>
	</li>
	<li> 
		<ul >
		 <li>내용</li>
		 <li><input type ="text" name="content"value="${etc.content}" required="required"></li>
		</ul>
	</li>
	<li> 
	 	<ul>
	 	 <li> 메뉴</li>
	 	 <li>  <input type ="text" name="menu"value="${etc.menu}" required="required"></li>
	 	</ul>
	</li>
	<li> 
	 <ul >
	 <li>수정 전 사진</li>
	  <li> 
	 	<img alt="etc" src="/eimage/${etc.inimage}">
	 	<img alt="etc" src="/eimage/${etc.outimage}">
	  </li>
	 </ul>
	</li>

	<li> 
	 <ul >
	 	
		<li>영업시간</li>
		<li><input type ="text" name="opentime"value="${etc.opentime}" required="required"></li>
		<li><input type ="text" name="closetime"value="${etc.closetime}" required="required"></li>
	 </ul>
	</li>
	<li> 
	 <ul> 
	 	<li>수정후 외부 사진</li>
	 	 <li> 
 		<input type="file" name="outimage" accept="image/*" placeholder="이미지 파일을 선택해주세요"
 		onchange="setThumbnail(event);"> 
 	</li>
 	<li> 
 	 <div id="image_container"></div>
 	</li>
	 </ul>
	</li>
	<li> 
	 <ul> 
	 	<li>수정후 내부 사진</li>
	 	 <li> 
 		<input type="file" name="inimage" accept="image/*" placeholder="이미지 파일을 선택해주세요"
 		onchange="setThumbnail2(event);"> 
 	</li>
 	<li> 
 	 <div id="image_container2"></div>
 	</li>
	 </ul>
	</li>
	<li> 
		<ul >
			<li> 주소 </li>
			<li> <input type ="text" name="addr"value="${etc.addr}" required="required"></li>
		</ul>
	</li>
	 <li> 
	  <ul >
	  	<li> 전화 번호</li>
	  	<li> <input type ="text" name="phone"value="${etc.phone}" required="required"></li>
	  </ul>
	 </li>
</ul>
<div>
	<input type="submit" value="저장" class="">
	<input type="reset" value="다시쓰기" class="">
	<input type="button" value="목록" onclick="location.href='etcList.deco'" class="">
	
</div>
</div>
</form>
</section>
<%@ include file="../bottom.jsp" %>

</body>
</html>