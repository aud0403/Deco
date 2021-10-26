<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="com.deco.controller.action.ActionForward"%>
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

<table>
<tr> 
<td> 
<c:forEach var="vo" items="${CafeList}">
    <h5>오늘의 카페 추천</h5>
    <ul>
    	<li> <a href ="cafe.deco?idx=${vo.idx}">이름 : ${vo.name }</a></li>
       <li>설명 : ${vo.content }</li>
       <li>전화번호 : ${vo.phone }</li>
       <li>대표메뉴 : ${vo.menu }</li>
       <li>평점 : ${vo.grade }</li>
       <li>영업시간 : ${vo.opentime} ~ ${vo.closetime}</li>
       <li>위치 : ${vo.location }</li>
       <li> <img alt="cafe-out" src="/image/${vo.outimage}" width="150px" height="150px"></li>
    </ul>
    </c:forEach>
</td>
<td> 
<c:forEach var="fo" items="${FoodList}">
    <h5>오늘의 식당 추천</h5>
    <ul>
    	<li> <a href ="food.deco?fidx=${fo.fidx}">이름 : ${fo.name }</a></li>
       <li>설명 : ${fo.content }</li>
       <li>전화번호 : ${fo.phone }</li>
       <li>대표메뉴 : ${fo.menu }</li>
       <li>평점 : ${fo.grade }</li>
       <li>영업시간 : ${fo.opentime} ~ ${fo.closetime}</li>
       <li>위치 : ${fo.location }</li>
       <li> <img alt="food-out" src="/fimage/${fo.outimage}" width="150px" height="150px"></li>
    </ul>
    </c:forEach>
</td>
<td> 
<c:forEach var="so" items="${ShowsList}">
    <h5>오늘의 공연 추천</h5>
    <ul>
    	<li> <a href ="shows.deco?sidx=${so.sidx}">이름 : ${so.name }</a></li>
       <li>설명 : ${so.content }</li>
       <li>전화번호 : ${so.phone }</li>
       <li>대표메뉴 : ${so.menu }</li>
       <li>평점 : ${so.grade }</li>
       <li>영업시간 : ${so.opentime} ~ ${so.closetime}</li>
       <li>위치 : ${so.location }</li>
       <li> <img alt="shows-out" src="/simage/${so.outimage}" width="150px" height="150px"></li>
    </ul>
    </c:forEach>
</td>
<td> 
<c:forEach var="eo" items="${EtcList}">
    <h5>오늘의 이색체험 추천</h5>
    <ul>
    	<li> <a href ="etc.deco?eidx=${eo.eidx}">이름 : ${eo.name }</a></li>
       <li>설명 : ${eo.content }</li>
       <li>전화번호 : ${eo.phone }</li>
       <li>대표메뉴 : ${eo.menu }</li>
       <li>평점 : ${eo.grade }</li>
       <li>영업시간 : ${eo.opentime} ~ ${eo.closetime}</li>
       <li>위치 : ${eo.location }</li>
       <li> <img alt="etc-out" src="/eimage/${eo.outimage}" width="150px" height="150px"></li>
    </ul>
    </c:forEach>
</td>
</tr>
</table>

<%@ include file="../bottom.jsp" %>

</body>
</html>