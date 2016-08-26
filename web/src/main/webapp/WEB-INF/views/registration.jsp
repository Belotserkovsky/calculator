<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap.css"/>" rel="stylesheet" type="text/css"/>
</head>
<body>
<div style="float: right">
    <a href="/user?new&locale=ru" style="padding: 5px">RU</a> | <a href="/user?new&locale=en" style="padding: 5px">EN</a>
</div>
<br>
<p><spring:message code="registration.fill.fields"/>:</p>
<c:url value="/calc/user?add" var="addUserUrl" />

<div style="text-align: center">
<sf:form method="POST" modelAttribute="user" action="${addUserUrl}">
    <input type="hidden"  name="userId" value="${user.userId}"/>
    <fieldset>
        <table cellspacing="0">
            <tr>
                <th><label for="name"><spring:message code="registration.name"/></label></th>
                <td>
                    <sf:input id="name" type="text" value="${user.name}" path="name" size="30" placeholder="User Name"/><br/>
                    <sf:errors path="name" cssStyle="color: red" />
                </td>
            </tr>
            <tr>
                <th><label for="email">Email</label></th>
                <td>
                    <sf:input id="email" type="text" value="${user.email}" path="email" placeholder="Email"/>
                    <sf:errors path="email" cssStyle="color: red"/>
                </td>
            </tr>
            <tr>
                <th><label for="userName"><spring:message code="registration.userName"/></label></th>
                <td>
                    <sf:input id="userName" type="text" value="${user.userName}" path="userName" maxlength="20" placeholder="User Name"/>
                    <small id="userName_msg"><spring:message code="registration.noSpaceCharacters"/></small><br/>
                    <sf:errors path="userName" cssStyle="color: red"/>
                </td>
            </tr>
            <tr>
                <th><label for="password"><spring:message code="registration.password"/></label></th>
                <td>
                    <sf:input id="password" type="text" value="${user.password}" path="password" maxlength="20" placeholder="Password"/>
                    <small id="password_msg"><spring:message code="registration.noSpaceCharacters"/></small><br/>
                    <sf:errors path="password" cssStyle="color: red"/>
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <input id="button" type="submit" value="<spring:message code="registration.singUp"/>"/>
                </td>
            </tr>
        </table>
    </fieldset>
</sf:form>
</div>
</body>
</html>