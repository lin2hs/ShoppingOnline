<%-- 
    Document   : index
    Created on : Mar 25, 2019, 9:48:54 AM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../nav.jsp"/>

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-md-3">
                    <p class="lead">Shopping online</p>
                    <form class="form-control-static" method="GET" action="index">
                        <input type="text" class="input-sm" id="keyword" name="keyword" value="${keyword}" placeholder="Input product's name"/>
                        <input type="submit" class="input-sm" value="Search"/>
                    </form>
                    <div class="list-group">
                        <c:forEach items="${listCate}" var="cate">
                            <c:choose>
                                <c:when test="${cateId == cate.id}">
                                    <a href="./index?cateId=${cate.id}" class="list-group-item active">${cate.name}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="./index?cateId=${cate.id}" class="list-group-item">${cate.name}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>

                <c:if test="${listProduct.size() > 0}">
                    <div class="col-md-9">

                        <div class="row carousel-holder">

                            <div class="col-md-12">
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <%--<c:forEach items="${listProduct}" var="item" varStatus="counter">
                                            <c:choose>
                                                <c:when test="${counter.count == 1}">
                                                    <div class="item active">
                                                        <img class="slide-image" src="/images/${product.thumnail}" alt="">
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="item">
                                                        <img class="slide-image" src="/images/${product.thumnail}" alt="">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>--%>
                                        <div class="item active">
                                            <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                        </div>
                                        <div class="item">
                                            <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                        </div>
                                        <div class="item">
                                            <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                        </div>
                                    </div>
                                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="row">


                            <c:forEach var="product" items="${listProduct}">
                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="thumbnail">
                                        <div class="img">
                                            <img src="/images/${product.thumnail}" class="img-thumbnail" style="max-height: 120px; min-height: 120px;">
                                        </div>
                                        <div class="caption">
                                            <h4 class="pull-right">${product.price}</h4>
                                            <h4><a target="_blank" href="./details?id=${product.id}">${product.name}</a></h4>
                                            <p>
                                                <c:if test="${product.description.length() > 30}">
                                                    ${fn:substring(product.description, 0, 30)} ...
                                                </c:if>
                                                <c:if test="${product.description.length() <= 30}">
                                                    ${product.description}
                                                </c:if>
                                            </p>
                                            <h5><a href="../shop/order?id=${product.id}&quantity=1">Add to cart</a></h5>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-lg-12" style="display: flex; text-align: center;">
                                <div class="col-sm-4 col-lg-4 col-md-4" style="text-align: left; display: block;">
                                    <c:if test="${page != 0 || page > 0}">
                                        <a href="./index?page=${page - 1}&keyword=${keyword}&cateId=${cateId}">Previous</a>
                                    </c:if>
                                </div>
                                <div class="col-sm-4 col-lg-4 col-md-4" style="text-align: center; display: block;">
                                    <c:choose>
                                        <c:when test="${page == 0 || page < 0 || page == null}">
                                            Page 1/${pageCount}
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${page != pageCount}">
                                                Page ${page + 1}/${pageCount}
                                            </c:if>
                                            <c:if test="${page == pageCount}">
                                                Page ${page + 1}/${pageCount + 1}
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>    
                                </div>
                                <div class="col-sm-4 col-lg-4 col-md-4" style="text-align: right; display: block;">
                                    <c:if test="${page < (pageCount - 1)}">
                                        <a href="./index?page=${page + 1}&keyword=${keyword}&cateId=${cateId}">Next</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:if>
                <c:if test="${listProduct.size() <= 0}">
                    <div class="col-md-9">
                        <h2>Sorry... There is no product</h2>
                    </div>
                </c:if>
            </div>

        </div>
        <!-- /.container -->

        <jsp:include page="../footer.jsp"/>
    </body>
</html>
