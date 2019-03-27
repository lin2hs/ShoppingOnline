<%-- 
    Document   : edit
    Created on : Mar 27, 2019, 5:45:50 PM
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
                    <form:form action="./edit" method="POST" modelAttribute="role">
                        <div class="thumbnail">
                            <div class="caption-full">
                                <div class="form-group">
                                    <form:label path="username">Username</form:label>
                                    <input disabled="true" value="${role.username.username}" class="form-control"/>
                                    <form:hidden path="username" value="${role.username}"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="ROLE">Role</form:label>
                                    <form:select path="ROLE" cssClass="form-control">
                                        <c:forEach items="${listRole}" var="roleFromList">
                                            <c:choose>
                                                <c:when test="${roleFromList.ROLE == role.ROLE}">
                                                    <option value="${roleFromList.ROLE}" selected="true">
                                                        <c:if test="${roleFromList.ROLE == 'ROLE_ADMIN'}">
                                                            Admin
                                                        </c:if>
                                                        <c:if test="${roleFromList.ROLE == 'ROLE_USER'}">
                                                            User
                                                        </c:if>
                                                    </option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${roleFromList.ROLE}">
                                                        <c:if test="${roleFromList.ROLE == 'ROLE_ADMIN'}">
                                                            Admin
                                                        </c:if>
                                                        <c:if test="${roleFromList.ROLE == 'ROLE_USER'}">
                                                            User
                                                        </c:if>
                                                    </option>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                    </form:select>
                                </div>
                                <button type="submit" class="btn btn-default col-md-offset-5">Edit</button>
                            </div>

                        </div>
                    </form:form>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <p style="color: red">${message}</p>
                    </div>
                </div>

            </div>
            <!-- /.container -->
            <jsp:include page="../footer.jsp"/>
    </body>
</html>
