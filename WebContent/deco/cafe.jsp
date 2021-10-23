<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafe글 상세보기</title>
</head>
<link rel="stylesheet" href="../css/cafe.css">
<body>
<%@ include file="../top.jsp" %>
<section>
<hr>
<div style="width:80%; margin:auto;">
<h3>카페</h3>
<form action="cafeUpdate.deco"method="post">
<input type="hidden" value="${cafe.idx}" name="idx">
<ul > 
	<li> 
	 <ul >
	 	<li>지역</li>
	 	<li>${cafe.location}</li>
	 	<li>상호</li>
	 	<li>${cafe.name}</li>
	 	<li>평점</li>
	 	<li name="grade">${cafe.grade}</li>
	 </ul>
	</li>
	<li> 
		<ul >
		 <li>내용</li>
		 <li>${cafe.content}</li>
		</ul>
	</li>
	<li> 
	 	<ul>
	 	 <li> 메뉴</li>
	 	 <li>${cafe.menu}</li>
	 	</ul>
	</li>
	<li> 
	 <ul >
	  <li> 
	 	<img alt="cafe_in" src="/image/${cafe.inimage}"><br>
	 	<img alt="cafe-out" src="/image/${cafe.outimage}">
	  </li>
	 </ul>
	</li>
	<li> 
	 <ul >
	 	
		<li>영업시간</li>
		<li>${cafe.opentime} ~ ${cafe.closetime}</li>
	 </ul>
	</li>
	<li> 
		<ul >
			<li> 주소 </li>
			<li>${cafe.addr}</li>
		</ul>
	</li>
	 <li> 
	  <ul >
	  	<li> 전화 번호</li>
	  	<li>${cafe.phone}</li>
	  </ul>
	 </li>
</ul>
<div>
	<input type="submit" value="수정" class="button small">
	<input type="reset" value="취소" class="button small">
	<input type="button" onclick="location.href='home.jsp'" value="메인화면" class="button small">
	<input type="button" onclick="location.href='list.deco'" value="리스트" class="button small">
</div>
 </form>
 <form action="dibsUpdate.deco">
 	<input type="hidden" name="refidx" value="${cafe.idx }">
 	<input type="submit" value="찜목록 추가/삭제">
 </form>
</div>
<!--  -------------------------------------------------------  -->
<!-- 리뷰 -->
<form action="reviewInsert.deco"method="post" enctype="multipart/form-data">
	<input type="hidden" value="${cafe.idx}" name="idx">  <!-- 이 값이 에요?  넵 -->
	<input type="hidden" value="cafe" name="category">
	<hr class="line">
	<div>
	<span> 리뷰</span>
	<span>리뷰수{}</span>
	</div>
	<hr class="line">
 <ul>
 <li>
  <ul>
  	<li> 작성자</li>
  	<li> <input type="text" name="nickname" readonly value="${user.nickname}">  </li>
  	 <li> 점수</li>
  	 <li> <input type="number" name="grade"class="input" max="5" min ="1"> </li>
  </ul>
 </li>
 <li> 
 	<ul>
 		<li> 
 			<textarea rows="3" cols="80" placeholder ="리뷰를 작성해주세요"
 			class="input" name="content"required></textarea>
 		</li>
 	</ul>
 </li>
 <li>
 	<ul>
 	<li> 
 		<input type="file" name="pic" accept="image/*" placeholder="이미지 파일을 선택해주세요"
 		onchange="setThumbnail(event);"> 
 	</li>
 	<li> 
 	 <div id="image_container"></div>
 	</li>
 	<li> 
 		<input type="submit" value="저장" class="button small">
		<input type="reset" value="취소" class="button small">
 	</li>
 	</ul>
  </li>

 <c:forEach var="re" items="${review}">
  <li> 
 	<ul>
 		<li>${re.nickname}</li>
 		<li> 리뷰점수 :  ${re.grade}</li>
 		
 	</ul>
  </li>
   <li> 
   	<ul> 
   	  <li> 
   	   <pre> ${re.content}</pre>
   	  </li>
   	<li><a href="javascript:deleteCmt('${re.idx}','${cafe.idx}','${re.grade}')">삭제</a></li>
   	</ul>
   </li>
   <li> 
   	<ul>
   		<li> 
   			<img alt="ca-re" src="/reviewimage/${re.imgfile}">
   		</li>
   	</ul>
   </li>
   </c:forEach> 
</ul>
 </form>
</section>
<%@ include file="../bottom.jsp" %>

<script type="text/javascript">
function deleteCmt(reidx,idx,regrade){
		console.log(reidx);console.log(idx);
		
		const yn = confirm('댓글 삭제하시겠습니까?'+regrade);
		if(yn){
			location.href='review.deco?del=&reidx='+reidx+'&idx='+idx+'&regrade='+regrade;
		}else{
			alert('댓글 삭제 취소합니다.');
		}
		
	}
	
function setThumbnail(event) {
	var reader = new FileReader(); 
	reader.onload = function(event) { 
	var img = document.createElement("img"); 
	img.setAttribute("src", event.target.result); 
	document.querySelector("div#image_container").appendChild(img); }; 
	reader.readAsDataURL(event.target.files[0]); }	
	
</script>

<!-- enctype="multipart/form-data" -->
</body>
</html>