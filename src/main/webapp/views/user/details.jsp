<%-- 
    Document   : details
    Created on : Mar 27, 2019, 5:22:10 PM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                                <label>Username</label>
                                <input disabled="true" value="${role.username.username}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Role</label>
                                <c:if test="${role.ROLE == 'ROLE_ADMIN'}">
                                    <input disabled="true" value="Admin" class="form-control">
                                </c:if>
                                <c:if test="${role.ROLE == 'ROLE_USER'}">
                                    <input disabled="true" value="User" class="form-control">
                                </c:if>
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
