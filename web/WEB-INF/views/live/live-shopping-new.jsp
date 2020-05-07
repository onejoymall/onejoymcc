<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <section class="main-section">
        <h2 class="main-section-title hide">main section</h2>
        <article class="main-slider">
            <h3 class="main-slider-title hide">main slider</h3>
            <div class="main-slider-inner">
                <ul class="main-slider-wrap">
                    <li id="main-slide-1"><a href="#"></a></li>
                    <li id="main-slide-2"><a href="#"></a></li>
                    <li id="main-slide-3"><a href="#"></a></li>
                    <li id="main-slide-4"><a href="#"></a></li>
                </ul>
            </div>
        </article>
        <article class="live-shopping-wrap">
                <div class="inner clearfix">
                    <div class="list-wrap">
                        <h3>인기 상품</h3>
                        <div class="live-shopping-list shop-slider">
                            <div class="live-shopping-item">
                                <a href="/view">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img1.png" />
                                        <span class="video-time">8:12</span>
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
                            <div class="live-shopping-item">
                                <a href="#">
                                   <div class="imgbox">
                                        <img src="../assets/img/live-img2.png" />
                                        <span class="video-time">5:25</span>
                                        <div class="sold-out"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p></a>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
                                    <p class="live-shopping-score">
                                        <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                        <span class="score-text">5,324개 평가</span>
                                        <span class="score-number">4.5</span>
                                    </p>
                                </div>
                            </div>
                            <div class="live-shopping-item">
                                <a href="#">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img3.png" />
                                        <span class="video-time">12:36</span>
                                        <div class="sold-out active"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비 해요</p></a>
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
                        <h3>할인 상품</h3>
                        <div class="live-shopping-list shop-slider">
                            <div class="live-shopping-item">
                                <a href="/view">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img1.png" />
                                        <span class="video-time">8:12</span>
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
                            <div class="live-shopping-item">
                                <a href="#">
                                   <div class="imgbox">
                                        <img src="../assets/img/live-img2.png" />
                                        <span class="video-time">5:25</span>
                                        <div class="sold-out"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p></a>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
                                    <p class="live-shopping-score">
                                        <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                        <span class="score-text">5,324개 평가</span>
                                        <span class="score-number">4.5</span>
                                    </p>
                                </div>
                            </div>
                            <div class="live-shopping-item">
                                <a href="#">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img3.png" />
                                        <span class="video-time">12:36</span>
                                        <div class="sold-out active"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비 해요</p></a>
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
                        <h3> 상품</h3>
                        <div class="live-shopping-list shop-slider">
                            <div class="live-shopping-item">
                                <a href="/view">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img1.png" />
                                        <span class="video-time">8:12</span>
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
                            <div class="live-shopping-item">
                                <a href="#">
                                   <div class="imgbox">
                                        <img src="../assets/img/live-img2.png" />
                                        <span class="video-time">5:25</span>
                                        <div class="sold-out"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p></a>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
                                    <p class="live-shopping-score">
                                        <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                        <span class="score-text">5,324개 평가</span>
                                        <span class="score-number">4.5</span>
                                    </p>
                                </div>
                            </div>
                            <div class="live-shopping-item">
                                <a href="#">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img3.png" />
                                        <span class="video-time">12:36</span>
                                        <div class="sold-out active"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비 해요</p></a>
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
                        <h3> 상품</h3>
                        <div class="live-shopping-list">
                            <div class="live-shopping-item">
                                <a href="/view">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img1.png" />
                                        <span class="video-time">8:12</span>
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
                            <div class="live-shopping-item">
                                <a href="#">
                                   <div class="imgbox">
                                        <img src="../assets/img/live-img2.png" />
                                        <span class="video-time">5:25</span>
                                        <div class="sold-out"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p></a>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
                                    <p class="live-shopping-score">
                                        <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                        <span class="score-text">5,324개 평가</span>
                                        <span class="score-number">4.5</span>
                                    </p>
                                </div>
                            </div>
                            <div class="live-shopping-item">
                                <a href="#">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img3.png" />
                                        <span class="video-time">12:36</span>
                                        <div class="sold-out active"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비 해요</p></a>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
                                    <p class="live-shopping-score">
                                        <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                        <span class="score-text">5,324개 평가</span>
                                        <span class="score-number">4.5</span>
                                    </p>
                                </div>
                            </div>
                            <div class="live-shopping-item">
                                <a href="/view">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img1.png" />
                                        <span class="video-time">8:12</span>
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
                            <div class="live-shopping-item">
                                <a href="#">
                                   <div class="imgbox">
                                        <img src="../assets/img/live-img2.png" />
                                        <span class="video-time">5:25</span>
                                        <div class="sold-out"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p></a>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
                                    <p class="live-shopping-score">
                                        <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                        <span class="score-text">5,324개 평가</span>
                                        <span class="score-number">4.5</span>
                                    </p>
                                </div>
                            </div>
                            <div class="live-shopping-item">
                                <a href="#">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img3.png" />
                                        <span class="video-time">12:36</span>
                                        <div class="sold-out active"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비 해요</p></a>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
                                    <p class="live-shopping-score">
                                        <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                        <span class="score-text">5,324개 평가</span>
                                        <span class="score-number">4.5</span>
                                    </p>
                                </div>
                            </div>
                            <div class="live-shopping-item">
                                <a href="/view">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img1.png" />
                                        <span class="video-time">8:12</span>
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
                            <div class="live-shopping-item">
                                <a href="#">
                                   <div class="imgbox">
                                        <img src="../assets/img/live-img2.png" />
                                        <span class="video-time">5:25</span>
                                        <div class="sold-out"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p></a>
                                    <p class="live-shopping-price"><ins>469,000원</ins><del><span class="price-before">415,000원</span></del></p>
                                    <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
                                    <p class="live-shopping-score">
                                        <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                                        <span class="score-text">5,324개 평가</span>
                                        <span class="score-number">4.5</span>
                                    </p>
                                </div>
                            </div>
                            <div class="live-shopping-item">
                                <a href="#">
                                    <div class="imgbox">
                                        <img src="../assets/img/live-img3.png" />
                                        <span class="video-time">12:36</span>
                                        <div class="sold-out active"><p>SOLD OUT</p></div>
                                   </div>
                                </a>
                                <div class="item-info">
                                    <a href="#"><p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비 해요</p></a>
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
                </div>
        </article>
    </section>

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
        
        $('.main-slider-wrap').bxSlider({
            auto:true,
            autoHover:true,
            speed:500,
            mode:'fade',
            autoControls:false,
            pager:true,
            controls:false,
            useCSS:false,
            touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
        });
        $('.shop-slider').bxSlider({
            auto:false,
            mode:'horizontal',
            slideWidth:346,
            moveSlides:1,
            maxSlides:3,
            autoControls:false,
            pager:false,
            controls:true,
            useCSS:false,
            touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
        });
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
