<%-- 
    Document   : register
    Created on : Mar 26, 2019, 10:01:04 AM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <title>Login Form</title>
    <body>
        <jsp:include page="../nav.jsp"/>
        <div class="row">
            <div class="col-md-2 col-lg-2 col-sm-2 col-md-offset-5">
                <h2>Register now</h2>
            </div>
            <div class="col-md-2" style="margin-left: 39%;">
                <form:form method="POST" action="register" modelAttribute="user">
                    <table>
                        <tr>
                            <td>Username:</td>
                            <td><form:input type="text" path="username" class="input-sm" name="username"/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><form:input type="password" path="password" class="input-sm" name="password"/></td>
                        </tr>
                        <tr>
                            <td>Confirm:</td>
                            <td><input type="password" class="input-sm" name="confirm" id="confirm"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="Login" class="btn-sm" value="Sign Up"/></td>
                        </tr>
                    </table>
                </form:form>
            </div>
            <div class="col-md-2 col-md-offset-5">
                <p style="color: red; text-align: center;">${message}</p>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

