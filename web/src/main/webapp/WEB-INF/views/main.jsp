<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Calculator</title>

    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css"/>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/submitForm.js"></script>

    <style type="text/css">
        #calculator * {font-size: 16px;}
        #calculator table {border: solid 3px #dddddd; border-spacing: 3px; background-color: #fafafa; }
        #calculator table td {border-spacing: 3px;}
        input.display {width: 166px; text-align: right;}
        td.buttons {border-top: solid 1px silver;}
        input[type= button] {width: 60px; height: 60px;}
    </style>
</head>
<body>

<c:url var="calcUrl" value="/calc/user/main?calc"/>
<c:url var="logoutUrl" value="/calc/user/main?logout"/>
<c:url var="editUrl" value="/calc/user/main?edit"/>
<c:url var="historyUrl" value="/calc/user/history?page"/>
<c:url var="localeRu" value="/calc/user/main&locale=ru"/>
<c:url var="localeEn" value="/calc/user/main&locale=en"/>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <p class="navbar-text">${user.name}</p>
                </li>
                <li>
                    <a href="${editUrl}"><spring:message code="main.info"/></a>
                </li>
                <li>
                    <a href="${historyUrl}"><spring:message code="history.page"/></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${localeRu}" style="padding: 5px">RU</a></li>
                <li><a href="${localeEn}" style="padding: 5px">EN</a></li>
                <li><a href="${logoutUrl}"><spring:message code="main.logout"/></a></li>
            </ul>
        </div>
    </div>
</nav>
<br>
<form class="form-horizontal" name="calc" id="calculator" modelAttribute="expression" method="post" action="${calcUrl}">
    <table class="table" style="border: 1px solid; width: 254px">
        <tr>
            <td>
                <input class="form-control" style="width: 254px; text-align: right" type="text" name="input" value="${expression}"
                       size="16" class="display" autocomplete="off" pattern="[+-*/][0-9]" required readonly>
            </td>
        </tr>
        <tr>
            <td class="buttons" style="border: 1px solid; width: auto">
                <input type="button" name="one" value="1" onclick="calc.input.value += '1'">
                <input type="button" name="two" value="2" onclick="calc.input.value += '2'">
                <input type="button" name="three" value="3" onclick="calc.input.value += '3'">
                <input type="button" name="add" value="+" onclick="calc.input.value += '+'">
                <br>
                <input type="button" name="four" value="4" onclick="calc.input.value += '4'">
                <input type="button" name="five" value="5" onclick="calc.input.value += '5'">
                <input type="button" name="six" value="6" onclick="calc.input.value += '6'">
                <input type="button" name="sub" value="-" onclick="calc.input.value += '-'">
                <br>
                <input type="button" name="seven" value="7" onclick="calc.input.value += '7'">
                <input type="button" name="eight" value="8" onclick="calc.input.value += '8'">
                <input type="button" name="nine" value="9" onclick="calc.input.value += '9'">
                <input type="button" name="mul" value="x" onclick="calc.input.value += '*'">
                <br>
                <input type="button" name="clear" value="c" onclick="calc.input.value = ''">
                <input type="button" name="zero" value="0" onclick="calc.input.value += '0'">
                <input type="button" name="res" value="=" onclick="submitForm()">
                <input type="button" name="div"  value="/" onclick="calc.input.value += '/'">
            </td>
        </tr>
    </table>
</form>

<div class="col-sm-6 col-md-4 col-md-offset-4">
    <c:if test="${param.fail != null}">
        <div class="alert-warning" style="text-align: center">
            <p><spring:message code="main.calculation.fail"/></p>
        </div>
    </c:if>
</div>
</body>
</html>
