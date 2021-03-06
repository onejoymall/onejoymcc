<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-05-13
  Time: 오후 5:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <!DOCTYPE html>
    <html lang="ko">
    <head>
    <title>onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <meta property="og:url" content="http://onejoymcm.com/" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="원조이라이프" />
    <meta property="og:description" content="" />
    <meta property="og:image" content="http://onejoy-life.com/fileupload/banner/2020/202005150621058688.jpg" />
    <link href="<c:url value="/assets/css/reset.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/mobile/common-mobile.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/mobile/commonsub.css" />" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    <link href="<c:url value="/assets/css/jquery.bxslider.css" />" rel="stylesheet" type="text/css">
    <link rel='stylesheet' href='<c:url value="/assets/plugins/toast/jquery.toast.min.css"/>'/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="<c:url value="/assets/js/jquery.bxslider.min.js" />"></script>
    <script src="<c:url value="/assets/js/common-mobile.js" />"></script>
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
    <body class="pt-48 black">
    <header class="header live">
    <div class="top-inner">
    <h1 class="main-logo"><a href="/">원조이몰</a></h1>
    <form name="search" action="/product" class="src-form">
    <div class="src-inner">
    <input type="text" class="src-input" name="product_name" value="${param.product_name}">
    <button type="submit" class="src-btn"><span>검색</span></button>
    </div>
    </form>
    </div>
    </header>

