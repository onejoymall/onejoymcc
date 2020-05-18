<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
<!--    <meta name="viewport" content="user-scalable=yes, width=1200, target-densitydpi=medium-dpi" />-->
    <link href="/assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/common.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/common/common.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/jquery.bxslider.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/header-mcn.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/commonsub.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/footer-mcn.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/${style}.css" rel="stylesheet" type="text/css">
    <link rel='stylesheet' href='<c:url value="/assets/plugins/toast/jquery.toast.min.css"/>'/>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,700&display=swap&subset=korean" rel="stylesheet" type="text/css">
    <!-- timepicker -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!--
    [if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <![endif]
-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="/assets/js/jquery.bxslider.min.js"></script>
    <!-- timepicker -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script>
    //전역변수
    <c:if test="${not empty postUrl}">
        var postUrl = '<c:url value="${postUrl}"/> ';
    </c:if>
    var isLogin ='<c:out value="${sessionScope.login}"/>';
    </script>
</head>
<body>
    <div class="scroll-t" id="topcontrol">
        <i class="scroll-i"></i>
    </div>
    <header class="header">
        <div class="usermenu-section">
            <div class="usermenu-inner">
                <ul class="usermenu">
                <c:if test="${!sessionScope.login}">

                    <li><a href="/sign/signup">회원가입</a></li>
                    <li><a href="/sign/login">로그인</a></li>
                    <%-- <li><a href="/MyPage/ShoppingBasket">장바구니</a></li>
                     <li><a href="/MyPage/OrderAndDelivery">주문배송</a></li>
                     <li><a href="/Help/csinfo">고객센터</a></li>--%>
                    <%--        <li class="language-nav"><a href="">국가선택</a>
                            <ul>
                            <li><a href="">한국</a></li>
                            <li><a href="">미국</a></li>
                            <li><a href="">중국</a></li>
                            <li><a href="">일본</a></li>
                            </ul>
                            </li>--%>

                </c:if>
                <c:if test="${sessionScope.login}">
                    <%--            <li><a href="/MyPage/ShoppingBasket">장바구니</a></li>
                                <li><a href="/MyPage/OrderAndDelivery">주문배송</a></li>
                                <li><a href="/MyPage/DashBoard">MyPage</a></li>
                                <li><a href="/Help/csinfo">고객센터</a></li>--%>
                    <li><a href="/sign/logout">로그아웃</a></li>
                    <%--    <li class="language-nav"><a href="">국가선택</a>
                        <ul>
                        <li><a href="">한국</a></li>
                        <li><a href="">미국</a></li>
                        <li><a href="">중국</a></li>
                        <li><a href="">일본</a></li>
                        </ul>
                        </li>--%>
                </c:if>

                </ul>
            </div>
        </div>
        <div class="header-logo">
            <div class="header-logo-inner">
               <a class="logoA" href="/"><h1>onejoylife</h1></a>
               <div class="search-box">
                    <form action="/product" id="main-search-form" name="main-search-form" method="get">
                        <input type="text" id="main-search" name="product_name" class="input-text" value="${param.product_name}">
                        <button id="main-search-btn" type="submit" class="search-btn"></button>
                    </form>
                </div>
            </div>
        </div>
        <c:import url="/layout/mainTopNav"></c:import>
    </header>
