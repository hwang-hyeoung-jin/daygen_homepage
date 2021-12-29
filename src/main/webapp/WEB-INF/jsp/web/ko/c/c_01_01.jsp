<%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2021-06-01
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container products">
    <div class="sub_top">
        <div class="wrap_1296">
            <div class="txt_box">
                <h4>PRODUCTS</h4>
            </div>
        </div>
    </div>
    <div class="content sub_cont01">
        <div class="prd01" id="prd01">
            <div class="prd_cont">
                <div class="img_cont animated">
                    <img src='<c:url value='/images/web/products/prd01.png'/>' alt="퍼플루트:홍경천 더블 임팩트">
                </div>
                <div class="info_cont">
                    <label>약국 내 건강기능식품코너 제품</label>
                    <h5>퍼플루트 홍경천 더블 임팩트</h5>
                    <p>홍경천추출물 300mg 함유, 피로개선 및 스트레스 완화용 멀티 비타민</p>
                    <img src='<c:url value='/images/web/products/prd01_cont.png'/>' alt="성분">
                    <dl class="hidden">
                        <dd>· 홍경천추출물 300mg(로사빈 6.3mg) 
                            · 비타민B1 100mg(8,333%)
                            · 비타민B2 100mg(7,143%)
                            · 나이아신 100mg(667%)
                            · 판토텐산 100mg(2,000%)
                            · 비타민B6 100mg(6,667%)</dd>
                        <dd>· 엽산 700ug(175%)
                            · 비타민B12 1,000ug(41,667%)
                            · 비오틴 1,000ug(3,333%)
                            · 아연
                            · 셀렌
                            · 마그네슘</dd>
                        <dd>· 지초추출물분말
                            · 감태추출물분말
                            · L-테아닌
                            · L-아르기닌
                            · 타우린
                            · 비타민C</dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="prd02" id="prd02" style="margin-bottom: 0;">
            <div class="prd_cont">
                <div class="img_cont animated">
                    <img src='<c:url value='/images/web/products/prd02.png'/>' alt="퍼플루트:홍경천 더블 임팩트">
                </div>
                <div class="info_cont">
                    <label>약국 내 건강기능식품코너 제품</label>
                    <h5>퍼플루트 덴티케어 플렉스</h5>
                    <p>프로폴리스 + 칼슘 + 비타민D, 치아건강과 잇몸건강을 동시 만족</p>
                    <img src='<c:url value='/images/web/products/prd02_cont.png?ver=210805'/>' alt="성분">
                    <dl class="hidden">
                        <dd>·회화나무열매추출물 350mg(소포리코사이드 35mg)
                            ·홍삼(진세노사이드 합) 3mg
                            ·대두이소플라본 24mg
                            · 비오틴
                            · 비타민E분말
                            · 셀렌함유건조효모</dd>
                        <dd>· 감태추출물분말
                            · 지초추출물분말
                            · 석류추출물분발</dd>
                    </dl>
                </div>
            </div>
        </div>

        <div class="prd03" id="prd03">
            <div class="prd_cont">
                <div class="img_cont animated">
                    <img src='<c:url value='/images/web/products/prd03.png'/>' alt="퍼플루트 관절케어 플렉스">
                </div>
                <div class="info_cont">
                    <label>약국 내 건강기능식품코너 제품</label>
                    <h5>퍼플루트 관절케어 플렉스</h5>
                    <p>MSM 2,000mg 함유, 관절 및 연골건강에 도움을 줄 수 있음</p>
                    <img src='<c:url value='/images/web/products/prd03_cont.png'/>' alt="성분">
                    <dl class="hidden">
                        <dd>· MSM 2,000mg</dd>
                        <dd>· 호스웰리아추출분말
                            · 산호칼슘
                            · 지초추출분말
                            · 저분자피쉬콜라겐
                            · 10곡발효효소분말</dd>
                        <dd>· 비타민C
                            · 비타민D3
                            · 비타민E</dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="prd04" id="prd04">
            <div class="prd_cont">
                <div class="img_cont animated">
                    <img src='<c:url value='/images/web/products/prd04.png'/>' alt="퍼플루트 우먼케어 플렉스">
                </div>
                <div class="info_cont">
                    <label>약국 내 건강기능식품코너 제품</label>
                    <h5>퍼플루트 우먼케어 플렉스</h5>
                    <p>회화나무열매추출물+홍삼+대두이소플라본+비타민D<br/>
                        갱년기 여성의 건강에 도움을 줄 수 있음</p>
                    <img src='<c:url value='/images/web/products/prd04_cont.png'/>' alt="성분">
                    <dl class="hidden">
                        <dd>· 회화나무열매추출물 350mg
                            · 홍삼 (진세노사이드Rg1, Rb1 및 Rg3의 합 3mg)
                            · 대두이소플라본  24mg
                            · 비타민D 3ug </dd>
                        <dd>· 석류추출분말
                            · 지초추출분말
                            · 감태추출분말
                            · 비타민E
                            · 건조효모(셀렌함유)
                            · 비오틴</dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.prd01 .prd_cont').waypoint(function () {
            $('.prd01 .img_cont').addClass('fadeIn').css('opacity', '1');
        }, { offset: '70%' });
        $('.prd02 .prd_cont').waypoint(function () {
            $('.prd02 .img_cont').addClass('fadeIn').css('opacity', '1');
        }, { offset: '60%' });
        $('.prd03 .prd_cont').waypoint(function () {
            $('.prd03 .img_cont').addClass('fadeIn').css('opacity', '1');
        }, { offset: '70%' });
        $('.prd04 .prd_cont').waypoint(function () {
            $('.prd04 .img_cont').addClass('fadeIn').css('opacity', '1');
        }, { offset: '60%' });
    });
</script>