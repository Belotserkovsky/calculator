<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title></title>
    <style type="text/css">
        #calculator * {font-size: 16px;}
        #calculator table {border: solid 3px silver; border-spacing: 3px; background-color: #EEE; }
        #calculator table td {border-spacing: 3px;}
        input.display {width: 166px; text-align: right;}
        td.buttons {border-top: solid 1px silver;}
        input[type= button] {width: 40px; height: 30px;}
    </style>
</head>
<body>

<c:if test="${param.successAuth != null}">
    <div class="alert alert-success">
        <p><spring:message code="main.success.login"/>!</p>
    </div>
</c:if>

<c:url value="/main?calculate" var="calcUrl" />

<sf:form name="calc" id="calculator" modelAttribute="result" method="post" action="${calcUrl}">
    <table>
        <tr>
            <td>
                <input type="text" name="input" size="16" class="display">
            </td>
        </tr>
        <tr>
            <td class="buttons">
                <input type="button" name="one" value="1" OnClick="calc.input.value += '1'">
                <input type="button" name="two" value="2" OnClick="calc.input.value += '2'">
                <input type="button" name="three" value="3" OnClick="calc.input.value += '3'">
                <input type="button" name="add" value="+" OnClick="calc.input.value += '+'">
                <br>
                <input type="button" name="four" value="4" OnClick="calc.input.value += '4'">
                <input type="button" name="five" value="5" OnClick="calc.input.value += '5'">
                <input type="button" name="six" value="6" OnClick="calc.input.value += '6'">
                <input type="button" name="sub" value="-" OnClick="calc.input.value += '-'">
                <br>
                <input type="button" name="seven" value="7" OnClick="calc.input.value += '7'">
                <input type="button" name="eight" value="8" OnClick="calc.input.value += '8'">
                <input type="button" name="nine" value="9" OnClick="calc.input.value += '9'">
                <input type="button" name="mul" value="x" OnClick="calc.input.value += '*'">
                <br>
                <input type="button" name="clear" value="c" OnClick="calc.input.value = ''">
                <input type="button" name="zero" value="0" OnClick="calc.input.value += '0'">
                <input type="submit" name="res" value="=" OnClick="calc.input.value = '${result}'">
                <input type="button" name="div"  value="/" OnClick="calc.input.value += '/'">
            </td>
        </tr>
    </table>
</sf:form>

<p><spring:message code="welcome.userName"/> : ${user.name} (<security:authentication property="principal.username"/>)</p>
<br/>
<c:url var="logout" value="/user?logout"/>
<a href="${logout}"><spring:message code="main.logout"/></a>
</body>
</html>
