<%-- 
    Document   : create
    Created on : Mar 15, 2019, 7:23:51 PM
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

                    <div class="thumbnail">
                        <div class="caption-full">
                            <div class="form-group">
                                <label>Category</label>
                                <input disabled="true" value="${product.category.name}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input disabled="true" value="${product.name}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <input disabled="true" value="${product.description}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input disabled="true" value="${product.price}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Amount</label>
                                <input disabled="true" value="${product.amount}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Thumnail</label>
                                <img src="/images/${product.thumnail}" style="width: 300px; height: 300px;" class="form-control"/>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>
        <!-- /.container -->
        <jsp:include page="../footer.jsp"/>
    </body>
</html>