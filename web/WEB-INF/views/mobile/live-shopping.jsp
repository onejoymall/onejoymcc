<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/main-header"/>

    <div class="main-sliderLS mt-1">
        <ul class="main-slider-wrap">
            <li><a href="#"><img src="../../assets/img/m-main-slider-img1.png" alt="메인이벤트1"></a></li>
            <li><a href="#"><img src="../../assets/img/m-main-slider-img2.png" alt="메인이벤트2"></a></li>
            <li><a href="#"><img src="../../assets/img/m-main-slider-img3.png" alt="메인이벤트3"></a></li>
        </ul>
    </div>
    <article class="live-shopping-wrap">
        <div class="inner clearfix">
            <div class="list-wrap">
                <h3 class="p-2">인기 상품</h3>
                <div class="live-shopping-list shop-slider">
                	<c:if test="${not empty productList}">
                    <c:forEach var="list" items="${productList}">
                    <div class="live-shopping-item">
                        <a href="/view?product_cd=${list.product_cd}">
                            <div class="imgbox">
                                <img src='${list.file_1}' onerror="this.src='http://placehold.it/340x190'" height="190">
                                <!-- <span class="video-time">8:12</span> -->
                                <!-- <div class="sold-out"><p>SOLD OUT</p></div> -->
                            </div>
                        </a>
                        <div class="item-info">
                            <a href="/view"><p class="live-shopping-title">${list.product_name}</p></a>
                            <p class="live-shopping-price"><ins><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</ins><del>
                           	<span class="price-before"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원</span></del></p>
                            <p class="live-shopping-user"><a href="#">${list.product_user_ud}</a></p>
                            <p class="live-shopping-score">
                                <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                <span class="score-text">5,324개 평가</span>
                                <span class="score-number">4.5</span>
                            </p>
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                    <div class="live-shopping-item">
                    	<a href="/view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img1.png" />
                                <!-- <span class="video-time">8:12</span> -->
                                <div class="sold-out"><p>SOLD OUT</p></div>
                            </div>
                        </a>
                        <div class="item-info">
                            <a href="/view"><p class="live-shopping-title">발뮤다 가습기 한달사용 솔직후기! 발뮤다 가습기가 인기 있는 이유는? 세 줄까지 작성 가능 </p></a>
                            <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                            <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
                            <p class="live-shopping-score">
                                <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                <span class="score-text">5,324개 평가</span>
                                <span class="score-number">4.5</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-wrap">
                <h3 class="p-2">할인 상품</h3>
                <div class="live-shopping-list shop-slider">
                    <c:if test="${not empty productSpList}">
                	<c:forEach var="list" items="${productSpList}">
                    <div class="live-shopping-item">
                        <a href="/view?product_cd=${list.product_cd}">
                            <div class="imgbox">
                                <img src='${list.file_1}' onerror="this.src='http://placehold.it/340x190'" height="190">
                                <!-- <span class="video-time">8:12</span> -->
                                <!-- <div class="sold-out"><p>SOLD OUT</p></div> -->
                            </div>
                        </a>
                        <div class="item-info">
                            <a href="/view"><p class="live-shopping-title">${list.product_name}</p></a>
                            <p class="live-shopping-price"><ins><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</ins><del>
                           	<span class="price-before"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원</span></del></p>
                            <p class="live-shopping-user"><a href="#">${list.product_user_ud}</a></p>
                            <p class="live-shopping-score">
                                <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                <span class="score-text">5,324개 평가</span>
                                <span class="score-number">4.5</span>
                            </p>
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                </div>
            </div>
            <div class="list-wrap">
                <h3 class="p-2">상품</h3>
                <div class="live-shopping-list shop-slider">
                    <c:if test="${not empty productList}">
                	<c:forEach var="list" items="${productList}">
                    <div class="live-shopping-item">
                        <a href="/view?product_cd=${list.product_cd}">
                            <div class="imgbox">
                                <img src='${list.file_1}' onerror="this.src='http://placehold.it/340x190'" height="190">
                                <!-- <span class="video-time">8:12</span> -->
                                <!-- <div class="sold-out"><p>SOLD OUT</p></div> -->
                            </div>
                        </a>
                        <div class="item-info">
                            <a href="/view"><p class="live-shopping-title">${list.product_name}</p></a>
                            <p class="live-shopping-price"><ins><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</ins><del>
                           	<span class="price-before"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원</span></del></p>
                            <p class="live-shopping-user"><a href="#">${list.product_user_ud}</a></p>
                            <p class="live-shopping-score">
                                <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                <span class="score-text">5,324개 평가</span>
                                <span class="score-number">4.5</span>
                            </p>
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </article>
    <div>
        <ul class="flexaround border-n">
            <li>
                <a href="#"><i class="icon join i-big"></i>회원가입</a>
            </li>
            <li>
                <a href="#"><i class="icon epoint i-big"></i>E-POINT 안내</a>
            </li>
            <li>
                <a href="#"><i class="icon faq i-big"></i>자주하는 질문</a>
            </li>
        </ul>
    </div>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
        $('.main-slider-wrap').bxSlider({
            auto:true,
            autoHover:true,
            speed:500,
            mode:'horizontal',
            autoControls:false,
            pager:true,
            controls:false,
            useCSS:false,
            touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
        });
        $('.shop-slider').bxSlider({
            auto:false,
            autoHover:true,
            speed:500,
            mode:'horizontal',
            autoControls:false,
            pager:false,
            controls:true,
            useCSS:false,
            responsive:true,
            slideMargin:10,
            slideWidth:320,
            maxSlides:10,
            touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
        });
    });
</script>