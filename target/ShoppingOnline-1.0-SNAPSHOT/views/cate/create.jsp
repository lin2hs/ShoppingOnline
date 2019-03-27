<%-- 
    Document   : create
    Created on : Mar 15, 2019, 9:30:09 AM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp" />
<!--    <body>
        <h1>Create a category</h1>
        <form:form action="./create" method="POST" modelAttribute="category">
            <table border="1">
                <form:hidden path="id"/>
                <tr>
                    <td><form:label path="name">Name</form:label></td>
                    <td><form:input path="name" /></td>
                    <form:errors path="name" cssStyle="color:red;display:block"></form:errors>
                </tr>
            </table>
            <br>
            <input type="submit" value="Submit" />
        </form:form>
    </body>-->
     <body>
        <jsp:include page="../nav.jsp"/>

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-md-3">

                </div>

                <div class="col-md-9">
                    <form:form action="./create" method="POST" modelAttribute="category">
                        <div class="thumbnail">
                            <div class="caption-full">
                                <form:hidden path="id"/>
                                <div class="form-group">
                                    <label>Name</label>
                                    <form:input path="name" class="form-control"/>
                                </div>
                                <button type="submit" class="btn btn-default col-md-offset-5">Create</button>
                            </div>

                        </div>
                    </form:form>
                </div>

            </div>

        </div>
        <!-- /.container -->
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
