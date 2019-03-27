<%-- 
    Document   : index
    Created on : Mar 13, 2019, 7:41:18 PM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp" />
    <body>
        <jsp:include page="../nav.jsp"/>
        <c:if test="${listCate.size() > 0}">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <p class="lead">Shopping online</p>
                        <form class="form-control-static" action="./create">
                            <button class="btn btn-default">Create category</button>
                        </form>
                        <form class="form-control-static" method="GET" action="index">
                            <input type="text" class="input-sm" id="keyword" name="keyword" value="${keyword}" placeholder="Input category"/>
                            <input type="submit" class="input-sm" value="Search"/>
                        </form>
                    </div>
                    <div class="col-md-9">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Category
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive table-bordered">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th colspan="3">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="cate" items="${listCate}">
                                                <tr>
                                                    <td>${cate.id}</td>
                                                    <td>${cate.name}</td>
                                                    <td><a href="./details?id=${cate.id}">Details</a></td>
                                                    <td><a href="./edit?id=${cate.id}">Edit</a></td>
                                                    <td><a href="./delete?id=${cate.id}">Delete</a></td>
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
            <br>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-lg-12" style="display: flex; text-align: center;">
                    <div class="col-sm-4 col-lg-4 col-md-4" style="text-align: left; display: block;">
                        <a href="./index?page=${page - 1}&keyword=${keyword}">Previous</a>
                    </div>
                    <div class="col-sm-4 col-lg-4 col-md-4" style="text-align: center; display: block;">
                        <c:choose>
                            <c:when test="${page == 0 || page < 0 || page == null}">
                                <c:if test="${page != pageCount}">
                                    Page 1/${pageCount + 1}
                                </c:if>
                                <c:if test="${page == pageCount}">
                                    Page ${page + 1}/${pageCount+1}
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${page != pageCount}">
                                    Page ${page + 1}/${pageCount+1}
                                </c:if>
                                <c:if test="${page == pageCount}">
                                    Page ${page + 1}/${pageCount + 1}
                                </c:if>
                            </c:otherwise>
                        </c:choose>    
                    </div>
                    <div class="col-sm-4 col-lg-4 col-md-4" style="text-align: right; display: block;">
                        <a href="./index?page=${page + 1}&keyword=${keyword}">Next</a>
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
