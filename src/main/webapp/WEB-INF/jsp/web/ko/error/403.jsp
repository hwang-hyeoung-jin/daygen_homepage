<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2020-09-11
  Time: 오후 6:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-dpi, user-scalable=no, target-density-dpi=device-dpi" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta name="description" content="데이젠, daygen, 헬스케어, 건강기능식품, 지초, 감태, 근감소억제, 근육형성, 여성갱년기, 퍼플루트, 홍경천, 홍경천더블임팩트, 덴티케어플렉스" />
    <meta name="naver-site-verification" content="c2cb3010d9468e5d77c0fbcbdd48b8babcad3f51" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="데이젠 | daygen" />
    <meta property="og:description" content="데이젠, daygen, 헬스케어, 건강기능식품, 지초, 감태, 근감소억제, 근육형성, 여성갱년기, 퍼플루트, 홍경천, 홍경천더블임팩트, 덴티케어플렉스" />
    <meta property="og:image" content="/images/Daygen_og_image.jpg" />
    <meta property="og:url" content="https://www.daygen.co.kr" />
    <title>데이젠 | daygen</title>
    <link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
    <link rel="stylesheet" href="<c:url value='/css/web/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/font.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/web/layout.css'/>">
</head>
<body>
	<div class="layout">
		<div class="error">
		    <div class="wrap_1296">
		        <ul class="error_area">
		        	<li>
		        		<img src="<c:url value='/images/web/common/error_logo.png'/>" alt="daygen">
		        	</li>
		            <li>
		                <h3 class="name">403</h3>
		                <p class="tit">비정상적인 접근을 하였거나,<br/>허용되지 않은 값으로 인하여 오류가 발생하였습니다.</p>
		                <p class="desc">해당 페이지를 볼 수 있는 권한이 없거나 페이지를 확인 할 수 없습니다.<br/>정상적인 접근방법으로 다시 시도해주시기 바랍니다.</p>
		                <a class="btn_return" href='<c:url value="/ko/default.do" />'><em></em>첫 페이지로 돌아가기</a>
		            </li>
		        </ul>
		    </div>
		</div>
	</div>
</body>
</html>
