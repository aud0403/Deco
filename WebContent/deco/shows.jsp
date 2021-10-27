<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::deco::공연</title>
</head>
<link rel="stylesheet" href="../css/cafe.css">
<body>
<%@ include file="../top.jsp" %>
<h1 id="title"><img id="icon" alt="icon" src="../img/icon2.png">deco</h1>





<section>
<hr>
<div style="width:80%; margin:auto;">
<h3>카페</h3>
<form action="showsUpdate.deco?page=${page}"method="post">
<input type="hidden" value="${shows.sidx}" name="sidx">
<ul > 
   <li> 
    <ul >
       <li>지역</li>
       <li>${shows.location}</li>
       <li>상호</li>
       <li>${shows.name}</li>
       <li>평점</li>
       <li name="grade">${shows.grade}</li>
    </ul>
   </li>
   <li> 
      <ul >
       <li>내용</li>
       <li>${shows.content}</li>
      </ul>
   </li>
   <li> 
       <ul>
        <li> 메뉴</li>
        <li>${shows.menu}</li>
       </ul>
   </li>
   <li> 
    <ul>
    <li>메뉴 사진</li>
     <li>
    <img alt="shows_in" src="/simage/${shows.inimage}" width="150px" height="150px"><br></li>
    <li>외관 사진</li>
    <li>
    <img alt="shows-out" src="/simage/${shows.outimage}">
     </li>
    </ul>
   </li>
   <li> 
    <ul >
       
      <li>영업시간</li>
      <li>${shows.opentime} ~ ${shows.closetime}</li>
    </ul>
   </li>
   <li> 
      <ul >
      
      <li>위치</li> 
       <li>
         <div id="map" style="width:100%;height:350px;"></div>
         </li>
      
         <li> 주소 </li>
         <li>${shows.addr}</li>
      </ul>
   </li>
    <li> 
     <ul >
        <li> 전화 번호</li>
        <li>${shows.phone}</li>
     </ul>
    </li>
    <li> 
     <ul >
        <li> <a href="${shows.link}">사이트 바로가기</a> </li>
        
     </ul>
    </li>
</ul>
<div>
   <input type="submit" value="수정" class="button small">
   <input type="button" onclick="location.href='home.jsp'" value="메인화면" class="button small">
   <input type="button" onclick="location.href='showsList.deco?page=${page}'" value="리스트" class="button small">
</div>
 </form>
 <form action="showsDibsUpdate.deco">
    <input type="hidden" name="idx" value="${shows.sidx }">
    <input type="submit" value="찜목록 추가/삭제">
 </form>
</div>
<!--  -------------------------------------------------------  -->
<!-- 리뷰 -->
<form action="showsReviewInsert.deco?page=${page}"method="post" enctype="multipart/form-data">
   <input type="hidden" value="${shows.sidx}" name="idx">  <!-- 이 값이 에요?  넵 -->
   <input type="hidden" value="shows" name="category">
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
      <li><a href="javascript:deleteCmt('${re.idx}','${shows.sidx}','${re.grade}','${page}','${re.nickname}')">삭제</a></li>
      </ul>
   </li>
   <li> 
      <ul>
         <li> 
            <img alt="sh-re" src="/reviewimage/${re.imgfile}">
         </li>
      </ul>
   </li>
   </c:forEach> 
</ul>
 </form>
</section>
<hr>


<script type="text/javascript">
function deleteCmt(reidx,idx,regrade,page,renickname){
      console.log(reidx);console.log(idx);
      
      const yn = confirm('댓글 삭제하시겠습니까?');
      if(yn){
         location.href='showsReviewInsert.deco?del=&reidx='+reidx+'&idx='+idx+'&regrade='+regrade+'&page='+page+'&renickname='+renickname;
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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=888c3224d5235ea01a4b58cb939e595b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch('${shows.addr}', function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${shows.name}</div>'
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
   </script>
<!-- enctype="multipart/form-data" -->
</body>
</html>