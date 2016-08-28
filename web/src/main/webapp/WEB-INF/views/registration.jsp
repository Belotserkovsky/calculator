<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css"/>
    <script src="/assets/js/bootstrap.min.js"></script>
</head>
<br>
<div style="text-align: right">
    <a href="/calc/user?new&locale=ru" style="padding: 10px"><h4 class="h4">RU</h4></a> | <a href="/calc/user?new&locale=en" style="padding: 10px"><h4 class="h4">EN</h4></a>
</div>
<br>

<c:url value="/calc/user?add" var="addUserUrl" />
<c:url value="/calc/user/main" var="backUrl" />

<div style="text-align: center">
    <h4 class="h4"><spring:message code="registration.page"/> (${name})</h4>
</div>
<hr>
    <sf:form class="form-horizontal" modelAttribute="user" action="${addUserUrl}" method="POST">
        <fieldset>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="name" style="text-align: right"><spring:message code="registration.name"/></label>
                <div class="col-sm-7">
                <sf:input class="form-control" id="name" type="text" value="${user.name}" path="name" size="30" placeholder="Name"/>
                <sf:errors path="name" cssStyle="color: red" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label" for="email" style="text-align: right">Email</label>
            <div class="col-sm-7">
                <sf:input class="form-control" id="email" type="text" value="${user.email}" path="email" placeholder="Email"/>
                <sf:errors path="email" cssStyle="color: red"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label" for="userName" style="text-align: right"><spring:message code="registration.userName"/></label>
            <div class="col-sm-7">
                <sf:input class="form-control" id="userName" type="text" value="${user.userName}" path="userName" maxlength="20" placeholder="User Name"/>
                <span class="help-block" id="userName_msg"><spring:message code="registration.noSpaceCharacters"/></span>
                <sf:errors path="userName" cssStyle="color: red"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label" for="password"><spring:message code="registration.password"/></label>
            <div class="col-sm-7">
                <sf:input class="form-control" id="password" type="text" value="${user.password}" path="password" maxlength="20" placeholder="Password"/>
                <span class="help-block" id="password_msg"><spring:message code="registration.noSpaceCharacters"/></span>
                <sf:errors path="password" cssStyle="color: red"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-2">
                <button type="submit" class="btn btn-default"><spring:message code="registration.singUp"/></button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-2">
                <button class="btn-link">
                    <a href="${backUrl}"><spring:message code="registration.back"/></a>
                </button>
            </div>
            </div>
        </fieldset>
    </sf:form>

<div class="col-sm-7">
    <c:if test="${param.fail != null}">
        <div class="alert-warning" style="text-align: center">
            <p><spring:message code="registration.fail"/></p>
        </div>
    </c:if>
</div>

</body>
</html>