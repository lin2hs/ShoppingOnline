<%-- 
    Document   : index
    Created on : Mar 22, 2019, 7:55:46 PM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../nav.jsp"/>
        <div class="container">

            <div class="row">
                <c:if test="${currentCart.size() > 0}">
                    <div class="col-md-9">
                        <table border="1" class="col-md-2 col-md-offset-5">
                            <thead>
                                <tr>
                                    <th>Images</th>
                                    <th>Name</th>
                                    <th>Amount</th>
                                    <th colspan="3">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${currentCart}">
                                    <tr>
                                        <td>
                                            <div class="thumbnail">
                                                <div class="img">
                                                    <img src="/images/${item.product.thumnail}" class="img-thumbnail"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td><c:out value="${item.product.name}"/></td>
                                        <td><c:out value="${item.quantity}"/></td>
                                        <td><a href="./order?id=${item.product.id}&quantity=1">+</a></td>
                                        <td><a href="./order?id=${item.product.id}&quantity=-1">-</a></td>
                                        <td><a href="./remove?id=${item.product.id}">Remove</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>


                    </div>
                </c:if>
                <c:if test="${currentCart.size() == 0 || currentCart == null}">
                    <div class="col-md-5 col-md-offset-4">
                        <h2>There is no item in current cart</h2>
                    </div>
                </c:if>
            </div>
            <c:if test="${currentCart.size() > 0}">
                <div class="row">
                    <div class="col-md-9">
                        <a class="col-md-2 col-md-offset-5" href="./payment">Check out</a>
                    </div>
                </div>
            </c:if>
        </div>
        <!-- /.container -->
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
