<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <title>Welcome page</title>
    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css"/>
    <script src="/assets/js/bootstrap.min.js"></script>
</head>
<body>

<div style="text-align: center">
    <a href="/calc/welcome?locale=ru" style="padding: 5px"><h4 class="h4">RU</h4></a> | <a href="/calc/welcome?locale=en" style="padding: 5px"><h4 class="h4">EN</h4></a>
</div>
<br>

<c:url value="/calc/j_spring_security_check" var="loginUrl" />
<c:url var="regUrl" value="/calc/user/new"/>

<div class="col-sm-6 col-md-4 col-md-offset-4">
    <form class="form-horizontal" action="${loginUrl}" method="POST">
        <div class="form-group">
            <label class="col-sm-3 control-label" for="uName" style="text-align: right"><spring:message code="welcome.userName"/></label>
            <div class="col-sm-7">
                <input class="form-control" id="uName" name="userName" placeholder="Username" required="required" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="uPass" style="text-align: right"><spring:message code="welcome.password"/></label>
            <div class="col-sm-7">
                <input class="form-control" type="password" id="uPass" name="password" placeholder="Password" required="required">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-4">
                <div class="checkbox">
                    <label>
                        <input id="remember_me" name="_spring_security_remember_me" type="checkbox"><spring:message code="welcome.rememberMe"/>
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-2">
                <button type="submit" class="btn btn-default"><spring:message code="welcome.singIn"/></button>
            </div>
            <div class="col-sm-3">
                <button class="btn-link">
                    <a href="${regUrl}"><spring:message code="welcome.register"/></a>
                </button>
            </div>
        </div>
    </form>
</div>

<div class="col-sm-6 col-md-4 col-md-offset-4">
<c:if test="${param.logout != null}">
    <div class="alert-success" style="text-align: center">
        <p><spring:message code="welcome.successLogout"/></p>
    </div>
</c:if>
<c:if test="${param.login != null}">
    <div class="alert-success" style="text-align: center">
        <p><spring:message code="welcome.successRegister"/></p>
    </div>
</c:if>
<c:if test="${param.loginFail != null}">
    <div class="alert-warning" style="text-align: center">
        <p><spring:message code="welcome.loginFail"/></p>
    </div>
</c:if>
</div>

</body>
</html>
