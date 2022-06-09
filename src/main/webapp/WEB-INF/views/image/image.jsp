<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: 오전 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/image/saveFile?productId=${product.id}" method="post" enctype="multipart/form-data">
    <input type="hidden" name="productId" value="${product.id}">
    <input type="file" name="imageFile">
    <input type="submit" value="상품 등록">
</form>
</body>
</html>
