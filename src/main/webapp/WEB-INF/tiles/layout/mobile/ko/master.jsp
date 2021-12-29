<%@ page import="java.util.HashMap" %>
<%@ page import="grinbi.utility.siteMap.SiteMapLoader" %>
<%@ page import="java.lang.reflect.Member" %>
<%@ page import="grinbi.membership.MembershipProvider" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=720, user-scalable=no, target-density-dpi=device-dpi" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta name="description" content="데이젠, daygen, 헬스케어, 건강기능식품, 지초, 감태, 퍼플루트, 홍경천, 홍경천더블임팩트, 덴티케어플렉스" />
    <meta name="naver-site-verification" content="c2cb3010d9468e5d77c0fbcbdd48b8babcad3f51" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="데이젠 | daygen" />
    <meta property="og:description" content="데이젠, daygen, 헬스케어, 건강기능식품, 지초, 감태, 퍼플루트, 홍경천, 홍경천더블임팩트, 덴티케어플렉스" />
    <meta property="og:image" content="/images/Daygen_og_image.jpg" />
    <meta property="og:url" content="https://www.daygen.co.kr/" />
    <title>데이젠 | daygen</title>
    <script src="<c:url value='/scripts/globalization/messages-ko.js'/>"></script>
    <script src="<c:url value='/scripts/BITPrototype.js'/>"></script>
    <script src="<c:url value='/scripts/jquery-1.12.3.min.js'/>"></script>
    <script src="<c:url value='/scripts/jquery-ui-1.12.1.custom.min.js'/>"></script>
    <script src="<c:url value='/scripts/json2.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.xml2json.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.form.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.format-1.3.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.validate.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.cookie.js'/>"></script>
    <script src="<c:url value='/scripts/aes.js'/>"></script>
    <script src="<c:url value='/scripts/sha256.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.paging.js'/>"></script>
    <script src="<c:url value='/scripts/q.js'/>"></script>
    <script src="<c:url value='/scripts/tmpl.min.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.dialogextend.min.js'/>"></script>
    <script src="<c:url value='/scripts/viewer.min.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.fileDownload.js'/>"></script>
    <script src="<c:url value='/scripts/datepicker.min.js'/>"></script>
    <script src="<c:url value='/scripts/BITCommon.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.nicescroll.min.js'/>"></script>
    <script src="<c:url value='/scripts/Common.js'/>"></script>
    <script src="<c:url value='/scripts/mobile/ScrollTrigger.min.js'/>"></script>
    <script src="<c:url value='/scripts/mobile/swiper.js'/>"></script>
    <script src="<c:url value='/scripts/mobile/ui.js'/>"></script>
    <link href="<c:url value='/css/jquery-ui.min.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/jquery.fileupload.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/viewer.css'/>" rel="stylesheet"/>
    <link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
    <link rel="stylesheet" href="<c:url value='/css/mobile/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/font.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/mobile/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/mobile/common.css?ver=210727'/>">
    <link rel="stylesheet" href="<c:url value='/css/mobile/swiper.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/mobile/demo.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/mobile/animate.css'/>">
    <link href="<c:url value='/css/BITCommon.css'/>" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=G-S7P8PQG70R"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}	
	  gtag('js', new Date());
	  gtag('config', 'G-S7P8PQG70R');	
	</script>
</head>
<body>
<!--로딩-->
<div id="divLoading" style="display: none" class="loading-box">
    <div class="txt-area">
        <p class="big-text">데이터를 불러오는 중입니다.</p>
        <p class="small-text">잠시만 기다려주시기 바랍니다.</p>
    </div>
</div>
<div class="layout">
	<%= SiteMapLoader.getLocalNavigationBar("Front_ko", new HashMap<String, String>() {{
        put("gnbYn", "Y");
    }}, 1) %>
	<div class="header">
        <div class="top">
            <a id="btnLnbClose" class="btn_lnb_close" href="javascript:;">닫기</a>
            <a id="btnHam" class="btn_ham" href="javascript:;">메뉴</a>
            <h1 class="logo">
                <a href='<c:url value='/ko/default.do'/>'></a>
            </h1>
            <div class="language">
                <a href='<c:url value="/en/default.do" /> '>ENG</a>
            </div>
        </div>
    </div>
    <button type="button" class="btn_top"></button>
    <tiles:insertAttribute name="content"/>
    <div class="footer">
        <div class="wrap_1620">
            <h2 class="ft_logo">Daygen</h2>
            <div class="info">
                <p>경기도 용인시 수지구 광교중앙로 338 광교우미뉴브 A동 421~2호<br />
                    <strong>TEL </strong>031-215-8814<em class="space"></em><strong>FAX</strong>031-215-8815
                </p>
                <p>COPYRIGHT ⓒ Daygen, Inc. All rights reserved.</p>
            </div>
        </div>
    </div>
</div>

</body>
</html>