<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../../layout/header.jsp" flush="false"></jsp:include>
<c:forEach items="${myPage}" var="my">
<c:forEach items="${product}" var="p">
    <c:choose>
        <c:when test="${my.productId == p.id && my.memberId == sessionScope.member}">
            <a href="#"><img src="${pageContext.request.contextPath}/upload/${p.productProfile}" alt="신상품 이미지" width="200" height="200"></a>
            상품 이름<span>${p.productName}</span>
            상품 가격<span>${p.productPrice}</span>
            상품 설명<span>${p.productContents}</span>
            상품 재고<span>${p.productQuantity}</span>
            <a href="/myPage/delete?id=${my.id}">관심없어짐</a>
        </c:when>
    </c:choose>
</c:forEach>
</c:forEach>
</body>
</html>
