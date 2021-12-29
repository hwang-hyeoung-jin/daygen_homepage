<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="grinbi.utility.siteMap.SiteMapLoader" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2021-06-01
  Time: 오후 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="grinbi.message.MessageSourceWrapper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-dpi, user-scalable=no, target-density-dpi=device-dpi" />
    <meta http-equiv="Pragma" content="no-cache" />
    <!--<meta name="description" content="데이젠, daygen, 헬스케어, 건강기능식품, 지초, 감태, 퍼플루트, 홍경천, 홍경천더블임팩트, 덴티케어플렉스" />-->
	<meta name="description" content="차별화된 기능성 소재와 특허기술을 바탕으로 건강기능식품 시장을 선도하는 기업" />
    <meta name="naver-site-verification" content="c2cb3010d9468e5d77c0fbcbdd48b8babcad3f51" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="데이젠 | daygen" />
  <!--  <meta property="og:description" content="데이젠, daygen, 헬스케어, 건강기능식품, 지초, 감태, 퍼플루트, 홍경천, 홍경천더블임팩트, 덴티케어플렉스" />-->
	<meta property="og:description" content="차별화된 기능성 소재와 특허기술을 바탕으로 건강기능식품 시장을 선도하는 기업" />
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
    <script src="<c:url value='/scripts/web/ScrollTrigger.min.js'/>"></script>
    <script src="<c:url value='/scripts/web/swiper.js'/>"></script>
    <script src="<c:url value='/scripts/web/ui.js'/>"></script>
    <link rel="canonical" href="https://www.daygen.co.kr/">
    <link href="<c:url value='/css/jquery-ui.min.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/jquery.fileupload.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/viewer.css'/>" rel="stylesheet"/>
    <link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
    <link rel="stylesheet" href="<c:url value='/css/web/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/font.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/web/layout.css?ver=210812'/>">
    <link rel="stylesheet" href="<c:url value='/css/web/common.css?ver=210615'/>">
    <link rel="stylesheet" href="<c:url value='/css/web/swiper.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/web/demo.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/web/animate.css'/>">
    <link href="<c:url value='/css/BITCommon.css'/>" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <script>
        // 모바일 이동
        var mobile = (/iphone|ipad|ipod|android|blackberry|mini|windowssce|palm/i.test(navigator.userAgent.toLowerCase()));
        if (mobile) {
            window.location.href = "https://m.daygen.co.kr";
        }
		// HTTPS 강제이동
		if (window.location.protocol != "https:") {
			//window.location.href = "https:" + window.location.href.substring(window.location.protocol.length);
		}
    </script>
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
	<!-- popup -->
	<div id="layerPop01" class="layer_pop01">
        <div class="layer_pop01_cont">
            <form name="form_today01">
                <table class="todayPop01_table">
                    <tr>
                        <td class="todayPop01_top ">
                            <div>
                            	<a href="https://www.daynshop.com/" target="_blank">
                                	<!-- <img src='<c:url value='/images/popup/landing_page.jpg'/>' alt="데이젠팝업" /> -->
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="todayPop_bottom01">
                            <ul>
                                <li class="bottom_l">
                                    <input type="checkbox" id="inputTodayChk01" name="input_chk01" class="input_chk" value="checkbox" onfocus="this.blur();">
                                    <label for="inputTodayChk01">오늘 하루 이 창을 열지 않음</label>
                                </li>
                                <li class="bottom_r">
                                    <a href="javascript:;" class="layer_pop_close_01">닫기
                                    </a>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="layout">
        <div class="header">
            <div class="wrap_1620">
                <h1 class="logo">
                    <a href='<c:url value='/ko/default.do'/>'></a>
                </h1>

                <%= SiteMapLoader.getLocalNavigationBar("Front_ko", new HashMap<String, String>() {{
                    put("gnbYn", "Y");
                }}, 1) %>
                <div class="language">
                    <a href="javascript:;" class="on">KOR</a>
                    <em></em>
                    <a href='<c:url value="/en/default.do" /> '>ENG</a>
                </div>
            </div>
        </div>
        <button type="button" class="btn_top"></button>
        
        <div class="container index" id="Main">
            <div class="content cont01">
                <div class="swiper-container visual-slide">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src='<c:url value='/images/web/index/slide01.jpg'/>' />
                        </div>
                        <div class="swiper-slide">
                            <img src='<c:url value='/images/web/index/slide02.jpg'/>' />
                        </div>
                        <div class="swiper-slide">
                            <img src='<c:url value='/images/web/index/slide03.jpg'/>' />
                        </div>
                        <div class="swiper-slide">
                            <img src='<c:url value='/images/web/index/slide04.jpg'/>' />
                        </div>
                    </div>
                </div>
                <div class="cont_txt">
                    <div class="wrap_1296">
                        <img src='<c:url value='/images/web/index/visual_logo.png'/>' />
                        <p>차별화된 기능성 소재와 특허기술을 바탕으로<br/>
                            건강기능식품을 개발하는 헬스케어 전문기업</p>
                    </div>
                </div>
                <span class="deco_scroll animated infinite fadeInDown">
                    <img src='<c:url value='/images/web/common/ico_scroll.png'/>' />
                </span>
            </div>
            <div class="content cont02 sub_cont" id="visual01">
                <div class="wrap_1296">
                    <div class="contbox">
                        <p><strong>사업분야</strong></p>
                        <div class="prd_box">
                            <div class="box_wrap prd01">
                                <span class="prd_left" data-scroll="toggle(.fromBottomIn, .fromBottomOut)"></span>
                                <ul class="prd_left_sub">
                                    <li class="animated">
                                        <img src='<c:url value='/images/web/index/prd0101.png'/>' alt="건강기능식품" />
                                    </li>
                                    <li class="animated">
                                        <img src='<c:url value='/images/web/index/prd0102.png'/>' alt="일반식품" />
                                    </li>
                                    <li class="animated">
                                        <img src='<c:url value='/images/web/index/prd0103.png'/>' alt="기타제품" />
                                    </li>
                                </ul>
                            </div>
                            <em></em>
                            <div class="box_wrap prd02">
                                <span class="prd_right" data-scroll="toggle(.fromBottomIn, .fromBottomOut)"></span>
                                <ul class="prd_right_sub">
                                    <li class="animated">
                                        <img src='<c:url value='/images/web/index/prd0201.png'/>' alt="지초" />
                                    </li>
                                    <li class="animated">
                                        <img src='<c:url value='/images/web/index/prd0202.png'/>' alt="감태" />
                                    </li>
                                    <li class="animated">
                                        <img src='<c:url value='/images/web/index/prd0203.png'/>' alt="원료 발굴" />
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content cont03 sub_cont" id="visual02">
                <div class="wrap_1296">
                    <div class="contbox">
                        <div class="left">
                            <h3>TECHNOLOGY</h3>
                        </div>
                        <div class="right">
                            <div class="cont1" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                                <h4>지초 추출물</h4>
                                <p>Lithospermum Erythrorhizon Extract</p>
                            </div>
                            <div class="cont2" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                                <h4>감태 추출물</h4>
                                <p>Sea Trumpet Extract</p>
                            </div>
                        </div>
                        <a href='<c:url value='/ko/index.do?pageid=b_01_01'/>'>자세히보기<em></em></a>
                    </div>
                </div>
            </div>
            <div class="content cont04 sub_cont" id="visual03">
                <div class="contbox">
                    <h3>PRODUCTS</h3>
                    <div class="prd-slide swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide slide">
                            	<a href='<c:url value='/ko/index.do?pageid=c_01_01#prd01'/>'>
                                    <img src='<c:url value='/images/web/index/cont03_prd02.png'/>' alt="퍼플루트 홍경천 더블 임팩트" />
                                </a>
                            </div>
                            <div class="swiper-slide slide">
                                <a href='<c:url value='/ko/index.do?pageid=c_01_01#prd02'/>'>
                                    <img src='<c:url value='/images/web/index/cont03_prd03.png'/>' alt="퍼플루트 덴티케어 플렉스" />
                                </a>
                            </div>
                            <div class="swiper-slide slide">
                            	<a href='<c:url value='/ko/index.do?pageid=c_01_01#prd03'/>'>
                                    <img src='<c:url value='/images/web/index/cont03_prd04.png'/>' alt="퍼플루트 관절케어 플렉스" />
                                </a>
                            </div>
                            <div class="swiper-slide slide">
                                <a href='<c:url value='/ko/index.do?pageid=c_01_01#prd04'/>'>
                                    <img src='<c:url value='/images/web/index/cont03_prd05.png'/>' alt="퍼플루트 우먼케어 플렉스" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="wrap_1620">
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
                
            </div>
            <div class="content cont05 sub_cont" id="visual04">
                <div class="wrap_1296">
                    <h3>NEWS</h3>
                    <div class="news_list">
                    	<ul name="BbsList"></ul>
                        <a href='<c:url value='/ko/index.do?pageid=e_01_01'/>' class="btn_more">더보기<em></em></a>
                    </div>
                </div>
            </div>
        </div>

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
    
    <script>
        $(document).ready(function () {
            new Swiper('.visual-slide', {
                speed: 500,
                loop: true,
                autoplay: true,
                effect: "fade"
            });

            new Swiper('.prd-slide', {
                speed: 500,
                loop: true,
                slidesPerView: 2,
                spaceBetween: 0,
                slidesPerGroup: 2,
                navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
                },
            });
        });

        $(document).ready(function () {
            $('.prd_box span').on('mouseenter', function () {
                $(this).next().children().addClass('fadeIn').css('opacity', '1');
                $(this).addClass('on');
                $('.prd_box em').hide()
            });

            $('.prd_box .box_wrap').on('mouseleave', function () {
                $(this).children('span').next().children().removeClass('fadeIn').css('opacity', '0');
                $(this).children('span').removeClass('on');
                $('.prd_box em').show()
            });
        });
    </script>
    
    <script type="text/x-tmpl" id="tmplBbsList">
    {% for (let i=0, data; data=o[i]; i++) { %}
	<li data-data="{%=JSON.stringify(data)%}">
		<a href='<c:url value="/ko/index.do?pageid=e_01_02&bbsPid="/>{%= data.bbsPid %}'>
			<div class="thumb">
				<img src='<%= MessageSourceWrapper.getStaticMessage("file.uploadPath") %>/{%=  data.category + '/' + data.virtualName %}' alt="news thumb">
			</div>
			<div class="info">
				<label>{%= data.clTypeCode %}</label>
				<h4>{%= BIT.htmlDecode(data.sj) %}</h4>
				<span class="date">{%= BIT.convertToDate(data.creatDt).toString('yyyy.MM.dd') %}</span>
			</div>
		</a>
	</li>
    {% } %}
	</script>
<!-- 
    <script type="text/javascript">
    (function () {
        $.fn.layerPop01 = function (options) {
            var defaults = {
                wrap: $(this), // 레이어 팝업
                speed: 400, // 페이드인 속도
                mask: 'layer_mask01', // 마스크 클래스명
                close: 'layer_pop_close_01', // 닫기버튼 클래스명
            }

            var options = $.extend({}, defaults, options);

            var _hei = $(window).outerHeight();
            var _mask = document.createElement('div');
            _mask.setAttribute('class', options.mask);
            $('body').prepend(_mask);
            $('.' + options.mask).css('height', _hei)

            options.wrap.fadeIn(options.speed);
            $('.' + options.mask).fadeIn(options.speed * 2);

            var _scrollTop = $(window).scrollTop()
            var _contTop = ($(window).height() - options.wrap.height()) / 2
            var _popTop = _scrollTop + _contTop
            _contTop > 0 ? options.wrap.css('top', _popTop) : options.wrap.css('top', _scrollTop);

            $('.' + options.close).on('click', function () {
                closeLayer01();
                options.wrap.fadeOut(0);
                options.wrap.find('iframe').remove();
                $('.' + options.mask).remove();
            })
        }
    })(jQuery)
	</script>
 -->
	<script type="text/javascript">
    // 쿠키 셋팅
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setDate(todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    }

    // 체크시 쿠키셋팅 실행
    function closeLayer01() {
        if ($('form[name=form_today01] input[name=input_chk01]').prop('checked')) { // form name, input name, check boolean
            setCookie("today01", "start01", 1);
        }
    }

    // 초기설정
    $(function () {
        cookiedata = document.cookie;
        if (cookiedata.indexOf("today01=start01") == -1) {
            $('#layerPop01').layerPop01();
        }
        
        //기간팝업 날짜설정
        //var sdate = new Date("2021/06/15 00:00:00");
       // var edate = new Date("2021/08/28 00:00:00");

        //if (Date.now() >= sdate && Date.now() <= edate && cookiedata.indexOf("today01=start01") == -1) {
         //   $('#layerPop01').layerPop01();
        //}
    })
    
    let index_ko = (function () {
        let $container = $('#Main');
        let param = {
            modelType: 'daygen.model.Logical.BbsSearchModel',
            pageSize: 3,
            pageNumber: 1,
            clturTypeCode: 'KO'
        };

        let getBbsList = function () {
            return BIT.callAjax('<c:url value="/frontbbs/getBbsList.do" />', 'post', param, function (response) {
                if (response.IsSucceed) {
                    if (response.totalrecords > 0) {
                        $container.find('[name=BbsList]').append(tmpl('tmplBbsList', response.rows));
                    } else {
                        $container.find('[name=BbsList]').empty().append("<div style='text-align: center; line-height: 100px; font-size: 15px'>뉴스가 없습니다.</div>");
                    }
                }
            });
        };

        let init = function () {
            getBbsList();
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

    index_ko.init();
    </script>
</body>
</html>