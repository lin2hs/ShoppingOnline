<%-- 
    Document   : error
    Created on : Mar 27, 2019, 10:06:04 AM
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
                <div class="col-md-5 col-md-offset-4">
                        <h2>${message}</h2>
                        <a href="../home/index">Continue shopping</a>
                    </div>
            </div>
        </div>
        <!-- /.container -->
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

