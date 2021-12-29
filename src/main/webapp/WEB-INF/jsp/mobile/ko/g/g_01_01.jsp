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
    <div class="content sub_cont01" id="G_01_01">
        <div class="map_top mb100">
            <div class="wrap_1296">
                <div class="map_search">
                    <div class="ipt_box">
                        <input type="text" placeholder="검색하실 약국명 입력" class="ipt_text" name="searchText"/>
                        <button type="button" name="btnSearch">검색</button>
                    </div>
                </div>
            </div>
            <!-- 지도 width 100% height 655-->
            <div class="map_top_box" id="mainMap" style="width:100%;height: 655px"></div>
            <div class="wrap_1296">
                <h5>검색 결과</h5>
                <table class="tbl_result">
                    <caption>리스트</caption>
                    <colgroup>
                        <col style="width:40%">
                        <col style="width:60%">
                    </colgroup>
                    <tbody name="tbodySubParmacyList">
                    <tr>
                        <td colspan='2' style='height: 50px;text-align: center;line-height:50px;font-size:22px;'>검색결과가 없습니다.</td>
                    </tr>
                    </tbody>
                </table>
                <div class="pager" name="pagerSub"></div>
            </div>
        </div>
        <div class="wrap_1296">
            <p class="title">제품 판매처 - 전체</p>
            <div class="search_top">
                <select class="sel_common" name="ctprvn">
                    <option value="">시/도 선택</option>
                </select>
                <select class="sel_common" name="signgu">
                    <option value="">시/군/구 선택</option>
                </select>
            </div>
            <div>
                <table class="tbl_list">
                    <caption>제품판매처</caption>
                    <colgroup>
                        <col style="width:40%">
                        <col style="width:60%">
                    </colgroup>
                    <tbody name="tbodyParmacyList">
                    <!--기본5개-->
                    </tbody>
                </table>
                <div class="pager" name="pager"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-tmpl" id="tmplCtprvnList">
    {% for (let i=0, data; data=o[i]; i++) { %}
	<option value="{%= data.ctprvn %}">{%= data.ctprvn %}</option>
    {% } %}

</script>

<script type="text/x-tmpl" id="tmplSignguList">
    {% for (let i=0, data; data=o[i]; i++) { %}
	<option value="{%= data.signgu %}">{%= data.signgu %}</option>
    {% } %}

</script>

<script type="text/x-tmpl" id="tmplSubParmacyList">
    {% for (let i=0, data; data=o[i]; i++) { %}
    <tr data-data="{%=JSON.stringify(data)%}">
        <td>
            <h6>{%= data.parmacyNm %}</h6>
        </td>
        <td>
            <p>{%= data.adres01 %} {%= data.adres02 %}</p>
            <span>{%= data.telno %}</span>
        </td>
    </tr>
    {% } %}


</script>

<script type="text/x-tmpl" id="tmplParmacyList">
    {% for (let i=0, data; data=o[i]; i++) { %}
	<tr data-data="{%=JSON.stringify(data)%}">
		<td>{%= data.parmacyNm %}</td>
        <td class="txt_l">
        	<h5>{%= data.adres01 %} {%= data.adres02 %}</h5>
        	<p>{%= data.telno %}</p>
        </td>
	</tr>
    {% } %}

</script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%= MessageSourceWrapper.getStaticMessage("kakaoAPIKey") %>&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
    let g_01_01 = (function () {
        let $container = $('#G_01_01');
        let currentPage = parseInt(BIT.isNullOrEmpty($.getUrlVar('pageNumber')) ? 1 : $.getUrlVar('pageNumber'));
        let searchData = {};
        let subSearchData = {};
        let subCurrentPage = 1;
        let parmacyList = [];

        let getCtprvnList = function () {
            return BIT.callAjax('<c:url value="/frontparmacy/getCtprvnList.do" />', 'post', {}, function (response) {
                if (response.IsSucceed) {
                    $container.find("[name=ctprvn]").empty().append("<option value=''>시/도 선택</option>").append(tmpl('tmplCtprvnList', response.Data));
                }
            });
        };

        let getSignguList = function (param) {
            return BIT.callAjax('<c:url value="/frontparmacy/getSignguList.do" />', 'post', {ctprvn: param}, function (response) {
                if (response.IsSucceed) {
                    $container.find("[name=signgu]").empty().append("<option value=''>시/군/구 선택</option>").append(tmpl('tmplSignguList', response.Data));
                }
            });
        }

        let subSearch = function () {
            subSearchData = $.extend({}, $container.getObject(), {
                pageSize: 5,
                pageNumber: subCurrentPage
            });

            return BIT.callAjax('<c:url value="/frontparmacy/getParmacyList.do" />', 'post', subSearchData, function (response) {
                if (response.IsSucceed) {
                    if (response.totalrecords > 0) {
                        $container.find('[name=tbodySubParmacyList]').empty().append(tmpl('tmplSubParmacyList', response.rows));

                        let options = {
                            format: "[< nncnn >]",
                            perpage: subSearchData.pageSize,
                            lapping: 0,
                            page: response.pagenum,
                            onSelect: function (page) {
                                subCurrentPage = isNaN(page) ? 1 : page;
                                if (subCurrentPage != response.pagenum) {
                                    COM.showLoading();
                                    subSearch().done(function () {
                                        COM.hideLoading();
                                    });
                                }
                            },
                        };
                        parmacyList = response.rows;
                        drawMap(parmacyList);
                        COM.pager($container.find('[name=pagerSub]'), response.totalrecords, options);
                        $container.find('[name=pagerSub]').show();
                    } else {
                        $container.find('[name=tbodySubParmacyList]').empty().append("<tr><td colspan='2' style='height: 50px;text-align: center;line-height:50px'>검색결과가 없습니다.</td></tr>");
                        $container.find('[name=pagerSub]').hide();
                    }
                }
            });
        }

        let search = function () {
            searchData = $.extend({}, $container.getObject(), {
                pageSize: 10,
                pageNumber: currentPage
            });

            return BIT.callAjax('<c:url value="/frontparmacy/getParmacyList.do" />', 'post', searchData, function (response) {
                if (response.IsSucceed) {
                    if (response.totalrecords > 0) {
                        $container.find('[name=tbodyParmacyList]').empty().append(tmpl('tmplParmacyList', response.rows));

                        let options = {
                            format: "[< nncnn >]",
                            perpage: searchData.pageSize,
                            lapping: 0,
                            page: response.pagenum,
                            onSelect: function (page) {
                                currentPage = isNaN(page) ? 1 : page;
                                if (currentPage != response.pagenum) {
                                    COM.showLoading();
                                    search().done(function () {
                                        COM.hideLoading();
                                    });
                                }
                            },
                        };

                        COM.pager($container.find('[name=pager]'), response.totalrecords, options);
                        $container.find('[name=pager]').show();
                    } else {
                        $container.find('[name=tbodyParmacyList]').empty().append("<tr><td colspan='6' style='height: 50px;text-align: center;line-height:50px'>검색결과가 없습니다.</td></tr>");
                        $container.find('[name=pager]').hide();
                    }
                }
            });
        };

        let drawMap = function (arr) {
            let mapContainer = document.getElementById('mainMap'); // 지도를 표시할 div
            let selected = arr.find(function (m) {
                return m.selected === true;
            });
            if (BIT.isNullOrEmpty(selected)) {
                selected = arr[0];
            }
            let mapOption = {
                center: new kakao.maps.LatLng(selected.la, selected.lo), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

            let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 마커를 표시할 위치와 title 객체 배열입니다
            let positions = [];
            for (let i = 0; i < arr.length; i++) {
                positions.push({
                    title: arr[0].parmacyNm,
                    latlng: new kakao.maps.LatLng(arr[i].la, arr[i].lo)
                });
            }

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
                    clickable: true
                });
                // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
                let content = '<div class="marker_info"><h4>' + arr[i].parmacyNm + '</h4><p>' + arr[i].adres01 + ' ' + arr[i].adres02 + '</p><p>' + arr[i].telno + '</p></div>';

                // 인포윈도우를 생성합니다
                let overlay = new kakao.maps.CustomOverlay({
                    content: content,
                    map: map,
                    position: marker.getPosition(),
                    xAnchor: 0,        // 오버레이이의 위치 조정
                    yAnchor: 1.5       // 오버레이이의 위치 조정
                });

                // 마커에 클릭이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', function () {
                    // 마커 위에 인포윈도우를 표시합니다
                    overlay.setMap(map);
                });
                kakao.maps.event.addListener(map, 'click', function () {
                    // 마커 위에 인포윈도우를 표시합니다
                    overlay.setMap(null);
                });
            }
        }

        let init = function () {
            searchData = location.href.queryStringToJSON();
            BIT.bindObjectData(searchData, {$parent: $container});
        };

        let lazyInit = function () {
            getCtprvnList().done(function () {
                search();
                let arr = [];
                arr.push({
                    parmacyNm: '데이젠',
                    la: '37.30070986064357',
                    lo: '127.07116800826071',
                    adres01: '경기도 용인시 수지구 광교중앙로 338',
                    adres02: '광교우미뉴브 A동 421~2호',
                    telno: '031-215-8814'
                });
                drawMap(arr);
            });
        };

        let registerEventHandler = function () {
            $container.find("[name=ctprvn]").change(function () {
                getSignguList($(this).val()).done(function () {
                    search();
                });
            });

            $container.find("[name=signgu]").change(function () {
                search();
            });

            $container.find('[name=btnSearch]').click(function () {
                subCurrentPage = 1;
                subSearch();
            });

            $container.find('[name=searchText]').keydown(function (e) {
                if (e.keyCode === 13) {
                    $container.find('[name=btnSearch]').trigger('click');
                }
            });

            $container.find('[name=tbodyParmacyList]').on("click", "tr", function () {
                $('.dim').show();
                $('.layer_pop').fadeIn();

                let data = $(this).closest("tr").data("data");

                // 약국 정보 조회수 증가
                BIT.callAjax('<c:url value="/frontparmacy/addRdcnt.do" />', 'post', {parmacyPid: data.parmacyPid}, function (response) {
                    if (response.IsSucceed) {

                    }
                });
                location.href = '<c:url value="/ko/index.do?pageid=g_01_02" />&' + $(data).convertQueryString();
            });

            $container.find('[name=tbodySubParmacyList]').on('click', 'tr', function () {
                let selected = $(this).data('data');
                parmacyList.forEach(function (m) {
                    m.selected = false;
                });
                parmacyList.find(function (m) {
                    return m.parmacyPid === selected.parmacyPid
                }).selected = true;
                drawMap(parmacyList);
            });

            $('.layer_pop .btn_close').on('click', function () {
                $('.layer_pop').hide();
                $('.dim').hide();
            });
        };

        return {
            init: function () {
                init();
                registerEventHandler();
                $(function () {
                    lazyInit();
                });
            }
        };
    })();

    g_01_01.init();
</script>