<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오후 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
    <form action="/myPage/save" method="get" name="aa">
    <input type="text" name="memberId" value="${sessionScope.member}">
    <input type="text" name="productId" value="${productDTO.id}">

        <a><img src="${pageContext.request.contextPath}/upload/${productDTO.productProfile}" alt="신상품 이미지" width="200" height="200"></a>

    </form>
</body>
</html>
