<%-- 
    Document   : index
    Created on : Mar 27, 2019, 4:56:07 PM
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
        <c:if test="${listRole.size() > 0}">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <p class="lead">Shopping online</p>
                        <form class="form-control-static" action="./create">
                            <button class="btn btn-default">Create user</button>
                        </form>
                    </div>
                    <div class="col-md-9">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                User
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive table-bordered">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Username</th>
                                                <th>Role</th>
                                                <th colspan="3">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="role" items="${listRole}">
                                                <tr>
                                                    <td>${role.username.username}</td>
                                                    <c:if test="${role.ROLE == 'ROLE_ADMIN'}">
                                                        <td>Admin</td>
                                                    </c:if>
                                                    <c:if test="${role.ROLE == 'ROLE_USER'}">
                                                        <td>User</td>
                                                    </c:if>
                                                    <td><a href="./details?id=${role.user_role_id}">Details</a></td>
                                                    <td><a href="./edit?id=${role.user_role_id}">Edit</a></td>
                                                    <td><a href="./delete?id=${role.user_role_id}">Delete</a></td>
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
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <p style="color: red">${message}</p>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
