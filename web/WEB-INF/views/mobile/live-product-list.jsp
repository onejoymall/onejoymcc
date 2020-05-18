<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/main-header.jsp" %>

    <article class="live-shopping-wrap">
        <div class="inner clearfix">
            <div class="list-wrap wrap">
               <!-- <div class="input-group py-1">
                   <h3 class="width-50">총 <span>341</span>개의 영상이 있습니다.</h3>
                    <select name="list-sort" id="list-sort">
                        <option value="인기 순">인기 순</option>
                        <option value="조회수 순">조회수 순</option>
                        <option value="평가 순">평가 순</option>
                        <option value="최신 순">최신 순</option>
                    </select>
               </div> -->
                <c:if test="${not empty categoryRowData.pd_category_name}">
                	<h3>${categoryRowData.pd_category_name} 카테고리</h3>
               	</c:if>
                <c:if test="${not empty param.product_name}">
                	<h3>"${param.product_name}" 검색결과</h3>
               	</c:if>
                <hr class="mb-2">
                <div class="live-shopping-list resp">
                    <c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}">
                    <div class="live-shopping-item">
                        <a href="/view?product_cd=${list.product_cd}">
                            <div class="imgbox">
                                <c:if test="${list.product_live_type == 'U'}">
                                	<img src='http://img.youtube.com/vi/${list.product_youtube_id}/0.jpg' onerror="this.src='http://placehold.it/340x190'">
                               	</c:if>
                               	<c:if test="${list.product_live_type == 'M'}">
                                    <video style="width:100%">
										<source src="http://onejoy-life.com${list.file_6}" type="video/mp4">
									</video>
                                </c:if>
                                <!-- <span class="video-time">8:12</span> -->
                                <!-- <div class="sold-out"><p>SOLD OUT</p></div> -->
                            </div>
                        </a>
                        <div class="item-info">
                            <a href="/view?product_cd=${list.product_cd}"><p class="live-shopping-title">${list.product_name}</p></a>
                            <p class="live-shopping-price"><ins><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원</ins><del>
                           	<span class="price-before"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</span></del></p>
                            <p class="live-shopping-user"><a href="/view?product_cd=${list.product_cd}">${list.product_user_ud}</a></p>
                            <p class="live-shopping-score">
                                <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                <span class="score-text">5,324개 평가</span>
                                <span class="score-number">4.5</span>
                            </p>
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                <!-- <ul class="centerBtns mt-3">
                    <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
                    <li><a href="#" class="active">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
                </ul> -->
            </div>
        </div>
    </article>

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