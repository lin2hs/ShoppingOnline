<%-- 
    Document   : index
    Created on : Mar 15, 2019, 7:02:17 PM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <!--    <body>
            <h1>Product list</h1>
            <a href="./create">Create a product</a>
            <br><br>
    <c:if test="${listProduct.size() > 0}">
        <form action="index" method="GET">
            <div>
                <input id="keyword" name="keyword" value="${keyword}" label="Find by name"/>
            </div>
            <div>
                <input type="submit" value="Search"/>
            </div>
        </form>
        <h4>Filter by category</h4>
        <form action="index" method="GET">
            <input type="hidden" value="${keyword}" id="keyword"/>
            <select id="cateId" name="cateId" onchange="this.form.submit()">
                <option value="-1">Select a type</option>
        <c:forEach items="${listCate}" var="cate">
            <c:choose>
                <c:when test="${cate.id == cateId}">
                    <option value="${cate.id}" selected="true">${cate.name}</option>
                </c:when>
                <c:otherwise>
                    <option value="${cate.id}">${cate.name}</option></c:otherwise>
            </c:choose>
        </c:forEach>
    </select>
</form>
<br>
<table border="1" >
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Amount</th>
            <th colspan="3">Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${listProduct}">
            <tr>
                <td><c:out value="${product.id}"/></td>
                <td><c:out value="${product.name}"/></td>
                <td><c:out value="${product.description}"/></td>
                <td><c:out value="${product.price}"/></td>
                <td><c:out value="${product.amount}"/></td>
                <td>
                    <a href="./details?id=${product.id}">Details</a>
                </td>
                <td>
                    <a href="./edit?id=${product.id}">Edit</a>
                </td>
                <td>
                    <a href="./delete?id=${product.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
        <c:choose>
            <c:when test="${page == 0 || page < 0 || page == null}">
                <h4>Page 1/${pageCount}</h4>
            </c:when>
            <c:otherwise>
                <c:if test="${page != pageCount}">
                    <h4>Page ${page + 1}/${pageCount}</h4>
                </c:if>
                <c:if test="${page == pageCount}">
                    <h4>Page ${page + 1}/${pageCount + 1}</h4>
                </c:if>
            </c:otherwise>
        </c:choose>    
        <br><br>
        <a href="./index?page=${page - 1}&keyword=${keyword}&cateId=${cateId}">Previous</a> | <a href="./index?page=${page + 1}&keyword=${keyword}&cateId=${cateId}">Next</a>
    </c:if>
    <c:if test="${listProduct.size() <= 0}">
        <form action="index" method="GET">
            <div>
                <input id="keyword" name="keyword" value="${keyword}" label="Find by name"/>
            </div>
            <div>
                <input type="submit" value="Search"/>
            </div>
        </form>
        <h4>Filter by category</h4>
        <form action="index" method="GET">
            <input type="hidden" value="${keyword}" id="keyword"/>
            <select id="cateId" name="cateId" onchange="this.form.submit()">
                <option value="-1">Select a type</option>
        <c:forEach items="${listCate}" var="cate">
            <c:choose>
                <c:when test="${cate.id == cateId}">
                    <option value="${cate.id}" selected="true">${cate.name}</option>
                </c:when>
                <c:otherwise>
                    <option value="${cate.id}">${cate.name}</option></c:otherwise>
            </c:choose>
        </c:forEach>
    </select>
</form>
<br>
<h2>There is no product</h2>
    </c:if>
</body>-->






    <body>
        <jsp:include page="../nav.jsp"/>
        <c:if test="${listProduct.size() > 0}">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <p class="lead">Shopping online</p>
                        <form class="form-control-static" action="./create">
                            <button class="btn btn-default">Create product</button>
                        </form>
                        <form class="form-control-static" method="GET" action="index">
                            <input type="text" class="input-sm" id="keyword" name="keyword" value="${keyword}" placeholder="Input category"/>
                            <input type="submit" class="input-sm" value="Search"/>
                        </form>
                        <form action="index" method="GET">
                            <input type="hidden" value="${keyword}" id="keyword" name="keyword"/>
                            <select id="cateId" class="form-control" name="cateId" onchange="this.form.submit()">
                                <option value="-1">Select a type</option>
                                <c:forEach items="${listCate}" var="cate">
                                    <c:choose>
                                        <c:when test="${cate.id == cateId}">
                                            <option value="${cate.id}" selected="true">${cate.name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${cate.id}">${cate.name}</option></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                    <div class="col-md-9">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Product
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive table-bordered">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Description</th>
                                                <th>Price</th>
                                                <th>Amount</th>
                                                <th colspan="3">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${listProduct}">
                                                <tr>
                                                    <td><c:out value="${product.id}"/></td>
                                                    <td><c:out value="${product.name}"/></td>
                                                    <td><c:out value="${product.description}"/></td>
                                                    <td><c:out value="${product.price}"/></td>
                                                    <td><c:out value="${product.amount}"/></td>
                                                    <td>
                                                        <a href="./details?id=${product.id}">Details</a>
                                                    </td>
                                                    <td>
                                                        <a href="./edit?id=${product.id}">Edit</a>
                                                    </td>
                                                    <td>
                                                        <a href="./delete?id=${product.id}">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                    </div>
                    <!-- /.panel -->
                </div>
            </c:if>
            <c:if test="${listProduct.size() <= 0}">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <p class="lead">Shopping online</p>
                            <form class="form-control-static" action="./create">
                                <button class="btn btn-default">Create product</button>
                            </form>
                            <form class="form-control-static" method="GET" action="index">
                                <input type="text" class="input-sm" id="keyword" name="keyword" value="${keyword}" placeholder="Input category"/>
                                <input type="submit" class="input-sm" value="Search"/>
                            </form>
                            <form action="index" method="GET">
                                <input type="hidden" value="${keyword}" name="keyword" id="keyword"/>
                                <select id="cateId" name="cateId" class="form-control" onchange="this.form.submit()">
                                    <option value="-1">Select a type</option>
                                    <c:forEach items="${listCate}" var="cate">
                                        <c:choose>
                                            <c:when test="${cate.id == cateId}">
                                                <option value="${cate.id}" selected="true">${cate.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${cate.id}">${cate.name}</option></c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </form>
                        </div>
                        <div class="col-md-9">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Product
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">

                                    <h2>There is no product</h2>

                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                        </div>
                        <!-- /.panel -->
                    </div>
                </c:if>
                <br>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-lg-12" style="display: flex; text-align: center;">
                        <div class="col-sm-4 col-lg-4 col-md-4" style="text-align: left; display: block;">
                            <a href="./index?page=${page - 1}&keyword=${keyword}&cateId=${cateId}">Previous</a>
                        </div>
                        <div class="col-sm-4 col-lg-4 col-md-4" style="text-align: center; display: block;">
                            <c:choose>
                                <c:when test="${page == 0 || page < 0 || page == null}">
                                    <h4>Page 1/${pageCount}</h4>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${page != pageCount}">
                                        <h4>Page ${page + 1}/${pageCount}</h4>
                                    </c:if>
                                    <c:if test="${page == pageCount}">
                                        <h4>Page ${page + 1}/${pageCount + 1}</h4>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>    
                        </div>
                        <div class="col-sm-4 col-lg-4 col-md-4" style="text-align: right; display: block;">
                            <a href="./index?page=${page + 1}&keyword=${keyword}&cateId=${cateId}">Next</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <p style="color: red">${message}</p>
                    </div>
                </div>
            </div>
            <jsp:include page="../footer.jsp"/>
    </body>
</html>
