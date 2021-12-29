<%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2021-06-01
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="grinbi.message.MessageSourceWrapper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container contact">
    <div class="sub_top">
        <div class="wrap_1296">
            <div class="txt_box">
                <h4>CONTACT US</h4>
            </div>
        </div>
    </div>
    <div class="content sub_cont01">
        <div class="wrap_1296">
            <div class="map_area">
                <!--<div id="map_daygen" style="width:100%; height:397px;"></div>-->
                <div id="map" style="width:620px;height:397px;"></div>
				<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2tYAP6EIJ22OMr2_kphNUVnbAg8RpRzY&callback=initMap&libraries=&v=weekly"async></script>
				<script>
				function initMap() {
					const position = { lat: 37.300335, lng:  127.070411 };
					const map = new google.maps.Map(document.getElementById("map"), {
						zoom: 17,
						center: position,
						mapTypeControl: false,
					});
					
					const marker = new google.maps.Marker({
						position: position,
						map: map,
					});
				}
				</script>
            </div>
        </div>
    </div>
    <div class="content sub_cont02">
        <div class="wrap_1296">
            <p class="tit"><img src="<c:url value='/images/mobileEN/contact/tit.png'/>" alt="Daygen Headquarters"></p>
            <ul>
                <li data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                    <em>
                        <img src="<c:url value='/images/mobile/contact/ico_address.png'/>" alt="address">
                    </em>
                    <p>RM A421 Gwanggyo UmiNewv B/D, 338,<br/>Gwanggyojungang-ro, Suji-gu, Yongin-si,<br/>Gyeonggi-do, Republic of Korea</p>
                </li>
                <li data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                    <em>
                        <img src="<c:url value='/images/mobile/contact/ico_call.png'/>" alt="call">
                    </em>
                    <p>+82-31-215-8814<br/><span>TEL</span></p>
                </li>
                <li data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                    <em>
                        <img src="<c:url value='/images/mobile/contact/ico_fax.png'/>" alt="fax">
                    </em>
                    <p>+82-31-215-8815<br/><span>FAX</span></p>
                </li>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%= MessageSourceWrapper.getStaticMessage("kakaoAPIKey") %>&libraries=services,clusterer,drawing"></script>
<script>
   var mapContainer01 = document.getElementById('map_daygen'),
       mapOption01 = {
           center: new kakao.maps.LatLng(37.30070986064357, 127.07116800826071),
           level: 3
       };
   var map01 = new kakao.maps.Map(mapContainer01, mapOption01);
   var markerPosition01 = new kakao.maps.LatLng(37.30070986064357, 127.07116800826071);
   // var markerPosition02 = new kakao.maps.LatLng(37.30103192496846, 127.07126136430264);
   var content = '<div class ="label"><span class="left"></span><span class="center">Daygen</span><span class="right"></span></div>';
   var marker01 = new kakao.maps.Marker({
       position: markerPosition01
   });
   var customOverlay = new kakao.maps.CustomOverlay({
       //position: markerPosition02,
       content: content   
   });


   marker01.setMap(map01);
   customOverlay.setMap(map01);
</script>