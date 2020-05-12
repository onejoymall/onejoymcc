<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <footer>
        <div class="footer-bottom-section clearfix">
            <div class="footer-bottom-section-inner clearfix">
                <div class="footer-left-section">
                    <h5 class="footer-h5">ONEJOY<br>고객지원센터</h5>
                    <h6>무엇이든 물어보세요</h6>
                    <p class="footer-callnumber">1811-9590</p>
                    <div class="footer-time-wrap">
                        <p class="th">상담가능시간</p>
                        <p class="td"><span>오전 10시~오후 6시</span><span>주말, 공휴일 휴무</span><br><span>&#40;점심시간: 12:00~13:00&#41;</span></p>
                    </div>
                </div>
                <div class="footer-right-section">
                    <h5 class="footer-h5">COMPANY<br>INFORMATION</h5>
                    <ul>
                        <li>상호 : 주식회사 원조이 / 대표 : 김수현 / 전화 : 1811-9590 / 팩스 : 02-3472-0888</li>
                        <li>사업자 등록번호 : [487-88-01223]</li>
                        <li>통신판매업신고 2019-서울서초-0844 <a href="#">[사업자정보확인]</a></li>
                        <li>주소 : 06643 서울특별시 서초구 서리풀길 4 (서초동) 영호빌딩 4층</li>
                        <li>개인정보관리책임자 : <a href="mailto:cs@onejoy.co.kr">김수현(cs@onejoy.co.kr)</a></li>
                        <li>Copyright ONEJOYlife. All rights reserved. / hosting by cafe24 심플렉스인터넷(주)</li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
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
        $(window).scroll(function() {
            if ($(window).scrollTop() == $(document).height() - $(window).height()) {
              console.log(++page);
              $(".live-shopping-list").append('');
            }
        });
    </script>
    
    

    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>

    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>
    
    <script src='<c:url value="/assets/js/commonMgScript.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    
</body>
</html>
