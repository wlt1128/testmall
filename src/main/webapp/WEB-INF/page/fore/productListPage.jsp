<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<script src="${pageContext.request.contextPath}/res/js/fore/fore_productList.js"></script>
<link href="${pageContext.request.contextPath}/res/css/fore/fore_productList.css" rel="stylesheet">
<body>
<title><c:choose><c:when test="${requestScope.searchValue != null}">${requestScope.searchValue}</c:when>
    <c:otherwise><c:choose><c:when
            test="${requestScope.productList != null && fn:length(requestScope.productList)>0}">${requestScope.productList[0].product_category.category_name}</c:when><c:otherwise>没找到相关商品</c:otherwise></c:choose></c:otherwise></c:choose>-Tmall.com-理想生活上</title>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div id="mallLogo">
            <a href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"></a>
        </div>
        <div class="shopSearchHeader">

            <ul>
                <c:forEach items="${requestScope.categoryList}" var="category" varStatus="i">
                    <li>
                        <a href="${pageContext.request.contextPath}/product?category_id=${category.category_id}">${category.category_name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</nav>
<div class="context">
    <c:choose>
        <c:when test="${requestScope.productList != null && fn:length(requestScope.productList)>0}">
            <div class="context_menu">
                <ul <c:choose><c:when
                        test="${requestScope.searchValue != null}"> data-value="${requestScope.searchValue}"</c:when>
                    <c:otherwise>data-type = ${requestScope.searchType}</c:otherwise></c:choose>>
                    <li data-name="product_name"
                        <c:if test="${requestScope.orderBy =='product_name' || requestScope.orderBy ==null}">class="orderBySelect"</c:if>>
                        <span>synthesis</span>
                        <span class="orderByAsc"></span>
                    </li>
                    <li data-name="product_create_date"
                        <c:if test="${requestScope.orderBy =='product_create_date'}">class="orderBySelect"</c:if>>
                        <span>new</span>
                        <span class="orderByAsc"></span>
                    </li>
                    <li data-name="product_sale_count"
                        <c:if test="${requestScope.orderBy =='product_sale_count'}">class="orderBySelect"</c:if>>
                        <span>sales</span>
                        <span class="orderByAsc"></span>
                    </li>
                    <li data-name="product_sale_price"
                        <c:if test="${requestScope.orderBy =='product_sale_price'}">class="orderBySelect"</c:if>>
                        <span style="position: relative;left: 3px">price</span>
                        <span class="orderByDesc <c:if test="${requestScope.isDesc == true}">orderBySelect</c:if>"
                              style="bottom: 5px; left: 6px;"></span>
                        <span class="orderByAsc <c:if test="${requestScope.isDesc == false}">orderBySelect</c:if>"
                              style="top:4px;right: 5px;"></span>
                    </li>
                </ul>
            </div>
            <div class="context_main">
                <c:forEach items="${requestScope.productList}" var="product">
                    <div class="context_productStyle">
                        <div class="context_product">
                            <a href="${pageContext.request.contextPath}/product/${product.product_id}"
                               target="_blank"><img class="context_product_imgMain"
                                                    src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${product.singleProductImageList[0].productImage_src}"/></a>
                            <ul class="context_product_imgList">
                                <c:forEach items="${product.singleProductImageList}" var="img">
                                    <li><img
                                            src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${img.productImage_src}"/>
                                    </li>
                                </c:forEach>
                            </ul>
                            <p class="context_product_price"><span>¥</span>${product.product_sale_price}</p>
                            <p class="context_product_name"><a href="/tmall/product/${product.product_id}"
                                                               target="_blank">${product.product_name}</a></p>
                            <p class="context_product_shop"><span>my ${product.product_category.category_name} mall</span>
                            </p>
                            <p class="context_product_status">
                                <span class="status_left">totalDeals<em><c:choose><c:when
                                        test="${product.product_sale_count != null}">${product.product_sale_count}</c:when><c:otherwise>0</c:otherwise></c:choose>笔</em></span>
                                <span class="status_middle">appraise<em>${product.product_review_count}</em></span>
                                <span class="status_right"><img
                                        src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/T11lggFoXcXXc1v.nr-93-93.png"/></span>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="error">
                <h2>There are no related products</h2>

            </div>
        </c:otherwise>
    </c:choose>
</div>
<%@ include file="include/footer_two.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>