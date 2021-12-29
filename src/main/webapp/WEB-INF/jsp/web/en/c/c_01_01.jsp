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
                    <img src='<c:url value='/images/web/products/prd01.png'/>' alt="Purpleroot Hong Gyeong-cheon double impact">
                </div>
                <div class="info_cont">
                    <label>Health Functional Food Corner Product in Pharmacy</label>
                    <h5>Purpleroot Hong Gyeong-cheon double impact</h5>
                    <p>Contains 300 mg of Rose Root, better known as Hong Gyeong-<br/>cheon extract, a multi-vitamin for fatigue improvement and stress<br/>mitigation.</p>
                    <img src='<c:url value='/images/webEN/products/prd01_cont.png'/>' alt="성분">
                    <dl class="hidden">
                        <dd>· Contains 300 mg of Rose Root (Rosavin 6.3mg)
							· Vitamin B1 100mg(8,333%)
							· Vitamin B2 100mg(7,143%)
							· Vitamin B6 100mg(6,667%)
							· Vitamin B12 1,000ug(41,667%)
							· Biotin 1,000ug(3,333%)
							· Folic acid 700ug(175%)
							· Pantothenic acid 100mg(2,000%)
							· Niacin 100mg(667%)</dd>
							                        <dd>· Rose Root extract powder
							· Ecklonia Cava extract powder
							· L-theanine
							· L-arginine
							· Taurine
							· Vitamin C</dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="prd02" id="prd02" style="margin-bottom: 0;">
            <div class="prd_cont">
                <div class="img_cont animated">
                    <img src='<c:url value='/images/web/products/prd02.png'/>' alt="Purpleroot denticare flex">
                </div>
                <div class="info_cont">
                    <label>Health Functional Food Corner Product in Pharmacy</label>
                    <h5>Purpleroot denticare flex</h5>
                    <p>Propolis + Calcium + Vitamin D, Simultaneous satisfaction of both<br/>dental health and gum health.</p>
                    <img src='<c:url value='/images/webEN/products/prd02_cont.png?ver=210805'/>' alt="성분">
                    <dl class="hidden">
                        <dd>· Propolis extract powder 212.4mg
							· Calcium 245mg
							· Vitamin D 20ug </dd>
							                        <dd>· Rose Root extract powder
							· Ecklonia Cava extract powder
							· Fish collagen
							· Vitamin C</dd>
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
                    <label>Health Functional Food Corner Product in Pharmacy</label>
                    <h5>Purpleroot jointcare flex</h5>
                    <p>Contains MSM 2,000mg, helpful for improvement of joint and<br/>cartilage health</p>
                    <img src='<c:url value='/images/webEN/products/prd03_cont.png'/>' alt="성분">
                    <dl class="hidden">
                        <dd>· MSM 2,000mg</dd>
                        <dd>· Frankincense 
							· Coral calcium
							· Rose Root extract powder
							· Low molecular weight fish collagen
							· 10-grain fermentation enzyme powder
							· Vitamin C
							· Vitamin D3
							· Vitamin E</dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="prd04" id="prd04">
            <div class="prd_cont">
                <div class="img_cont animated">
                    <img src='<c:url value='/images/web/products/prd04.png'/>' alt="Purpleroot womencare flex">
                </div>
                <div class="info_cont">
                    <label>Health Functional Food Corner Product in Pharmacy</label>
                    <h5>Purpleroot womencare flex</h5>
                    <p>Pomegranate fruit extract+Red ginseng+Soy isoflavones+Vitamin D<br/>
Helpful for improvement of menopause.</p>
                    <img src='<c:url value='/images/webEN/products/prd04_cont.png'/>' alt="성분">
                    <dl class="hidden">
                        <dd>· Pomegranate fruit extrac 350mg
							· Red ginseng (Ginsenoside 3mg sum of Rg1, Rb1 and Rg3)
							· Soy isoflavones 24mg
							· Vitamin D 3ug </dd>
							                        <dd>· Pomegranate Extract Powder
							· Rose Root extract powder
							· Ecklonia Cava extract powde
							· Vitamin E
							· Dry yeast (contains selenium)
							· Biotin</dd>
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