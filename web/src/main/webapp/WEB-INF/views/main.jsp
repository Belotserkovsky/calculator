<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Calculator</title>

    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/styles.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/submitForm.js"></script>

</head>
<body>

<div id="wrapper">
    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <p class="navbar-text" style="font-style: italic">${user.name}</p>
                        </li>
                        <li>
                            <c:url var="editUrl" value="/calc/user/main?edit"/>
                            <a href="${editUrl}"><spring:message code="userInfo"/></a>
                        </li>
                        <li>
                            <c:url var="historyUrl" value="/calc/user/history?page"/>
                            <a href="${historyUrl}"><spring:message code="historyPage"/></a>
                        </li>
                        <li>
                            <c:url var="logoutUrl" value="/calc/user/main?logout"/>
                            <a href="${logoutUrl}"><spring:message code="logout"/></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <c:url var="localeRu" value="/calc/user/main&locale=ru"/>
                        <li><a href="${localeRu}">RU</a></li>
                        <c:url var="localeEn" value="/calc/user/main&locale=en"/>
                        <li><a href="${localeEn}">EN</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <section id="sectionMain">
        <c:url var="calcUrl" value="/calc/user/main?calc"/>
        <form class="form-horizontal" name="calc" id="calculator" modelAttribute="expression" method="post" action="${calcUrl}">
            <table class="table">
                <tr>
                    <td>
                        <input class="form-control" id="inputExpr" type="text" name="input" value="${expression}"
                               size="16" autocomplete="off" required readonly>
                    </td>
                </tr>
                <tr>
                    <td class="buttons">
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

        <div class="text-center">
            <c:if test="${param.fail != null}">
                <div class="alert-warning" style="text-align: center">
                    <p><spring:message code="calculationFail"/></p>
                </div>
            </c:if>
        </div>
    </section>
    <footer><div id="footer">Developed by K. Belotserkovsky, 2016</div></footer>
</div>
</body>
</html>
