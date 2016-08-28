<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>History</title>

    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css"/>
    <script src="/assets/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<div style="text-align: right">
    < href="/calc/user/history&locale=ru" style="padding: 10px"><h4 class="h4">RU</h4></a> | <a href="/calc/user/history&locale=en" style="padding: 10px"><h4 class="h4">EN</h4></a>
</div>
<br>
<div style="text-align: center">
    <h4 class="h4"><spring:message code="history.page"/></h4>
</div>
<hr>
<table class="table table-striped">
    <caption>${user.name}</caption>
    <tr>
        <th>ID</th>
        <th>Creation date</th>
        <th>Expression</th>
        <th>Result</th>
    </tr>
    <c:forEach var="history" items="${historyList}">
        <tr>
            <td>${history.id}</td>
            <td>${history.creationDate}</td>
            <td>${history.expression}</td>
            <td>${history.result}</td>
        </tr>
    </c:forEach>
</table>
<%--For displaying Previous link except for the 1st page --%>
<c:if test="${currentPage != 1}">
    <td><a href="/calc/user/history?page=${currentPage - 1}">Previous</a></td>
</c:if>

<%--For displaying Page numbers.
The when condition does not display a link for the current page--%>
<table class="table" border="0">
    <tr>
        <c:forEach begin="1" end="${numberOfPages}" var="i">
            <c:choose>
                <c:when test="${currentPage eq i}">
                    <td>${i}</td>
                </c:when>
                <c:otherwise>
                    <td><a href="/calc/user/history?page=${i}">${i}</a></td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
</table>

<%--For displaying Next link --%>
<c:if test="${currentPage lt numberOfPages}">
    <td><a href="/calc/user/history?page=${currentPage + 1}">Next</a></td>
</c:if>
<hr>
</body>
</html>
