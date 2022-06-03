<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--<style>--%>
<%--    .form-control-dark {--%>
<%--        border-color: var(--bs-gray);--%>
<%--    }--%>
<%--    .form-control-dark:focus {--%>
<%--        border-color: #fff;--%>
<%--        box-shadow: 0 0 0 .25rem rgba(255, 255, 255, .25);--%>
<%--    }--%>

<%--    .text-small {--%>
<%--        font-size: 85%;--%>
<%--    }--%>

<%--    .dropdown-toggle {--%>
<%--        outline: 0;--%>
<%--    }--%>
<%--</style>--%>
</head>
<body>
    <header>
        <a href="/member/login-form">로그인</a> &nbsp;
        <a href="/member/logout">로그아웃</a> &nbsp;
        <a href="/member/detail?id=${sessionScope.memberId.id}">개인정보</a> &nbsp;


    </header>
</body>
</html>
