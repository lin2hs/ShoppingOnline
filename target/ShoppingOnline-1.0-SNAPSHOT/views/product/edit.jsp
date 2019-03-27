<%-- 
    Document   : edit
    Created on : Mar 15, 2019, 7:54:54 PM
    Author     : Linh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp" />
    <body>
        <jsp:include page="../nav.jsp"/>

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-md-3">

                </div>

                <div class="col-md-9">
                    <form:form action="./edit" method="POST" modelAttribute="product" enctype="multipart/form-data">
                        <div class="thumbnail">
                            <div class="caption-full">
                                <div class="form-group">
                                    <form:label path="category.id">Category</form:label>
                                    <form:select path="category.id" cssClass="form-control">
                                        <option value="-1">Select a type</option>
                                        <c:forEach items="${listCate}" var="cate">
                                            <c:choose>
                                                <c:when test="${cate.id == product.category.id}">
                                                    <option value="${cate.id}" selected="true">${cate.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${cate.id}">${cate.name}</option></c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                    </form:select>
                                </div>
                                <form:hidden path="id"/>
                                <div class="form-group">
                                    <form:label path="name">Name</form:label>
                                    <form:input path="name" value="${product.name}" cssClass="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="description">Description</form:label>
                                    <form:input path="description" value="${product.description}" cssClass="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="price">Price</form:label>
                                    <form:input path="price" value="${product.price}" cssClass="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="amount">Amount</form:label>
                                    <form:input path="amount" value="${product.amount}" cssClass="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Thumnail</label><form:hidden path="thumnail"/>
                                    <img src="/images/${product.thumnail}" style="width: 300px; height: 300px;" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Upload file</label>
                                    <input type="file" name="file" class="form-control"/>
                                </div>
                                <button type="submit" class="btn btn-default col-md-offset-5">Edit</button>
                            </div>
                        </div>
                    </form:form>
                </div>

            </div>

        </div>
        <!-- /.container -->
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
