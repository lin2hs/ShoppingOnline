<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"><b style="color: white;">Shopping Online</b></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="../home/index">Index</a>
                </li>
                <li>
                    <a href="../shop/index">Cart</a>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <sec:authentication var="principal" property="principal"/>
                    <li>
                        <a href="../cate/index">Category</a>
                    </li>
                    <li>
                        <a href="../product/index">Product</a>
                    </li>
                </sec:authorize>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication var="principal" property="principal"/>
                        <a href="#"><span class="glyphicon glyphicon-user"></span>
                            Hello: <font style="color: white">${principal.username}</font>
                        </a>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <a href="../auth/register"><span class="glyphicon glyphicon-user"></span>
                            Sign Up
                        </a>
                    </sec:authorize>
                </li>

                <li>
                    <c:url value="/j_spring_security_logout" var="logoutUrl"/>
                    <sec:authorize access="isAuthenticated()">
                        <a href="${logoutUrl}"><span class="glyphicon glyphicon-log-in"></span>
                            Log Out
                        </a>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <a href="../auth/login"><span class="glyphicon glyphicon-log-in"></span>
                            Log In
                        </a>
                    </sec:authorize>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
