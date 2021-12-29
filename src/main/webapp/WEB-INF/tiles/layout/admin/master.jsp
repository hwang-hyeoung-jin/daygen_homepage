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
    <meta name="viewport" content="width=device-dpi, user-scalable=no, target-density-dpi=device-dpi">
    <meta http-equiv="Pragma" content="no-cache">
    <meta name="description" content="데이젠 관리자">
    <meta name="naver-site-verification" content="">
    <meta property="og:type" content="website">
    <meta property="og:title" content="데이젠 관리자">
    <meta property="og:description" content="데이젠 관리자">
    <%--    <meta property="og:image" content='<c:url value="/images/default.png" />'>--%>
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
    <script src="<c:url value='/scripts/jquery_file_upload/jquery.fileupload.js'/>"></script>
    <script src="<c:url value='/scripts/jquery_file_upload/load-image.min.js'/>"></script>
    <script src="<c:url value='/scripts/jquery_file_upload/jquery.fileupload-process.js'/>"></script>
    <script src="<c:url value='/scripts/jquery_file_upload/jquery.fileupload-image.js'/>"></script>
    <script src="<c:url value='/scripts/jquery_file_upload/jquery.fileupload-validate.js'/>"></script>
    <script src="<c:url value='/scripts/jquery_file_upload/jquery.fileupload-ui.js'/>"></script>
    <script src="<c:url value='/scripts/jquery_file_upload/jquery.fileupload-video.js'/>"></script>
    <script src="<c:url value='/scripts/jquery_file_upload/jquery.fileupload-audio.js'/>"></script>
    <script src="<c:url value='/scripts/jquery_file_upload/jquery.iframe-transport.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.nicescroll.min.js'/>"></script>
    <script src="<c:url value='/scripts/Common.js'/>"></script>
    <script src="<c:url value='/scripts/tinymce5/tinymce.min.js'/>"></script>
    <script src="<c:url value='/scripts/tinymce5/jquery.tinymce.min.js'/>"></script>
    <link href="<c:url value='/css/jquery-ui.min.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/jquery.fileupload.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/viewer.css'/>" rel="stylesheet"/>
    <link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/font.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/swiper.min.css'/>">
    <link href="<c:url value='/css/BITCommon.css'/>" rel="stylesheet"/>
    <script type="text/javascript">
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
    <div class="head">
        <h1 class="logo">데이젠 관리 페이지</h1>
        <div class="nav">
            <%= SiteMapLoader.getLocalNavigationBar("ADMIN", new HashMap<String, String>() {{
                put("gnbYn", "Y");
            }}, 1) %>

        </div>
    </div>
    <tiles:insertAttribute name="content"/>
</div>

<script type="text/javascript">

    let master = (function () {
        let $container = $('body');

        let lazyInit = function () {
            $('.lnb > li.selected > a').trigger('click');

            $('.layout').css('min-height', $(window).height());

            let _lnbNum = $('.cnt_tit h2').attr('class').substr(4, 1),
                _lnbSubNum = $('.cnt_tit h2').attr('class').substr(6, 1);
            $('.lnb > li:eq(' + (_lnbNum - 1) + ') > a').addClass('active').addClass('on').siblings().addClass('on');
            $('.lnb > li:eq(' + (_lnbNum - 1) + ') .lnb_sub > li:eq(' + (_lnbSubNum - 1) + ') a').addClass('active').addClass('on')
        };

        let registerEventHandler = function () {
            $('.lnb > li > a').on('click', function (e) {
                if ($(this).parent().is('.folder')) {
                    e.preventDefault();

                    function slideDown(target) {
                        slideUp();
                        $(target).addClass('on').next().next().slideDown();
                    }

                    function slideUp() {
                        $('.lnb > li > a').removeClass('on').next().next().slideUp();
                    }

                    $(this).hasClass('on') ? slideUp() : slideDown($(this));

                }
            });

            $container.find('[name=btnLogout]').click(function (e) {
                e.preventDefault();
                <%--BIT.callAjax('<c:url value="/_admin/user/logout.do" />', 'post', {}, function (response) {--%>
                <%--    if (response.IsSucceed) {--%>
                <%--        location.href = '<c:url value="/_admin/default.do" />';--%>
                <%--    }--%>
                <%--});--%>
            });
        };

        return {
            init: function () {
                registerEventHandler();
                $(function () {
                    lazyInit();
                });
            }
        };
    })();
    master.init();
</script>
</body>
</html>