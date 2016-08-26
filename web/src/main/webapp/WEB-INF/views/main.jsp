<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Calculator</title>

    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap.css"/>" rel="stylesheet" type="text/css"/>
    <script> src="/assets/js/submitForm.js"</script>

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
<c:url var="calcUrl" value="/calc/main?calc"/>
<c:url var="logout" value="/calc/user?logout"/>
</br>
    <form name="calc" id="calculator" modelAttribute="expression" method="post" action="${calcUrl}">
        <table>
            <tr>
               <td>
                 <input type="text" name="input" value="${expression}" size="16" class="display" autocomplete="off"
                        pattern="[+-*/][0-9]" required readonly>
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
                  <input type="button" name="res" value="=" onclick="submitform()">
                  <input type="button" name="div"  value="/" onclick="calc.input.value += '/'">
              </td>
            </tr>
        </table>
    </form>

<div style="text-align: center">
    <p><spring:message code="welcome.userName"/> : <security:authentication property="principal.username"/></p>
    <security:authentication property="principal.username" var="userName" scope="request"/>
    <br/>
    <a href="${logout}"><spring:message code="main.logout"/></a>
</div>

</body>
</html>
