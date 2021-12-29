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
                    <h4>Material Technology</h4>
                    <p>Research in functionality including diet,<br/>immunity improvement and improvement of<br/>menopausal symptoms on basis of Individual<br/>Recognition Material Technical Prowess. </p>
                </li>
                <li class="animated">
                    <h4>Research & Development</h4>
                    <p>Development of health function and<br/>treatment substances by expert manpower<br/>dedicated to material research &<br/>development. </p>
                </li>
                <li class="animated">
                    <h4>Specification of cultivation area</h4>
                    <p>Securing of high-quality raw material and<br/>cost competitiveness via specialized<br/>business of cultivation area</p>
                </li>
            </ul>
        </div>
    </div>
    <div class="content sub_cont02">
        <div class="wrap_1296">
            <div class="left">
                <h3>BRAND STORY</h3>
            </div>
            <div class="right" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                <img src="<c:url value='/images/webEN/technology/cont02_tit.png'/>" alt="Purple Root" />
                <p>Purple root symbolizes an image of purple which emblematizes both Lithospermum erythrorhizon(purple<br/>root) which refers to ganoderma lucidum root and beauty of healthful female.<br/> 
Purple Root is Daygen’s health functional food brand which is made up with ‘Gromwell Extract’ which<br/>shows an excellent effect in suppressing sarcopenia and formulating muscles, and ‘Ecklonia Cava<br/>Extract’, better known as gamtae which is helpful for improvement of quality of sleep and female<br/>menopause.<br/> 
All the products of Purple Root are made by using the raw materials which are jointly developed by<br/>Daygen’s Research Institute which is composed of PhD level researchers and researchers of Korea Food<br/>Research Institute under the direct planning of expert pharmacists. </p>
            </div>
        </div>
    </div>
    <div class="content sub_cont03">
        <div class="wrap_1296">
            <div>
                <div class="wrap_top">
                    <div class="left" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                        <h3>Lithospermum Erythrorhizon</h3>
                        <p>Jindo in South Jeolla Province is the main production area of Lithosperm um erythrorhizon for medicinal use, which grows wild in Korea, China and Japan. According to The Encyclopedia of Oriental Medicine, Lithospermum erythrorhizon removes heat killing in blood meal, (a disease-causing element in The amount of blood) detoxifies, smooths rash, facilitates blood circulation, and promotes proud flesh quickly. Lithospermum erythrorhizon, which is mainly utilized for medicinal use, is also used as an ingredient6 for Jindo Hongju Liquor, which is a proof for its stability.  Like this, shikonin extracted from Lithosperm um erythrorhizon, which would be pretty much good for health, exercises a composite effect of enhancing health functionality via muscular activation, and by doing so, the substance is capable of preventing degenerative diseases, keeping muscle mass and containing a yo-yo effect which might occur from dieting.</p>
                    </div>
                    <div class="right">
                        <img src="<c:url value='/images/web/technology/cont03_img01.png'/>" alt="지초 이미지" />
                    </div>
                </div>
                <div class="bottom">
                    <img src="<c:url value='/images/webEN/technology/cont03_img02.png'/>" alt="지초 내용" />
                </div>
            </div>
            <div class="bd_dot">
                <div class="wrap_bottom">
                    <div class="left">
                        <img src="<c:url value='/images/web/technology/cont03_img03.png'/>" alt="감태 이미지" />
                    </div>
                    <div class="right" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
                        <h3>Ecklonia Cava; Sea Trumpet</h3>
                        <p>Gamtae, or sea trumpet, which grows naturally in the southern coast of Korea and Jeju Island, is  the safe health functional food resource which holds the high- level recognition of the people  and contains (for containing) fucoidan and phlorotannin components. The Encyclopedia of Life Science states that gamtae, also known as Ecklonia cava which contains those ingredients, has a higher efficacy in antioxidation, anticancer, anti-inflammatory activities, anti-aging effect, and curbing of high blood pressure.
Thus, gamtae extract which is helpful for health is known to be a great ingredient which holds an effect in controlling female hormone and improving osteoporosisvia such nutrients as arginic acid, iodine and potassium. .</p>
                    </div>
                </div>
                <div class="bottom">
                    <img src="<c:url value='/images/webEN/technology/cont03_img04.png'/>" alt="감태 내용" />
                </div>
            </div>
        </div>
    </div>
    <div class="content sub_cont04">
        <div class="swiper-container tech-slide">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="<c:url value='/images/webEN/technology/slide01.jpg'/>" />
                </div>
                <div class="swiper-slide">
                    <img src="<c:url value='/images/webEN/technology/slide02.jpg'/>" />
                </div>
                <div class="swiper-slide">
                    <img src="<c:url value='/images/webEN/technology/slide03.jpg'/>" />
                </div>
                <div class="swiper-slide">
                    <img src="<c:url value='/images/webEN/technology/slide04.jpg'/>" />
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