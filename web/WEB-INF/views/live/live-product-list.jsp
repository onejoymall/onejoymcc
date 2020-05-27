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
                        	<c:if test="${not empty categoryRowData.pd_category_name}">
                            	<h3>${categoryRowData.pd_category_name} 카테고리</h3>
                           	</c:if>
                            <c:if test="${not empty param.product_name}">
                            	<h3>"${param.product_name}" 검색결과</h3>
                           	</c:if>
                            <!-- <form action="" method="POST" class="cate-sort-wrap">
                                <select name="sort-select" id="" class="sort-select">
                                    <option value="">인기 순</option>
                                    <option value="">조회수 순</option>
                                    <option value="">평가 순</option>
                                    <option value="">최신 순</option>
                                </select>
                            </form> -->
                        </div>
                        <div class="live-shopping-list">
                <c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}" varStatus="status">
                        <c:set var="lineCut" value="${status.count%4}"></c:set>
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
		                            <p class="live-shopping-user"><a href="/view?product_cd=${list.product_cd}">${list.product_store_id}</a></p>
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