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
                                <c:when test="${sessionUserName != null}">${sessionUserName}</c:when>
                                    <c:otherwise><spring:message code="guest"/></c:otherwise>
                                </c:choose>
                        </li>
                        <li>
                            <c:url var="mainUrl" value="/calc/user/main"/>
                            <a href="${mainUrl}"><spring:message code="mainPage"/></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/calc/user/new?locale=ru">RU</a></li>
                        <li><a href="/calc/user/new?locale=en">EN</a></li>
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
        <c:url value="/calc/user/add" var="addUserUrl"/>
        <sf:form class="form-horizontal" modelAttribute="user" action="${addUserUrl}" method="POST">
            <input type="hidden"  name="userId" value="${user.userId}"/>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputName" style="text-align: right"><spring:message code="name"/></label>
                    <div class="col-sm-7">
                        <sf:input class="form-control" type="text" id="inputName" value="${user.name}" path="name"/>
                        <div class="help-block"><sf:errors path="name" cssStyle="color: red"/></div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputEmail" style="text-align: right">Email</label>
                    <div class="col-sm-7">
                        <sf:input class="form-control" type ="text" id="inputEmail" value="${user.email}" path="email"/>
                        <div class="help-block"><sf:errors path="email" cssStyle="color: red"/></div>
                    </div>
                </div>

            <c:choose>
                <c:when test="${sessionUserName != null}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputUserName" style="text-align: right"><spring:message code="userName"/></label>
                        <div class="col-sm-7">
                            <input class="form-control" id="inputUserName" type="text" value="${user.userName}" disabled/>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputUserName" style="text-align: right"><spring:message code="userName"/></label>
                        <div class="col-sm-7">
                            <sf:input class="form-control" id="inputUserName" type="text" value="${user.userName}" path="userName"/>
                            <div class="help-block"><sf:errors path="userName" cssStyle="color: red"/></div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

                <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputPassword"><spring:message code="password"/></label>
                    <div class="col-sm-7">
                        <sf:input class="form-control" id="inputPassword" value="${user.password}" path="password" maxlength="255"/>
                        <div class="help-block"><sf:errors path="password" cssStyle="color: red"/></div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-2">
                        <button type="submit" class="btn btn-default"><spring:message code="signUp"/></button>
                    </div>
                </div>
        </sf:form>
    </section>
    <div class="text-center">
        <c:if test="${param.fail != null}">
            <div class="alert-warning" style="text-align: center">
                <p><spring:message code="registrationFail"/></p>
            </div>
        </c:if>
    </div>
    <footer><div id="footer">Developed by K. Belotserkovsky, 2016</div></footer>
</div>
</body>
</html>