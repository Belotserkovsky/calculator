<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>History</title>

    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/css/styles.css"/>" rel="stylesheet" type="text/css"/>
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
                            <p class="navbar-text" style="font-style: italic">${user.name}</p>
                        </li>
                        <li>
                            <c:url var="editUrl" value="/calc/user/main?edit"/>
                            <a href="${editUrl}"><spring:message code="main.info"/></a>
                        </li>
                        <li>
                            <c:url var="logoutUrl" value="/calc/user/main?logout"/>
                            <a href="${logoutUrl}"><spring:message code="main.logout"/></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <c:url var="localeRu" value="/calc/user/history?page&locale=ru"/>
                        <li><a href="${localeRu}">RU</a></li>
                        <c:url var="localeEn" value="/calc/user/history?page&locale=en"/>
                        <li><a href="${localeEn}">EN</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <section id="section2">
        <table class="table table-striped">
            <caption><spring:message code="history.page"/></caption>
            <tr>
                <th>ID</th>
                <th>Creation date</th>
                <th>Expression</th>
                <th>Result</th>
            </tr>
            <c:forEach var="history" items="${listHistory}">
                <tr>
                    <td>${history.id}</td>
                    <td>${history.creationDate}</td>
                    <td>${history.expression}</td>
                    <td>${history.result}</td>
                </tr>
            </c:forEach>
        </table>

        <%--For displaying Page numbers.
        The when condition does not display a link for the current page--%>

        <table class="table" id="tHistory" border="0">
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

        <%--For displaying Previous and Next link xcept for the 1st page --%>
        <nav aria-label="...">
            <ul class="pager">
                <li>
                    <c:if test="${currentPage != 1}">
                        <a href="/calc/user/history?page=${currentPage - 1}">Previous</a>
                    </c:if>
                </li>
                <li>
                    <c:if test="${currentPage lt numberOfPages}">
                        <td><a href="/calc/user/history?page=${currentPage + 1}">Next</a></td>
                    </c:if>
                </li>
            </ul>
        </nav>
    </section>
</div>
<footer><div id="footer">Developed by K. Belotserkovsky, 2016</div></footer>

</body>
</html>
