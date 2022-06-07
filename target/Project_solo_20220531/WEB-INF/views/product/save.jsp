<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-06-05
  Time: 오후 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product/saveFile" method="post" enctype="multipart/form-data">
    <input type="text" name="productName" placeholder="상품이름">
    <input type="text" name="productContents" placeholder="상품 설명">
    <input type="text" name="productPrice" placeholder="가격">
    <input type="text" name="productQuantity" placeholder="재고">
    <input type="file" name="productFile">
    <input type="submit" value="상품 등록">
</form>
</body>
</html>