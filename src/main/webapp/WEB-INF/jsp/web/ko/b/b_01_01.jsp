<%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2021-06-01
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container tech">
    <div class="sub_top">
        <div class="wrap_1296">
            <div class="txt_box">
                <h4>TECHNOLOGY</h4>
            </div>
        </div>
    </div>
    <div class="content sub_cont01">
        <div class="wrap_1296">
            <ul>
                <li class="animated">
                    <h4>소재기술</h4>
                    <p>개별인정형 소재기술력을 바탕으로<br/>
                        다이어트, 면역개선, 갱년기 증상개선 등<br> 
                        기능성 연구</p>
                </li>
                <li class="animated">
                    <h4>연구개발</h4>
                    <p>소재 연구개발에 특화된<br />
                        전문인력을 통한<br />
                        건강기능, 치료용 물질개발</p>
                </li>
                <li class="animated">
                    <h4>재배산지 특화</h4>
                    <p>재배산지 특화사업을 통한<br />
                        원자재 고품질화 및<br />
                        원가 경쟁력 확보</p>
                </li>
            </ul>
        </div>
    </div>
    <div class="content sub_cont02">
        <div class="wrap_1296">
            <div class="left">
                <h3>브랜드 스토리</h3>
            </div>
            <div class="right" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                <img src="<c:url value='/images/web/technology/cont02_tit.png'/>" alt="퍼플루트" />
                <p>퍼플루트(Purple root)는 지초의 뿌리를 뜻하는 자근(紫根:보라색 뿌리)과 건강한 여성의 아름다움을 상징하는 보라색의 이미지를 상징합니다. 퍼플루트(Purple root)는 근감소 억제와 근육형성에 
                    탁월한 효과를 가진 “지초추출물”과 수면질 개선 및 여성갱년기에 도움을 주는 “감태추출물”로 만든 데이젠의 건강기능식품 전문브랜드 입니다. 퍼플루트의 모든 제품은 박사급 연구진으로 구성된 자사 연구소와 한국식품 연구원이 공동으로 개발한 원료를 사용하고, 전문약사가 직접 기획하여 만들어집니다.</p>
            </div>
        </div>
    </div>
    <div class="content sub_cont03">
        <div class="wrap_1296">
            <div>
                <div class="wrap_top">
                    <div class="left" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                        <h3>지초(지치)<span>Lithospermum Erythrorhizon</span></h3>
                        <p>약용으로 사용되는 지초(지치)는 전남 진도가 주요 산지이며, 한국, 중국, 일본에서 자생합니다. 한의학<br />
                            대사전에서 지초(지치)는 혈분에서 열사를 없애고 해독하며, 발진을 순조롭게 하며 혈액 순환을 촉진하고<br />
                            새살이 빨리 돋아나게 한다고 합니다. 이렇게 약용으로 주로 활용되는 지초는 진도 홍주의 원료로도<br />
                            사용되어 안정성 또한 입증된 원료입니다.<br /><br />
                            이렇게 건강에 도움을 줄 수 있는 지초(지치)에서 추출한 시코닌(Shikonin)은 근육 활성화를 통한 복합적인<br />
                            건강기능 개선효과를 발휘하여 퇴행성 질환을 예방하고, 근육량을 유지하여 다이어트시 나타날 수 있는<br />
                            요요현상을 억제할 수 있습니다.</p>
                    </div>
                    <div class="right">
                        <img src="<c:url value='/images/web/technology/cont03_img01.png'/>" alt="지초 이미지" />
                    </div>
                </div>
                <div class="bottom">
                    <img src="<c:url value='/images/web/technology/cont03_img02.png'/>" alt="지초 내용" />
                </div>
            </div>
            <div class="bd_dot">
                <div class="wrap_bottom">
                    <div class="left">
                        <img src="<c:url value='/images/web/technology/cont03_img03.png'/>" alt="감태 이미지" />
                    </div>
                    <div class="right" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                        <h3>감태<span>Ecklonia Cava; Sea Trumpet</span></h3>
                        <p>남해안과 제주도에서 자생하는 감태는 대중들의 인지도가 높은 안전한 건강기능식품 자원으로 후코이단과<br />
                            플로로타닌 성분을 함유하고 있으며, 항산화효과, 항암효과, 항염효과, 노화 억제효과 및 고혈압 억제효과<br />
                            등에 우수한 것으로 생명과학대사전에서 언급하고 있습니다.<br /><br />
                            이렇게 건강에 도움을 줄 수 있는 감태 추출물(Sea Trumpet Extract)은 아르긴산, 요오드, 칼륨 등의<br />
                            영양소를 통해 여성호르몬 조절 능력과 골다공증 개선 효과를 가진 우수한 원료로 알려져 있습니다.</p>
                    </div>
                </div>
                <div class="bottom">
                    <img src="<c:url value='/images/web/technology/cont03_img04.png'/>" alt="감태 내용" />
                </div>
            </div>
        </div>
    </div>
    <div class="content sub_cont04">
        <div class="swiper-container tech-slide">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="<c:url value='/images/web/technology/slide01.jpg'/>" />
                </div>
                <div class="swiper-slide">
                    <img src="<c:url value='/images/web/technology/slide02.jpg'/>" />
                </div>
                <div class="swiper-slide">
                    <img src="<c:url value='/images/web/technology/slide03.jpg'/>" />
                </div>
                <div class="swiper-slide">
                    <img src="<c:url value='/images/web/technology/slide04.jpg'/>" />
                </div>
            </div>
            <div class="wrap_1620">
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.sub_cont04').waypoint(function () {
            new Swiper('.tech-slide', {
                speed: 500,
                loop: true,
                autoplay: {
                    delay: 2000,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                effect: "fade"
            });
        }, { offset: '70%' });

        $('.sub_cont01').waypoint(function () {
            $('.sub_cont01 ul li').addClass('fadeInUp').css('opacity', '1');
        }, { offset: '70%' });
    });
</script>