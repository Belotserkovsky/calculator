<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <title>Welcome page</title>
    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap.css"/>" rel="stylesheet" type="text/css"/>
</head>
<body>

    <div style="text-align: center">
        <a href="/welcome?locale=ru" style="padding: 5px">RU</a> | <a href="/welcome?locale=en" style="padding: 5px">EN</a>
    </div>
    <br>

    <c:url value="/j_spring_security_check" var="loginUrl" />

    <c:if test="${param.logout != null}">
        <div class="alert alert-success">
            <p><spring:message code="welcome.successLogout"/></p>
        </div>
    </c:if>
    <c:if test="${param.login != null}">
        <div class="alert-success">
            <p><spring:message code="welcome.successRegister"/></p>
        </div>
    </c:if>

    <form class="form-horizontal" action="${loginUrl}" method="POST">

        <div class="control-group">
            <div class="controls">
                <input type="text" id="userName" placeholder="Username" required="required" />
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                <input type="password" id="password" placeholder="Password" required="required">
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                <label class="checkbox">
                    <input id="remember_me" name="_spring_security_remember_me" type="checkbox"><spring:message code="welcome.rememberMe"/>
                </label>
            </div>
        </div>

        <button type="submit" class="btn"><spring:message code="welcome.singIn"/></button>

        <c:if test="${param.loginFail != null}">
            <div class="alert-warning">
                <p><spring:message code="welcome.loginFail"/></p>
            </div>
        </c:if>

        <button class="btn-link">
            <c:url var="regUrl" value="/user?new"/>
            <a href="${regUrl}"><spring:message code="welcome.register"/></a>
        </button>
    </form>

</body>
</html>
