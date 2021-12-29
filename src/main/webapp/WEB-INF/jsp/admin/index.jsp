<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-dpi, user-scalable=no, target-density-dpi=device-dpi">
    <meta http-equiv="Pragma" content="no-cache">
    <meta name="description" content="데이젠 관리자">
    <meta name="naver-site-verification" content="">
    <meta property="og:type" content="website">
    <meta property="og:title" content="데이젠 관리자">
    <meta property="og:description" content="데이젠 관리자">
    <meta property="og:image" content="images/default.png">
    <meta property="og:url" content="">
    <title>데이젠 관리자</title>
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
    <script src="<c:url value='/scripts/Common.js'/>"></script>
    <link href="<c:url value='/css/jquery-ui.min.css'/>" rel="stylesheet"/>
    <link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
    <link rel="shortcut icon" href='<c:url value="/images/favicon.ico"/>'>
    <link rel="stylesheet" href='<c:url value="/css/reset.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/font.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/common.css"/>'>
    <link href="<c:url value='/css/BITCommon.css'/>" rel="stylesheet"/>
</head>

<body>
<div class="layout login">
    <form action="<c:url value='/admin/login.do'/>" method="post" modeltype="daygen.model.Logical.LoginModel">
        <div class="cnt">
            <h1 class="tit">관리자 로그인</h1>
            <dl class="ipt_area">
                <dt>
                    <label for="iptId">관리자 ID</label>
                </dt>
                <dd>
                    <input type="text" id="iptId" name="userid" class="ipt_id" tabindex="1" placeholder="아이디를 입력하세요."/>
                </dd>
                <dt>
                    <label for="iptPw">관리자 PW</label>
                </dt>
                <dd>
                    <input type="password" id="iptPw" name="password" class="ipt_pw" tabindex="2" placeholder="패스워드를 입력하세요."/>
                </dd>
            </dl>
            <button type="submit" id="btnLogin" class="btn_login" tabindex="3">로그인</button>
        </div>
    </form>
</div>

<script type="text/javascript">
    let login = (function () {
        let $container = $('form');

        let init = function () {
            BIT.validate($('form'), function (response) {
            }, function (arr, $form, options) {
                for (let i = 0; i < arr.length; i++) {
                    if (arr[i].name == 'password') {
                        arr[i].value = CryptoJS.SHA256(arr[i].value).toString();
                    }
                }
            });
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

    login.init();
</script>

</body>
</html>
