<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <div class="scroll-t" id="topcontrol">
        <i class="scroll-i"></i>
    </div>
    <div class="wrap">

        <div class="main">
        	<form name="defaultForm" id="defaultForm" method="POST" action="http://onejoy-life.com/product/productPayment">
            <div class="top-area clearfix">
                <div class="top-left">
                    <div class="iframebox">
                    	<c:if test="${list.product_live_type == 'U'}">
                        	<iframe src="https://www.youtube.com/embed/${list.product_youtube_id}?feature=oembed" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </c:if>
                        <c:if test="${list.product_live_type == 'M'}">
	                        <video class="moviebox" id="mov01" poster="" loop="" controls="true">
		                        <source src="http://onejoy-life.com${list.file_6}" type="video/mp4" />
		                    </video>
	                    </c:if>
                    </div>
                </div>
                <div class="summary">
                    <h2 class="product-title">${list.product_name}</h2>
                    <div class="price-area clearfix">
                        <p class="live-shopping-price"><ins><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원</ins><del>
                        <span class="price-before"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</span></del></p>
                        <p class="price-s">
                            <span class="onsale">Sale!</span>
                            <span class="onfeatured off">Featured!</span>
                        </p>
                    </div>
                    <div class="views-count">
                        조회수 <span>75,690</span> 
                        <div class="star-rating">
                            <span class="star-i">★★★★★</span>
                            <span class="star-num">5</span>
                        </div>
                        <div class="heart-thumb">
                            <button type="button" class="heart-btn">
                                <span class="heart-i"></span>
                            </button>
                            <span class="heart-count">724</span>
                        </div>
                    </div>
                    <div class="button-area">
	                    ${option}
	                    <input type="hidden" name="payment_order_quantity" value="1">
	                    <input type="hidden" name="order_max" value="${list.product_max_limit}" />
		                <input type="hidden" name="order_min" value="${list.product_min_limit}" />
		                <input type="hidden" name="product_delivery_bundle_yn" value="${list.product_delivery_bundle_yn}" />
		                <input type="hidden" name="product_user_ud" value="${list.product_user_ud}" />
		                <input type="hidden" name="product_cd" value="${list.product_cd}" />
		                <input type="hidden" name="email" value="${sessionScope.email}" />
		                <input type="hidden" name="login" value="${sessionScope.login}" />
	                    <button type="button" class="cart-btn" id="paymentSubmit">구매하기</button>
                    </div>
                </div>
            </div>
            </form>
            <div class="creators-p">
                <div class="profile-head">
                    <a href="">
                        <img src="../assets/img/Alexa.png" alt="">
                        <span>Alexa Ilacad</span>
                    </a>
                </div>
                <div class="short-description">
                    <p>
                        Hi guys! It’s me, Alexa! Thank you for coming back to my channel again!🙋🏻‍♀️<br>
                        This is such a holy grail! your lips will be much sexier with these 2 velvet lip tint colors!😍<br>
                        More information is in the video! so never skip it!😊🤪
                    </p>
                    <p>&nbsp;</p>
                    <p>*More shades will be added in a few weeks*</p>
                </div>
                <div class="container-box">
                    <div class="tab-box">
                        <ul>
                            <li><a href="#sec1" class="description-a">상세설명</a></li>
                            <li><a href="#sec2" class="reviews-a">리뷰 <span>(${searchVO.totRow})</span></a></li>
                        </ul>
                    </div>
                    <div class="content1" id="sec1">
                        <div class="content-img" >
                            ${list.product_html}
                        </div>
                    </div>
                    <div class="content2" id="sec2">
                        <div class="content-reviews">
                            <h3>
                                <span class="re-product-t">${list.product_name}</span> 에 대한 <span>${searchVO.totRow}</span> 개의 리뷰가 있습니다.
                            </h3>
                            <h5><span>${scoreAvg}</span></h5>
                            <div class="rating-bars-box">
                                <div class="rating-bar">
                                    <div class="rating-start">
                                        <span class="star1 active">★</span>
                                        <span class="star2 active">★</span>
                                        <span class="star3 active">★</span>
                                        <span class="star4 active">★</span>
                                        <span class="star5 active">★</span>
                                    </div>
                                    <div class="rating-percentage-bar">
                                        <span class="percntage"></span>
                                    </div>
                                    <div class="rating-count">
                                        <span>21</span>
                                    </div>
                                </div>
                            </div>
                            <div class="rating-bars-box">
                                <div class="rating-bar">
                                    <div class="rating-start">
                                        <span class="star1 active">★</span>
                                        <span class="star2 active">★</span>
                                        <span class="star3 active">★</span>
                                        <span class="star4 active">★</span>
                                        <span class="star5">★</span>
                                    </div>
                                    <div class="rating-percentage-bar">
                                        <span class="percntage"></span>
                                    </div>
                                    <div class="rating-count">
                                        <span>0</span>
                                    </div>
                                </div>
                            </div>
                            <div class="rating-bars-box">
                                <div class="rating-bar">
                                    <div class="rating-start">
                                        <span class="star1 active">★</span>
                                        <span class="star2 active">★</span>
                                        <span class="star3 active">★</span>
                                        <span class="star4">★</span>
                                        <span class="star5">★</span>
                                    </div>
                                    <div class="rating-percentage-bar">
                                        <span class="percntage"></span>
                                    </div>
                                    <div class="rating-count">
                                        <span>0</span>
                                    </div>
                                </div>
                            </div>
                            <div class="rating-bars-box">
                                <div class="rating-bar">
                                    <div class="rating-start">
                                        <span class="star1 active">★</span>
                                        <span class="star2 active">★</span>
                                        <span class="star3">★</span>
                                        <span class="star4">★</span>
                                        <span class="star5">★</span>
                                    </div>
                                    <div class="rating-percentage-bar">
                                        <span class="percntage"></span>
                                    </div>
                                    <div class="rating-count">
                                        <span>0</span>
                                    </div>
                                </div>
                            </div>
                            <div class="rating-bars-box">
                                <div class="rating-bar">
                                    <div class="rating-start">
                                        <span class="star1 active">★</span>
                                        <span class="star2">★</span>
                                        <span class="star3">★</span>
                                        <span class="star4">★</span>
                                        <span class="star5">★</span>
                                    </div>
                                    <div class="rating-percentage-bar">
                                        <span class="percntage active"></span>
                                    </div>
                                    <div class="rating-count">
                                        <span>0</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comments clearfix">
                            <div class="wcpr-grid clearfix">
                            	<c:if test="${not empty reviewList}">
                   				<c:forEach var="list" items="${reviewList}">
                                <div class="grid-content">
                                    <a href="">
                                        <div class="reviews-img">
                                        	<c:if test="${not empty list.file_1}">
                                            	<img src="${list.file_1}" alt="">
                                           	</c:if>
                                        </div>
                                        <div class="reviews-content">
                                            <h3 class="author"><span>${list.email}</span></h3>
                                            <div class="rating-start">
                                            	<c:forEach var="i" begin="1" end="${list.review_score}">
                                                <span class="star1 active">★</span>
                                                </c:forEach>
                                            </div>
                                            <div class="review-content">
                                            	<b>${list.review_title}</b>
                                            	<br>
                                                ${list.review_content}
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                </c:forEach>
                                </c:if>
                            </div>
                        </div>
                        <div class="related-product clearfix">
                            <h4>비슷한 상품</h4>
                            <div class="related-box">
                                <div class="related-img-box">
                                    <a href="">
                                        <img src="../assets/img/sold-out.png" alt="" class="sold-out-img">
                                       <img src="../assets/img/3ce.png" alt="">
                                   </a>
                                </div>
                                <div class="related-txt">
                                     <p class="related-tit">
                                        <a href="">Quick and easy drawing eyes! – 3CE Super Slim Pen Eyeliner</a>
                                    </p>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="loop">
                                        <a href=""><span>KDRESSER MD</span></a>
                                    </p>
                                    <p class="view-count">
                                        조회수 <span>75,690</span> 
                                    </p>
                                </div>
                            </div>
                            <div class="related-box">
                                <div class="related-img-box">
                                    <a href="">
                                         <img src="../assets/img/sold-out.png" alt="" class="sold-out-img">
                                        <img src="../assets/img/3ce.png" alt="">
                                    </a>
                                </div>
                                <div class="related-txt">
                                     <p class="related-tit">
                                        <a href="">Quick and easy drawing eyes! – 3CE Super Slim Pen Eyeliner</a>
                                    </p>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="loop">
                                        <a href=""><span>KDRESSER MD</span></a>
                                    </p>
                                    <p class="view-count">
                                        조회수 <span>75,690</span> 
                                    </p>
                                </div>
                            </div>
                            <div class="related-box">
                                <div class="related-img-box">
                                    <a href="">
                                        <img src="../assets/img/sold-out.png" alt="" class="sold-out-img">
                                       <img src="../assets/img/3ce.png" alt="">
                                   </a>
                                </div>
                                <div class="related-txt">
                                     <p class="related-tit">
                                        <a href="">Quick and easy drawing eyes! – 3CE Super Slim Pen Eyeliner</a>
                                    </p>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="loop">
                                        <a href=""><span>KDRESSER MD</span></a>
                                    </p>
                                    <p class="view-count">
                                        조회수 <span>75,690</span> 
                                    </p>
                                </div>
                            </div>
                            <div class="related-box">
                                <div class="related-img-box">
                                    <a href="">
                                        <img src="../assets/img/sold-out.png" alt="" class="sold-out-img">
                                       <img src="../assets/img/3ce.png" alt="">
                                   </a>
                                </div>
                                <div class="related-txt">
                                     <p class="related-tit">
                                        <a href="">Quick and easy drawing eyes! – 3CE Super Slim Pen Eyeliner</a>
                                    </p>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="loop">
                                        <a href=""><span>KDRESSER MD</span></a>
                                    </p>
                                    <p class="view-count">
                                        조회수 <span>75,690</span> 
                                    </p>
                                </div>
                            </div>
                            <div class="related-box">
                                <div class="related-img-box">
                                    <a href="">
                                       <img src="../assets/img/3ce.png" alt="">
                                   </a>
                                </div>
                                <div class="related-txt">
                                     <p class="related-tit">
                                        <a href="">Quick and easy drawing eyes! – 3CE Super Slim Pen Eyeliner</a>
                                    </p>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="loop">
                                        <a href=""><span>KDRESSER MD</span></a>
                                    </p>
                                    <p class="view-count">
                                        조회수 <span>75,690</span> 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       <div class="other-area">
           <div class="other-in">
               <div class="panel-img">
                   <img src="../assets/img/lip.png" alt="">
               </div>
               <div class="panel-list">
                   <p class="panel-tit">MLBB is not too far from you – Velvet Lip Tint from 3CE</p>
                   <p class="panel-a">
                       <a href="#sec1"><span>상세설명</span></a>
                       <a href="#sec2">리뷰 <span>(24)</span></a>
                   </p>
               </div>
               <div class="panel-price">
                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
               </div>
           </div>
       </div>
    </div>
    <div class="modal">
        <div class="modal-in clearfix">
            <div class="modal-close"><a href=""></a></div>
            <div class="modal-btn left-btn"><a href=""></a></div>
            <div class="modal-btn right-btn"><a href=""></a></div>
            <div class="modal-content">
                <div class="content-img">
                    <img src="../assets/img/lip-4.jpeg" alt="">
                </div>
                <div class="content-txt">
                    <div class="reviews-content">
                        <h3 class="author"><span>Roxanne</span></h3>
                        <div class="rating-start">
                            <span class="star1 active">★</span>
                            <span class="star2 active">★</span>
                            <span class="star3">★</span>
                            <span class="star4">★</span>
                            <span class="star5">★</span>
                        </div>
                        <div class="review-content">
                            Very hesitant at first because I am really not into pricey lippies. Yep I am quite “kuripot” so my lipsticks are usually worth 200-300! But maybe there’s something in 3CE that convinced me to avail not only one but twoooo 💓 Anddd yaaaaas I’m really loving it!!! 🥰💯 It is really worth the price! Superb! Plus may freebies pa na hindi ko alam kung pano gamitin 😝 First transaction and I know marami pang susunod. Kudos to kdresser 💋
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $('.gnb-submenu>li').mouseover(function(){
               $(this).children('.gnb-submenu-2dp').show(); 
            });
            $('.gnb-submenu>li').mouseleave(function(){
               $(this).children('.gnb-submenu-2dp').hide(); 
            });
            $('.gnb-submenu-2dp>li').mouseover(function(){
               $(this).children('.gnb-submenu-3dp').show().animate({
                   width: '200px'
               },100); 
            });
            $('.gnb-submenu-2dp>li').mouseleave(function(){
               $(this).children('.gnb-submenu-3dp').hide().animate({
                   width: '0px'
               },100); 
            });
        });
        $(document).ready(function(){
            $(".heart-btn .heart-i").on('click', function() {
                $(this).toggleClass('active');
            });
            
            $('.tab-box a').click(function(){
                event.preventDefault()
                var href = $(this).attr('href');
                var pos = $(href).offset().top;

                $('html,body').stop().animate({
                    scrollTop: pos
                })
            });
            $('.panel-a a').click(function(){
                event.preventDefault()
                var href = $(this).attr('href');
                var pos = $(href).offset().top;

                $('html,body').stop().animate({
                    scrollTop: pos
                })
            });
            $('.wcpr-grid').masonry({
                itemSelector: '.grid-content'
            });
            $(window).scroll(function(){
                var s_top = $(window).scrollTop();
                if(s_top > 500) {
                    $('.other-area').css ({
                        top:0,
                    })
                }
                else {
                    $('.other-area').css ({
                        top:-100,
                    })
                }
            });
        })

        $(document).ready(function(){
            $("#topcontrol").hide();
            $(function () {
            $(window).scroll(function () {
                    if ($(this).scrollTop() > 500) {
                        $('#topcontrol').fadeIn();
                    } else {
                        $('#topcontrol').fadeOut();
                    }
            });
            $('#topcontrol i').click(function () {
                    $('body,html').animate({
                        scrollTop: 0
                    }, 800);
                    return false;
                    });
            });
        });
        
    </script>
    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>