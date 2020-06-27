<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>

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
            	<c:if test="${list.product_live_type == 'U'}">
               		<iframe style="position:absolute;" src="https://www.youtube.com/embed/${list.product_youtube_id}?feature=oembed" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </c:if>
                <c:if test="${list.product_live_type == 'M'}">
                	<video class="moviebox" id="mov01" poster="" loop="" controls="true">
		               <source src="http://onejoy-life.com${list.file_6}" type="video/mp4" />
		           </video>
	           	</c:if>
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
               <h4>${scoreAvg}</h4>
           </li>
           <li>
               <i class="ri-eye-line"></i>
               <h4>724</h4>
           </li>
       </ul>
       <hr class="grey">
       <ul class="flexbetween py-05 mt-2">
           <li>판매가</li>
           <li class="line-through grey"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</li>
       </ul>
       <%--<ul class="flexbetween py-05">
           <li>세일</li>
           <li class="line-through grey">5,400원</li>
       </ul>--%>
       <ul class="flexbetween py-05">
           <li>판매가</li>
           <li class="text-lg text-bold red"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span class="text-sm">원</span></li>
       </ul>
       <div class="my-1">
            <hr class="grey">
            ${configlive.market_config_value}
        </div>
    </section>
    <section class="subheader">
       <ul class="shareBtns">
            <li><a href="javascript:wish()" class="wish">위시리스트</a></li>
            <li><a href="#" class="share">공유하기</a></li>
        </ul>
        <a href="${lineBannerList1.url}"><img src="http://onejoy-life.com/${lineBannerList1.file_1}" alt="" class="width-100"></a>
        <ul class="taps" id="tap">
           <li><a href="javascript:move(1)" class="active">상품설명</a></li>
           <li><a href="javascript:move(2)">리뷰 <span class="red text-sm">65</span></a></li>
       </ul>        
        <div class="my-1" id="content01">
            ${list.product_mobile_html}
        </div>
    </section>
    <section class="wrap">
        <div class="mt-4 mb-2" id="content02">
            <h3 class="mb-1"><span class="red text-lg">${fn:length(reviewList)}</span>개의 리뷰가 있습니다.</h3>
            <hr>
            <c:set var="scoreMap" value="<%=new java.util.HashMap()%>" />
            <c:set target="${scoreMap}" property="scoreCount1" value="0"/>
            <c:set target="${scoreMap}" property="scoreCount2" value="0"/>
            <c:set target="${scoreMap}" property="scoreCount3" value="0"/>
            <c:set target="${scoreMap}" property="scoreCount4" value="0"/>
            <c:set target="${scoreMap}" property="scoreCount5" value="0"/>
            <c:forEach var="list" items="${reviewList}">
            	<c:set var="tmp" value="scoreMap.scoreCount${status.index}" />
            	<c:set target="${scoreMap}" property="scoreCount${list.review_score}" value="${requestScope[tmp] + 1}"/>
            </c:forEach>
            <div class="py-2">
                <h2 class="text-bold pb-2">${scoreAvg}</h2>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick" style="width: <c:if test="${fn:length(reviewList) == 0}">0</c:if><c:if test="${fn:length(reviewList) != 0}">${scoreMap.scoreCount5 / fn:length(reviewList) * 100}</c:if>%"></div> 
                       </div>
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill opacity-5"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick" style="width: <c:if test="${fn:length(reviewList) == 0}">0</c:if><c:if test="${fn:length(reviewList) != 0}">${scoreMap.scoreCount4 / fn:length(reviewList) * 100}</c:if>%"></div> 
                       </div>
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill"></i><i class="ri-star-fill mx-02 opacity-5"></i><i class="ri-star-fill opacity-5"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick" style="width: <c:if test="${fn:length(reviewList) == 0}">0</c:if><c:if test="${fn:length(reviewList) != 0}">${scoreMap.scoreCount3 / fn:length(reviewList) * 100}</c:if>%"></div>
                       </div>
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02"></i><i class="ri-star-fill opacity-5"></i><i class="ri-star-fill mx-02 opacity-5"></i><i class="ri-star-fill opacity-5"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick" style="width: <c:if test="${fn:length(reviewList) == 0}">0</c:if><c:if test="${fn:length(reviewList) != 0}">${scoreMap.scoreCount2 / fn:length(reviewList) * 100}</c:if>%"></div>
                       </div>
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li class="text-md">
                       <i class="ri-star-fill"></i><i class="ri-star-fill mx-02 opacity-5"></i><i class="ri-star-fill opacity-5"></i><i class="ri-star-fill mx-02 opacity-5"></i><i class="ri-star-fill opacity-5"></i>
                   </li>
                   <li class="width-70">
                       <div class="stick-group">
                           <div class="stick" style="width: <c:if test="${fn:length(reviewList) == 0}">0</c:if><c:if test="${fn:length(reviewList) != 0}">${scoreMap.scoreCount1 / fn:length(reviewList) * 100}</c:if>%"></div>
                       </div>
                   </li>
               </ul>
            </div>
            <c:if test="${not empty reviewList}">
			<c:forEach var="list" items="${reviewList}">
            <ul class="product bg_grey">
               <div class="productImg">
                    <c:if test="${not empty list.file_1}">
               			<img src="http://onejoy-life.com/${list.file_1}" alt="">
               		</c:if>
               </div>
               <div class="p-2">
                   <h4>${list.email}</h4>
                   <div class="my-1">
                   	   <c:forEach var="i" begin="1" end="${list.review_score}">
                       <i class="ri-star-fill red"></i>
                       </c:forEach>
                   </div>
                   <b>${list.review_title}</b>
                   <p class="text-md mb-2">${list.review_content}</p>
               </div>
            </ul>
            </c:forEach>
            </c:if>
        </div>
        
        <div class="mt-4 mb-5">
            <h3 class="mb-1">비슷한 상품</h3>
            <hr class="mb-1">
            <div class="shareProducts">
            	<c:if test="${not empty relatedProductList}">
            	<c:forEach var="list" items="${relatedProductList}">
            		<a href="/view?product_cd=${list.product_cd}" class="product">
	                    <div class="productImg"><img src="http://onejoy-life.com/${list.file_1}" onerror="this.src='http://placehold.it/300x300'"></div>
	                    <h5 class="mt-05">${list.product_name}</h5>
	                    <h4 class="text-bold red"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /> <span class="text-sm">원</span></h4>
	                </a>
            	</c:forEach>
            	</c:if>
            	<c:if test="${empty relatedProductList}">
	            		비슷한 상품이 없습니다.
            	</c:if>
        	</div>
        </div>
    </section>
    <button class="btn btn_bottom btn-redcover" id="paymentSubmit" type="button">구매하기</button> <%-- btn_purchase--%>
    <input type="hidden" name="payment_order_quantity" value="1">
    <input type="hidden" name="order_max" value="${list.product_max_limit}" />
    <input type="hidden" name="order_min" value="${list.product_min_limit}" />
    <input type="hidden" name="product_delivery_bundle_yn" value="${list.product_delivery_bundle_yn}" />
    <input type="hidden" name="product_store_id" value="${list.product_store_id}" />
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
