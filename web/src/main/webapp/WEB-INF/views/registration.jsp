<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/styles.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrapper">
    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <p class="navbar-text" style="font-style: italic">
                                <c:choose>
                                <c:when test="${user.name != null}">${user.name}</c:when>
                                    <c:otherwise><spring:message code="guest"/></c:otherwise>
                                </c:choose>
                        </li>
                        <li>
                            <c:url var="mainUrl" value="/calc/user/main"/>
                            <a href="${mainUrl}"><spring:message code="mainPage"/></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/calc/user/new&locale=ru">RU</a></li>
                        <li><a href="/calc/user/new&locale=en">EN</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <section id="section1">
        <div style="text-align: left">
            <h4 class="h4"><spring:message code="registrationPage"/></h4>
        </div>
        <hr>
        <c:url value="/calc/user?add" var="addUserUrl"/>
        <sf:form class="form-horizontal" modelAttribute="mUser" action="${addUserUrl}" method="POST">
            <input type="hidden"  name="userId" value="${mUser.userId}"/>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="name" style="text-align: right"><spring:message code="name"/></label>
                    <div class="col-sm-7">
                        <sf:input class="form-control" id="name" type="text" value="${mUser.name}" path="name" size="30" placeholder="Name"/>
                        <sf:errors path="name" cssStyle="color: red" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label" for="email" style="text-align: right">Email</label>
                    <div class="col-sm-7">
                        <sf:input class="form-control" id="email" type="text" value="${mUser.email}" path="email" placeholder="Email"/>
                        <sf:errors path="email" cssStyle="color: red"/>
                    </div>
                </div>

            <c:choose>
                <c:when test="${user.name != null}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="userName" style="text-align: right"><spring:message code="userName"/></label>
                        <div class="col-sm-7">
                            <input class="form-control" id="userName" type="text" value="${mUser.userName}" maxlength="20" readonly/>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="userName" style="text-align: right"><spring:message code="userName"/></label>
                        <div class="col-sm-7">
                            <sf:input class="form-control" id="userName" type="text" value="${mUser.userName}" path="userName" maxlength="20" placeholder="Username (login)"/>
                            <span class="help-block" id="userName_msg"><spring:message code="noSpaceCharacters"/></span>
                            <sf:errors path="userName" cssStyle="color: red"/>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

                <div class="form-group">
                    <label class="col-sm-3 control-label" for="password"><spring:message code="password"/></label>
                    <div class="col-sm-7">
                        <sf:input class="form-control" id="password" type="text" value="${mUser.password}" path="password" maxlength="20" placeholder="Password"/>
                        <span class="help-block" id="password_msg"><spring:message code="noSpaceCharacters"/></span>
                        <sf:errors path="password" cssStyle="color: red"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-2">
                        <button type="submit" class="btn btn-default"><spring:message code="signUp"/></button>
                    </div>
                </div>
        </sf:form>

        <div class="text-center">
            <c:if test="${param.fail != null}">
                <div class="alert-warning" style="text-align: center">
                    <p><spring:message code="registrationFail"/></p>
                </div>
            </c:if>
        </div>
    </section>
    <footer><div id="footer">Developed by K. Belotserkovsky, 2016</div></footer>
</div>
</body>
</html>