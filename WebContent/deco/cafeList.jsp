<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DECO 당신의 하루를 꾸미다</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<hr>
<h1>데이트코스 검색</h1>
<section>
	<div>
    <a href="home.deco">
      <img src="" alt="">
    </a>
  </div>
  <div>
      <div>
      <label for="">[카테고리]</label>
      	<ul>
      		<li><a href="list.deco">카페</a></li>
      		<li><a href="#">맛집</a></li>
      		<li><a href="#">공연/전시</a></li>
      		<li><a href="#">체험/이색데이트</a></li>
      	</ul>
      </div>		<!-- 파라미터 남아있게 하는게 숙제.... -->
    <form action="cafeList.deco" method="get">
    	<input type="hidden" name="default" value="all" >
      <label for="">[지역]</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="location" value="강남" onclick="noCheckLocationAll(this)">강남
        <input type="checkbox" name="location" value="인사동" onclick="noCheckLocationAll(this)">인사동
        <input type="checkbox" name="location" value="연남동" onclick="noCheckLocationAll(this)">연남동
        <input type="checkbox" name="location" value="상수" onclick="noCheckLocationAll(this)">상수
        <input type="checkbox" name="location" value="명동" onclick="noCheckLocationAll(this)">명동
        <input type="checkbox" name="location" value="이태원" onclick="noCheckLocationAll(this)">이태원
        <input type="checkbox" name="location" value="익선동" onclick="noCheckLocationAll(this)">익선동
        <input type="checkbox" name="location" value="건대" onclick="noCheckLocationAll(this)">건대
        <input type="checkbox" name="location" value="대학로" onclick="noCheckLocationAll(this)">대학로
        <input type="checkbox" name="location" value="홍대" onclick="noCheckLocationAll(this)">홍대
        <input type="checkbox" name="location" value="동대문" onclick="noCheckLocationAll(this)">동대문
        <input type="checkbox" name="location" value="가로수길" onclick="noCheckLocationAll(this)">가로수길
        <input type="checkbox" name="locationAll" value="all" checked="checked" onclick="checkOnlyLocationAll(this)">전체선택 <br><br>
        <input type="submit" value="검색">
        <input type="reset" value="초기화">
    </form>
  </div>
  <h3>리스트</h3>
  <div>
  <c:set var="pno" value="${pageDto.currentPage}"/>
    <c:forEach var="vo" items="${CafeList}">
    <ul>
    	<li> <a href ="cafe.deco?idx=${vo.idx}&page=${pno}">${vo.name }</a></li>
    	<li>${vo.location }</li>
       <li>${vo.content }</li>
       <li>${vo.grade }</li>
       <li>${vo.menu }</li>
       <li> <img alt="cafe-out" src="/image/${vo.outimage}" width="200px" height="200px"></li>
       <li>영업시간 : ${vo.opentime} ~ ${vo.closetime}</li>
       <li>${vo.addr }</li>
       <li>${vo.phone }</li>
    </ul>
    </c:forEach>
  </div>
  <div style="text-align: center;">
<hr>
<!-- href="listAction.jsp?page=1" 요청url 은 현재와 같을때 생략하고 ? 뒤에 파라미터값만 변경합니다. -->
   <c:if test="${pageDto.startPage!=1}">
   <a class="pagenum" href="?page=1">&lt;&lt;</a>
   <a class="pagenum" href="?page=${pageDto.startPage-1}">&lt;</a> <!-- startPage를 현재 startPage -10 -->
   <!-- 현재페이지를 startPage값에서 -1로 변경하면 요청이 변경되면서 자동 계산 -->
   </c:if>
   
   <c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}">
      <a class="pagenum
      	<c:if test="${pageDto.currentPage == i}">current</c:if>
      " href="?page=${i}">${i}</a>
   </c:forEach>
   
   <c:if test="${pageDto.endPage!=pageDto.totalPage}">
   <a class="pagenum" href="?page=${pageDto.endPage+1}">&gt;</a> 
   <!-- 현제 페지를 endPage값에서 +1로 변경하면 요청이 변경되되면서자동계산 -->
   <a class="pagenum" href="?page=${pageDto.totalPage}">&gt;&gt;</a> <!-- 마지막 페이지 -->
   </c:if>
	
</div> 
</section>
<hr>
<%@ include file="../bottom.jsp" %>  
  <script type="text/javascript">
  
  function checkOnlyLocationAll(element){
 	const choice = document.getElementsByName(`location`);
	choice.forEach(ch => ch.checked=false)
  } 
  
  function noCheckLocationAll(element){
  	const choice = document.getElementsByName(`locationAll`);
  	choice.forEach(ch => ch.checked=false)
  }
  
  </script>
</body>
</html>













