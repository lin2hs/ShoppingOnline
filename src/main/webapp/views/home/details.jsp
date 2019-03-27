<%-- 
    Document   : details
    Created on : Mar 25, 2019, 9:49:36 AM
    Author     : Linh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../nav.jsp"/>

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-md-3">
                    
                </div>

                <div class="col-md-9">

                    <div class="thumbnail">
                        <img class="img-responsive" src="/images/${product.thumnail}" alt="">
                        <div class="caption-full">
                            Category: <a href="./index?cateId=${product.category.id}">${product.category.name}</a>
                            <h4 class="pull-right">Price: ${product.price}</h4>
                            <h4>Name: ${product.name}</h4>
                            <p>Description: ${product.description}</p>
                            <p>Amount: ${product.amount}</p>
                            <p>
                                <a href="../shop/order?id=${product.id}&quantity=1">Add to cart</a>
                            </p>
                        </div>

                    </div>

                </div>

            </div>

        </div>
        <!-- /.container -->
        
        <jsp:include page="../footer.jsp"/>

    </body>
</html>
