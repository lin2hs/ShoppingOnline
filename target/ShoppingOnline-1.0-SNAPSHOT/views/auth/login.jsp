<%-- 
    Document   : login
    Created on : Mar 25, 2019, 8:37:11 PM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <title>Login Form</title>
    <body>
        <jsp:include page="../nav.jsp"/>
        <div class="row">
            <div class="col-md-2 col-md-offset-5">
                <h2>Login here</h2>
            </div>
            <div class="col-md-2" style="margin-left: 39%;">
                <form method="POST" action="<c:url value='/j_spring_security_check'/>">
                    <table>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" class="input-sm" name="username"/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" class="input-sm" name="password"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="Login" class="btn-sm" value="Login"/></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="col-md-2 col-md-offset-5">
                <p style="color: red; text-align: center;">${message}</p>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
