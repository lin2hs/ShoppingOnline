<%-- 
    Document   : edit
    Created on : Mar 15, 2019, 10:04:23 AM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
                    <form:form action="./edit" method="POST" modelAttribute="cate">
                        <div class="thumbnail">
                            <div class="caption-full">
                                <div class="form-group">
                                    <label>ID</label>
                                    <form:hidden path="id" value="${cate.id}"/>
                                    <form:input disabled="true" value="${cate.id}" path="id" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <form:input path="name" value="${cate.name}" class="form-control"/>
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
