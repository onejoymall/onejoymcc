<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

    <section class="main-section">
        <h2 class="main-section-title hide">main section</h2>
        <article class="live-shopping-wrap">
                <div class="inner clearfix">
                    <div class="list-wrap">
                        <div class="list-top">
                            <h3>카테고리 제목</h3>
                            <form action="" method="POST" class="cate-sort-wrap">
                                <select name="sort-select" id="" class="sort-select">
                                    <option value="">인기 순</option>
                                    <option value="">조회수 순</option>
                                    <option value="">평가 순</option>
                                    <option value="">최신 순</option>
                                </select>
                            </form>
                        </div>
                        <div class="live-shopping-list">
                <c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}" varStatus="status">
                        <c:set var="lineCut" value="${status.count%4}"></c:set>
                            <div class="live-shopping-item">
                                <a href="product-page.html">
                                    <div class="imgbox">
                                        <img src="http://img.youtube.com/vi/gyG6m5yP7lM/mqdefault.jpg" />
<%--                                        <span class="video-time">8:12</span>--%>
<%--                                        <div class="sold-out"><p>SOLD OUT</p></div>--%>
                                    </div>
                                </a>
                                <div class="item-info">
                                    <a href="product-page.html"><p class="live-shopping-title">${list.product_name} </p></a>
                                    <p class="live-shopping-price"><ins><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원</ins><del><span class="price-before"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</span></del></p>
                                    <p class="live-shopping-user"><a href="#">Kate Ilacad</a></p>
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
<%--                        <jsp:include page="/WEB-INF/views/ui/pagingforSubmit.jsp" />--%>
                    </div>
                </div>
        </article>
    </section>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>