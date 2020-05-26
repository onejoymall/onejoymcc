<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    <div class="gnb-section">
        <div class="gnb-inner">
            <ul class="gnb">
                <li>
                    <i class="main-menu-ic"></i>
                    <ul class="gnb-submenu">
                    <c:if test="${not empty categoryList}">
                    <c:forEach var="ctegoryList" items="${categoryList}" varStatus="status">
                        <li>
                            <a href="/product?product_ct=${ctegoryList.pd_category_id}">${ctegoryList.pd_category_name}</a>
                            <ul class="gnb-submenu-2dp">
                            <c:if test="${not empty subList}">
                                <c:forEach var="subList" items="${subList}">
                                    <c:if test="${ctegoryList.pd_category_id eq subList.pd_category_upper_code}">
                                        <li>
                                        <a href="/product?product_ct=${subList.pd_category_id}"><span></span>${subList.pd_category_name}</a>
                                        <ul class="gnb-submenu-3dp">
                                        <c:if test="${not empty thirdList}">
                                            <c:forEach var="thirdList" items="${thirdList}">
                                                <c:if test="${subList.pd_category_id eq thirdList.pd_category_upper_code}">
                                                    <li>
                                                    <a href="/product?product_ct=${thirdList.pd_category_id}"><span></span>${thirdList.pd_category_name}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        </ul>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            </ul>
                        </li>
                    </c:forEach>
                    </c:if>
                    </ul>
                </li>
				<li><div class="hovBorder"></div><a href="http://onejoy-life.com/">원조이라이프 돌아가기</a></li>
            </ul>
        </div>
    </div>