<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
    <form action="/member/login" method="post" name="c">
        <input type="text" name="memberId" placeholder="아이디" class="form-control" id="memberId">
        <input type="text" name="memberPassword" placeholder="비밀번호" class="form-control" id="memberPassword">
        <input type="submit" value="로그인" class="btn btn-primary">
    </form>
</div>
</body>
