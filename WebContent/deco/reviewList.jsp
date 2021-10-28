<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>::deco::리뷰목록</title>
<body>
<%@ include file="../top.jsp" %>
<section>
	<div>
	<form action="review.deco" method="get">
	<h3>리뷰리스트</h3>
	<c:forEach var="vo" items="${ReviewList}">
	<ul>
		<li>${vo.nickname }</li>
		<li>${vo.content }</li>
		<li>${vo.grade }</li>
		<li>${vo.category }</li>
		<li><img alt="cafe-out" src="/reviewimage/${vo.imgfile}" width="150px" height="150px"></li>
		<li> <a href ="cafe.deco?idx=${vo.refidx}">글 보러가기</a> </li>
	</ul>
	</c:forEach>
	</form>
	</div>
	
	<c:if test="${pageDto.startPage!=1}">
			<a class="pagenum" href="?page=1">&lt;&lt;</a>
			<a class="pagenum" href="?page=${pageDto.startPage-1}">&lt;</a>
			<!-- startPage를 현재 startPage -10 -->
			<!-- 현재페이지를 startPage값에서 -1로 변경하면 요청이 변경되면서 자동 계산 -->
		</c:if>
	
	<div class="pagebutton">
		<c:forEach var="i" begin="${pageDto.startPage}"
			end="${pageDto.endPage}">
			<a
				class="pagenum
      	<c:if test="${pageDto.currentPage == i}">current</c:if>
      "
				href="?page=${i}">${i}</a>
		</c:forEach>

		<c:if test="${pageDto.endPage!=pageDto.totalPage}">
			<a class="pagenum" href="?page=${pageDto.endPage+1}">&gt;</a>

			<a class="pagenum" href="?page=${pageDto.totalPage}">&gt;&gt;</a>
		</c:if>
	</div>
</section>
<%@ include file="../bottom.jsp" %>
</body>
</html>