<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <title>Welcome page</title>
    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/styles.css"/>" rel="stylesheet" type="text/css">
    <script src="/assets/js/bootstrap.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <div style="text-align: right">
            <c:url var="localeRu" value="/calc/welcome?locale=ru"/>
            <c:url var="localeEn" value="/calc/welcome?locale=en"/>
            <h5 class="h5"><a href="${localeRu}">RU</a> | <a href="${localeEn}">EN</a></h5>
        </div>
        <br>
        <section id="section1">
            <div style="text-align: left">
                <h4 class="h4"><spring:message code="authentication"/></h4>
            </div>
            <hr>
            <c:url value="/calc/j_spring_security_check" var="loginUrl"/>
            <form class="form-horizontal" action="${loginUrl}" method="POST">

                <div class="form-group">
                    <label class="col-sm-4 control-label" for="uName" style="text-align: right"><spring:message code="userName"/></label>
                    <div class="col-sm-5">
                        <input class="form-control" id="uName" name="userName" required="required" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label" for="uPass" style="text-align: right"><spring:message code="password"/></label>
                    <div class="col-sm-5">
                        <input class="form-control" type="password" id="uPass" name="password" required="required">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-4">
                        <div class="checkbox">
                            <label>
                                <input id="remember_me" name="_spring_security_remember_me" type="checkbox"><spring:message code="rememberMe"/>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-2">
                        <button type="submit" class="btn btn-default"><spring:message code="signIn"/></button>
                    </div>
                    <div class="col-sm-3">
                        <button class="btn-link">
                            <c:url var="regUrl" value="/calc/user/new"/>
                            <a href="${regUrl}"><spring:message code="register"/></a>
                        </button>
                    </div>
                </div>
            </form>

            <div class="text-center">
                <c:if test="${param.logout != null}">
                    <div class="alert-success" style="text-align: center">
                        <p><spring:message code="logoutSuccess"/></p>
                    </div>
                </c:if>
                <c:if test="${param.login != null}">
                    <div class="alert-success" style="text-align: center">
                        <p><spring:message code="registrationSuccess"/></p>
                    </div>
                </c:if>
                <c:if test="${param.loginFail != null}">
                    <div class="alert-warning" style="text-align: center">
                        <p><spring:message code="loginFail"/></p>
                    </div>
                </c:if>
            </div>
        </section>
        <footer><div id="footer">Developed by K. Belotserkovsky, 2016</div></footer>
    </div>
</body>
</html>
