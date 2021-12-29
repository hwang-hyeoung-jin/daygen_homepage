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
<div class="container store">
    <div class="sub_top">
        <div class="wrap_1296">
            <div class="txt_box">
                <h4>제품판매처 찾아보기</h4>
            </div>
        </div>
    </div>
    <div class="content sub_cont0102" id="G_01_02">
    	<div class="map_top">
    		<div class="wrap_1296">
	    		<div class="map_info">
	                   <h5><span name="parmacyNm"></span></h5>
	    			<ul>
	    				<li>
	    					<label>주소</label>
	                           <p><span name="adres01"></span> <span name="adres02"></span></p>
	    				</li>
	    				<li>
	    					<label>전화</label>
	                           <p><span name="telno"></span></p>
	    				</li>
	    			</ul>
	    		</div>
    		</div>
    		<!-- 지도 -->
    		<div class="map_top_box" id="map"   style="height: 900px;width: 100%"></div>
    	</div>
        <a href='<c:url value="/ko/index.do?pageid=g_01_01"/>' class="btn_back">돌아가기</a>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%= MessageSourceWrapper.getStaticMessage("kakaoAPIKey") %>&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
    let g_01_02 = (function () {
        let $container = $('#G_01_02');
        let selected = $.getUrlVars();

        let drawMap = function () {
            let mapContainer = document.getElementById('map'); // 지도를 표시할 div
            let mapOption = {
                center: new kakao.maps.LatLng(selected.la, selected.lo), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

            let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 마커를 표시할 위치와 title 객체 배열입니다
            let positions = [];
            positions.push({
                title: selected.parmacyNm,
                latlng: new kakao.maps.LatLng(selected.la, selected.lo)
            });

            // 마커 이미지의 이미지 주소입니다
            let imageSrc = '<%= MessageSourceWrapper.getStaticMessage("context.root")%><c:url value='/images/marker.png'/>';

            for (let i = 0; i < positions.length; i++) {
                // 마커 이미지의 이미지 크기 입니다
                let imageSize = new kakao.maps.Size(24, 35);
                // 마커 이미지를 생성합니다
                let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                // 마커를 생성합니다
                let marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: positions[i].latlng, // 마커를 표시할 위치
                    image: markerImage, // 마커 이미지
                    clickable: false
                });
                marker.setMap(map);
            }

        }

        let init = function () {
            drawMap();
            BIT.bindObjectData(selected, {$parent: $container.find('.map_info')});
        };

        let registerEventHandler = function () {
        };

        return {
            init: function () {
                init();
                registerEventHandler();
            }
        };
    })();

    g_01_02.init();
</script>