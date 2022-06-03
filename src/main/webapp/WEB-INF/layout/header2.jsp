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
</head>
<body>
<header>
<%--    <img src="${pageContext.request.contextPath}/upload/${boardDTO.bFile}" alt="" height="100" width="100">--%>
    <a href="/member/logout">로그아웃</a> &nbsp;
    <a href="/board/save-form">글쓰기</a> &nbsp;
    <a href="/board/paging">글목록</a> &nbsp;
    <a href="/member/update-form">마이페이지</a> &nbsp;
    <a href="/member/findAll">회원리스트</a> &nbsp;
</header>
</body>
</html>
