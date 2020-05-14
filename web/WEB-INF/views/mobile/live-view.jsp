<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>

<div class="underPurchase">
    <div class="content">
        <div class="closeBox">
            <button class="closeBtn"></button>  
        </div>
        <%--<div class="scroll">
            ${option}
            <div class="purchaseBox mb-1">
                <div class="item-delete">
                    <i class="ri-close-line"></i>
                </div>
                <h4>${list.product_name}</h4>
                <ul class="flexbetween">
                    <li class="width-35">
                        <div class="number-group">
                           <button class="button number-minus"></button>
                           <input type="number" value="1">
                           <button class="button number-plus"></button>
                        </div>
                    </li>
                    <li><h3><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span class="text-sm">원</span></h3></li>
                </ul>
            </div>
            <ul class="flexbetween mt-2 mb-5">
               &lt;%&ndash; <li>
                    <h3>총 합계금액</h3>
                </li>
                <li>
                    <h2 class="red">4,500<span class="text-sm">원</span></h2>
                </li>&ndash;%&gt;
            </ul>
        </div>--%>
        <button id="paymentSubmit" class="footerBtn">바로구매</button>
    </div>
    
</div>

<div class="underPop" id="review">
    <div class="content">
        <header>
           <h3>상품평 작성하기</h3>
            <button class="popClose">
                <i class="ri-close-line"></i>
            </button>
        </header>
        <content>
            <p class="text-md mt-2 mb-05">제목 *</p>
            <input type="text" class="width-100 mb-05" placeholder="50자 이내로 입력해주세요">
            <p class="text-md mt-1 mb-05">내용</p>
            <div class="textarea mt-05">
               <span>(0/1000자)</span>
               <textarea class="width-100"></textarea>
            </div>
            <p class="text-md mt-1 mb-05">이미지 첨부</p>
            <div class="mb-2">
                <input type="text" class="width-100 mb-1">
                <button class="btn btn-black width-50">파일찾기</button> <span class="ml-1 text-sm grey">1개 / 5MB 이하만 가능</span>
            </div>
            <ul class="btns mt-3 mb-0">
                <li><a href="#">취소</a></li>
                <li><a href="#" class="active">등록</a></li>
           </ul>
        </content>
    </div>
</div>
<div class="underPop" id="qna">
    <div class="content">
        <header>
           <h3>상품Q&A 작성하기</h3>
            <button class="popClose">
                <i class="ri-close-line"></i>
            </button>
        </header>
        <content>
            <p class="text-md mt-2 mb-05">제목 *</p>
            <input type="text" class="width-100 mb-05" placeholder="50자 이내로 입력해주세요">
            <input type="checkbox" id="replysns" class="b8 mt-1">
            <label for="replysns">비공개</label>
            <p class="text-md mt-2 mb-05">문의 유형 * </p>
            <select class="width-100">
                <option value="" selected>주문/결제</option>
            </select>
            <p class="text-md mt-1 mb-05">내용</p>
            <div class="textarea mt-05 mb-2">
               <span>(0/1000자)</span>
               <textarea class="width-100"></textarea>
            </div>
            <ul class="btns mt-2 mb-0">
                <li><a href="#">취소</a></li>
                <li><a href="#" class="active">등록</a></li>
           </ul>
        </content>
    </div>
</div>

<form name="defaultForm" id="defaultForm" method="POST" action="http://onejoy-life.com/product/productPayment">
    <section class="subheader">
        <div class="goods-slider-wrap">
            <div class="iframebox" style="padding-bottom:56%; position:relative;">
               <iframe style="position:absolute;" src="https://www.youtube.com/embed/${list.product_youtube_id}?feature=oembed" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
           </div>
            <div class="share-list">
                <a href="#none"><i class="facebook-ic"></i></a>
                <a href="#none"><i class="twitter-ic"></i></a>
                <a href="#none"><i class="kakao-ic"></i></a>
            </div>
        </div>
    </section>
    <section class="wrap">
       <h2 class="my-2">${list.product_name}</h2>
       <ul class="between">
           <li>
               <i class="ri-heart-line"></i>
               <h4>75,690</h4>
           </li>
           <li>
               <i class="ri-star-line"></i>
               <h4>5.0</h4>
           </li>
           <li>
               <i class="ri-eye-line"></i>
               <h4>724</h4>
           </li>
       </ul>
       <hr class="grey">
       <ul class="flexbetween py-05 mt-2">
           <li>판매가</li>
           <li class="line-through grey"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원</li>
       </ul>
       <%--<ul class="flexbetween py-05">
           <li>세일</li>
           <li class="line-through grey">5,400원</li>
       </ul>--%>
       <ul class="flexbetween py-05">
           <li>판매가</li>
           <li class="text-lg text-bold red"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" /><span class="text-sm">원</span></li>
       </ul>
       <div class="my-1">
            <hr class="grey">
            <h2 class="mb-05 mt-1"> Alexa Ilacad</h2>
            <p class="text-md">Hi guys! It’s me, Alexa! Thank you for coming back to my channel again!🙋🏻‍♀️ <br>
This is such a holy grail! your lips will be much sexier with these 2 velvet lip tint colors!😍 <br>
More information is in the video! so never skip it!😊🤪 <br><br>
*More shades will be added in a few weeks*</p>
        </div>
    </section>
    <section class="subheader">
       <ul class="shareBtns">
            <li><a href="javascript:wish()" class="wish">위시리스트</a></li>
            <li><a href="#" class="share">공유하기</a></li>
        </ul>
        <img src="../../assets/img/goods-view/bnr1.jpg" alt="" class="width-100">
        <ul class="taps" id="tap">
           <li><a href="javascript:move(1)" class="active">상품설명</a></li>
           <li><a href="javascript:move(2)">리뷰 <span class="red text-sm">65</span></a></li>
       </ul>        
        <div class="my-1" id="content01">
           <img src="../../assets/img/3ce.png" alt="" class="width-100">
        </div>
    </section>
    <section class="wrap">
        <div class="mt-4 mb-2" id="content02">
            <h3 class="mb-1"><span class="red text-lg">65</span>개의 리뷰가 있습니다.</h3>
            <hr>
            <div class="py-2">
                <h2 class="text-bold pb-2">5.0</h2>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick w-100"></div> 
                       </div>
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill opacity-5"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick w-100"></div> 
                       </div>
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill"></i><i class="ri-star-fill mx-02 opacity-5"></i><i class="ri-star-fill opacity-5"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick w-100"></div> 
                       </div>
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill opacity-5"></i><i class="ri-star-fill mx-02 opacity-5"></i><i class="ri-star-fill opacity-5"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick w-100"></div> 
                       </div>
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02 opacity-5"></i><i class="ri-star-fill opacity-5"></i><i class="ri-star-fill mx-02 opacity-5"></i><i class="ri-star-fill opacity-5"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick w-70"></div> 
                       </div>
                   </li>
               </ul>
            </div>
            <ul class="product bg_grey">
               <div class="productImg">
                   <img src="../../assets/img/sub-slider-img3.png" alt="">
               </div>
               <div class="p-2">
                   <h4>Roxanne</h4>
                   <div class="my-1">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-02"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-02"></i><i class="ri-star-fill red opacity-5"></i>
                   </div>
                   <p class="text-md mb-2">카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서 친절히 답해주셔서 감사하구요, 아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^ 감사합니다</p>
               </div>
            </ul>
            <ul class="product bg_grey">
               <div class="p-2">
                   <h4>Roxanne</h4>
                   <div class="my-1">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-02"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-02"></i><i class="ri-star-fill red opacity-5"></i>
                   </div>
                   <p class="text-md mb-2">카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서 친절히 답해주셔서 감사하구요, 아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^ 감사합니다</p>
               </div>
            </ul>
        </div>
        
        <div class="mt-4 mb-5">
            <h3 class="mb-1">비슷한 상품</h3>
            <hr class="mb-1">
            <div class="shareProducts">
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
        </div>
        </div>
    </section>
    <button class="btn btn_bottom btn-redcover" id="paymentSubmit">구매하기</button> <%-- btn_purchase--%>
    <input type="hidden" name="payment_order_quantity" value="1">
    <input type="hidden" name="order_max" value="${list.product_max_limit}" />
    <input type="hidden" name="order_min" value="${list.product_min_limit}" />
    <input type="hidden" name="product_delivery_bundle_yn" value="${list.product_delivery_bundle_yn}" />
    <input type="hidden" name="product_user_ud" value="${list.product_user_ud}" />
    <input type="hidden" name="product_cd" value="${list.product_cd}" />
</form>
</body>
<script>
$(document).ready(function(){
//    $('#shareProducts').bxSlider({
//        auto:false,
//        autoHover:true,
//        minSlides: 1,
//        maxSlides: 3,
//        moveSlides : 1,
//        speed:500,
//        slideMargin: 10,
//        slideWidth : 110,
//        mode:'horizontal',
//        autoControls:false,
//        pager:false,
//        touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
//    });
    $('.optionBtn').click(function(){
        $(this).siblings('.optionBtn').removeClass('on');
        $(this).addClass('on');
    })
    $('.qna').on('click',function(){
        $(this).addClass('active');
        $('.qna').not($(this)).removeClass('active');
    })
    $('#btn_review').on('click',function(){
        $('#review').addClass('on');
    })
    $('#btn_qna').on('click',function(){
        $('#qna').addClass('on');
    })
    $('#btn_purchase').on('click',function(){
        $('.underPurchase').addClass('on');
        $('body').attr('style', 'overflow:hidden');
    })
    $('.popClose').on('click',function(){
        $('.underPop').removeClass('on');
    })
    $('.closeBtn').on('click',function(){
        $('.underPurchase').removeClass('on');
        $('body').attr('style', '');
    })
    $('.button').on('click',function(){
        if($(this).hasClass('number-minus')){
            var value = $(this).next().val();
            if(Number(value) > 1) $(this).next().val(Number(value) - 1);
        } else {
            var value = $(this).prev().val();
            $(this).prev().val(Number(value) + 1);
        }
    })
    fix();
});
$(window).scroll(function(){ 
    taps();
});
function wish(){
    if($('.wish').hasClass('on')) $('.wish').removeClass('on');
    else $('.wish').addClass('on');
}
function fix(){
    var top = $(document).scrollTop();
    var content01 = $('#content01').offset().top;
    if(top > content01) $('#tap').addClass('fix');
    else $('#tap').removeClass('fix');
}
function taps(){
    var top = $(document).scrollTop() + 80;
    var content01 = $('#content01').offset().top - 50;
    var content02 = $('#content02').offset().top - 50;
    if(top > content01) $('#tap').addClass('fix');
    else $('#tap').removeClass('fix');
    if(top > content01) {
        $('#tap li').eq(0).find('a').addClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
    }
    if(top > content02) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').addClass('active');
    }
}
function move(num){
    var offset = '';
    if(num == 1) offset = $('#content01').offset();
    else if (num ==2) offset = $('#content02').offset();
    $('html').animate({scrollTop : offset.top - 100}, 400);
}
</script>
<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>