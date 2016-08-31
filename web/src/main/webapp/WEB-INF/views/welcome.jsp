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
<br>
<body>
    <div style="text-align: center">
        <c:url var="localeRu" value="/calc/user/main&locale=ru"/>
        <c:url var="localeEn" value="/calc/user/main&locale=en"/>
        <h4 class="h4"><a href="${localeRu}">RU</a> | <a href="${localeEn}">EN</a></h4>
    </div>
    <div id="wrapper">
        <section id="section1">
            <div style="text-align: center">
                <h4 class="h4"><spring:message code="welcome.page"/></h4>
            </div>
            <hr>
            <c:url value="/calc/j_spring_security_check" var="loginUrl"/>
            <form class="form-horizontal" action="${loginUrl}" method="POST">

                <div class="form-group">
                    <label class="col-sm-4 control-label" for="uName" style="text-align: right"><spring:message code="welcome.userName"/></label>
                    <div class="col-sm-5">
                        <input class="form-control" id="uName" name="userName" placeholder="Username" required="required" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label" for="uPass" style="text-align: right"><spring:message code="welcome.password"/></label>
                    <div class="col-sm-5">
                        <input class="form-control" type="password" id="uPass" name="password" placeholder="Password" required="required">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-4">
                        <div class="checkbox">
                            <label>
                                <input id="remember_me" name="_spring_security_remember_me" type="checkbox"><spring:message code="welcome.rememberMe"/>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-2">
                        <button type="submit" class="btn btn-default"><spring:message code="welcome.singIn"/></button>
                    </div>
                    <div class="col-sm-3">
                        <button class="btn-link">
                            <c:url var="regUrl" value="/calc/user/new"/>
                            <a href="${regUrl}"><spring:message code="welcome.register"/></a>
                        </button>
                    </div>
                </div>
            </form>

            <div class="text-center">
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
        </section>
    </div>
    <footer><div id="footer">Developed by K. Belotserkovsky, 2016</div></footer>
</body>
</html>
