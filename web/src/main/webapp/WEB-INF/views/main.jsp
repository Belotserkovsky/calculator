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
        input[type= button] {width: 40px; height: 30px;}
    </style>

    <c:url var="calcUrl" value="/calc/user/main?calc"/>
    <c:url var="logoutUrl" value="/calc/user/main?logout"/>
    <c:url var="editUrl" value="/calc/user/main?edit"/>
</head>
<body>
<br>
<div style="text-align: right">
    < href="/calc/user/main&locale=ru" style="padding: 10px"><h4 class="h4">RU</h4></a> | <a href="/calc/user/main&locale=en" style="padding: 10px"><h4 class="h4">EN</h4></a>
</div>
<br>
<div style="text-align: center">
    <h4 class="h4"><spring:message code="main.page"/></h4>
</div>
<hr>
    <form class="form-horizontal" name="calc" id="calculator" modelAttribute="expression" method="post" action="${calcUrl}">
        <fieldset>
            <div class="form-group">
                <input type="hidden" name="userName" value="${userName}"/>
                <table style="align-items: center">
                    <tr>
                        <td>
                            <input class="form-control" style="text-align: right" type="text" name="input" value="${expression}"
                                   size="16" class="display" autocomplete="off" pattern="[+-*/][0-9]" required readonly>
                        </td>
                    </tr>
                    <tr>
                        <td class="buttons">
                            <input type="button" class="btn" name="one" value="1" onclick="calc.input.value += '1'">
                            <input type="button" class="btn" name="two" value="2" onclick="calc.input.value += '2'">
                            <input type="button" class="btn" name="three" value="3" onclick="calc.input.value += '3'">
                            <input type="button" class="btn" name="add" value="+" onclick="calc.input.value += '+'">
                            <br>
                            <input type="button"  class="btn" name="four" value="4" onclick="calc.input.value += '4'">
                            <input type="button" class="btn" name="five" value="5" onclick="calc.input.value += '5'">
                            <input type="button" class="btn" name="six" value="6" onclick="calc.input.value += '6'">
                            <input type="button" class="btn" name="sub" value="-" onclick="calc.input.value += '-'">
                            <br>
                            <input type="button" class="btn" name="seven" value="7" onclick="calc.input.value += '7'">
                            <input type="button" class="btn" name="eight" value="8" onclick="calc.input.value += '8'">
                            <input type="button" class="btn" name="nine" value="9" onclick="calc.input.value += '9'">
                            <input type="button" class="btn" name="mul" value="x" onclick="calc.input.value += '*'">
                            <br>
                            <input type="button" class="btn" name="clear" value="c" onclick="calc.input.value = ''">
                            <input type="button" class="btn" name="zero" value="0" onclick="calc.input.value += '0'">
                            <input type="button" class="btn" name="res" value="=" onclick="submitForm()">
                            <input type="button" class="btn" name="div"  value="/" onclick="calc.input.value += '/'">
                        </td>
                    </tr>
                </table>
            </div>
        </fieldset>
    </form>

<div class="col-sm-7">
        <button class="btn-link" href="${logoutUrl}"><spring:message code="main.logout"/></button>
</div>

<div class="col-sm-7">
    <spring:message code="welcome.userName"/> : ${user.name} |
    <button class="btn-link" href="${editUrl}"><spring:message code="main.info"/></button>
</div>

</body>
</html>
