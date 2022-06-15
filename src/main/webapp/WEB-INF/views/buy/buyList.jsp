<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-15
  Time: 오후 4:51
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
<jsp:include page="../../layout/header.jsp" flush="false"></jsp:include>
<table class="table">
    <tr>
        <th></th>
        <th>상품 이름</th>
        <th>상품 가격</th>
        <th>구매 수량</th>
    </tr>
<c:forEach items="${buyList}" var="buy">
  <c:forEach items="${product}" var="p">
      <c:choose>
          <c:when test="${p.id == buy.productId}">
              <tr>
                  <td><a href="#"><img src="${pageContext.request.contextPath}/upload/${p.productProfile}" alt="신상품 이미지" width="200" height="200"></a></td>
                  <td><span>${p.productName}</span></td>
                  <td><span>${p.productPrice}</span></td>
                  <td><span>${buy.myQuantity}</span></td>
              </tr>
          </c:when>
      </c:choose>
  </c:forEach>
</c:forEach>
</table>
</body>
</html>
