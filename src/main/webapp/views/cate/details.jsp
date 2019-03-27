<%-- 
    Document   : details
    Created on : Mar 15, 2019, 9:56:53 AM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <label>ID</label>
                                <input disabled="true" value="${cate.id}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input disabled="true" value="${cate.name}" class="form-control">
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
