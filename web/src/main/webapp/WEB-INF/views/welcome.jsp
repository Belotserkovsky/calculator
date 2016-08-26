<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <title>Welcome page</title>
    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap.css"/>" rel="stylesheet" type="text/css"/>
    <script src="/assets/js/bootstrap.min.js"></script>
    <%--<!-- Latest compiled and minified CSS -->--%>
    <%--<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">--%>

    <%--<!-- Optional theme -->--%>
    <%--<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">--%>
</head>
<body>
<div class="row">
    <div class="col-xs-2 col-md-4" style="background-color: greenyellow;color: white">.</div>
    <div class="col-xs-8 col-md-4" style="background-color: #0e90d2">
    hello yasia
        <%--<div style="text-align: center">--%>
            <%--<a href="/calc/welcome?locale=ru" style="padding: 5px">RU</a> | <a href="/calc/welcome?locale=en" style="padding: 5px">EN</a>--%>
        <%--</div>--%>
        <%--<br>--%>

        <%--<c:url value="/calc/j_spring_security_check" var="loginUrl" />--%>
        <%--<c:url var="regUrl" value="/calc/user?new"/>--%>

        <%--<c:if test="${param.logout != null}">--%>
            <%--<div class="alert alert-success" style="text-align: center">--%>
                <%--<p><spring:message code="welcome.successLogout"/></p>--%>
            <%--</div>--%>
        <%--</c:if>--%>
        <%--<c:if test="${param.login != null}">--%>
            <%--<div class="alert-success" style="text-align: center">--%>
                <%--<p><spring:message code="welcome.successRegister"/></p>--%>
            <%--</div>--%>
        <%--</c:if>--%>

        <%--<div>--%>
            <%--<form class="form-horizontal" action="${loginUrl}" method="POST" style="text-align: center" >--%>

                <%--<div class="control-group" style="text-align: center">--%>
                    <%--<label class="control-label" for="uName" style="text-align: right"><spring:message code="welcome.userName"/></label>--%>
                    <%--<div class="controls" style="text-align: center">--%>
                        <%--<input type="text" id="uName" name="userName" placeholder="Username" required="required" />--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="control-group" style="text-align: center">--%>
                    <%--<label class="control-label" for="uPass" style="text-align: right"><spring:message code="welcome.password"/></label>--%>
                    <%--<div class="controls" style="text-align: center">--%>
                        <%--<input type="password" id="uPass" name="password" placeholder="Password" required="required">--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="control-group" style="text-align: center">--%>
                    <%--<div class="controls" style="text-align: center">--%>
                        <%--<label class="checkbox" style="text-align: center">--%>
                            <%--<input id="remember_me" name="_spring_security_remember_me" type="checkbox"><spring:message code="welcome.rememberMe"/>--%>
                        <%--</label>--%>
                        <%--<button type="submit" class="btn"><spring:message code="welcome.singIn"/></button>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<c:if test="${param.loginFail != null}">--%>
                    <%--<div class="alert-warning" style="text-align: center">--%>
                        <%--<p><spring:message code="welcome.loginFail"/></p>--%>
                    <%--</div>--%>
                <%--</c:if>--%>

                <%--<button class="btn-link" style="text-align: center">--%>
                    <%--<a href="${regUrl}"><spring:message code="welcome.register"/></a>--%>
                <%--</button>--%>
            <%--</form>--%>
        <%--</div>--%>

    </div>
    <div class="col-xs-2 col-md-4" style="background-color: greenyellow;color: white">.</div>
</div>
<div class="row">
    <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
    <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
    <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
</div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>
