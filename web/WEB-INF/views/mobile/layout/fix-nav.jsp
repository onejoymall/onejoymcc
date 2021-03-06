<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="nav">
     <ul>
         <li><a href="#" id="nav-cate"><i class="cate-ic">카테고리</i></a></li>
         <li><a href="/" id="nav-home"><i class="home-ic">홈</i></a></li>
         <li><a href="/product" id="nav-src"><i class="src-ic">검색</i></a></li>
         <li><a href="<c:url value="http://onejoy-life.com//MyPage/DashBoard"/>" id="nav-user"><i class="user-ic">마이페이지</i></a></li>
     </ul>
 </nav>
 <div class="category">
    <div class="cate-bg"></div>
     <div class="content">
         <div class="cate-close"><span></span></div>
         <header class="cate-hd">
             <div class="cate-hdTop">
                <c:if test="${sessionScope.login}">
                    <p><span>${sessionScope.email}</span>님 환영합니다.</p>
                </c:if>
                <c:if test="${!sessionScope.login}">
                    <a href="<c:url value="/sign/login"/>" class="login">로그인 </a>
                </c:if>
<!--                    <a href="#" class="login">로그인 ＞</a>-->
             </div>
         </header>
    <div class="cate-body">
        <h4 class="cate-ttl">카테고리</h4>
        <hr>
        <c:import url="/layout/mainTopNav"/>
        <div class="logoutWrap">
           <hr>
            <c:if test="${sessionScope.login}">
                <a href="<c:url value="/sign/logout"/>" class="logout">로그아웃 <i class="ri-logout-box-r-line"></i></a>
            </c:if>
            <c:if test="${!sessionScope.login}">
                <a href="<c:url value="/sign/logout"/>" class="logout">로그인 <i class="ri-logout-box-r-line"></i></a>
            </c:if>
            <button type="button" class="language">국가선택</button>
        </div>
         </div>
     </div>
    <div class="languagePop" id="language-m">
        <div class="content clearfix">
            <header>
            <h3>국가선택</h3>
            <button class="popClose">
                <i class="ri-close-line"></i>
            </button>
        </header>
        <content>
            <ul class="language-ul">
                <li><button type="button">한국</button></li>
                <li><button type="button">미국</button></li>
                <li><button type="button">중국</button></li>
                <li><button type="button">영국</button></li>
            </ul>
        </content>
    </div>

    </div>
 </div>

    <script>
    $(function(){

    $('.language').on('click',function(){
    $('#language-m').addClass('on');
    })
    $('.popClose').on('click',function(){
    $('#language-m').removeClass('on');
    })
    });
    </script>