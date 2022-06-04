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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>

    <link rel="stylesheet" href="../../resources/css/header.css">
</head>
<body>
            <header>
                <div class="header-container">
                    <div class="header-title">
                        <a href="/">홈 화면</a>
                    </div>
                    <div class="link-list-container">
                        <div class="login-form-container">
                            <a href="/member/login-form">로그인</a>
                        </div>
                        <div class="symbol-container">
                            <a>|</a>
                        </div>
                        <div class="logout-container">
                            <a href="/member/logout">로그아웃</a>
                        </div>
                        <div class="symbol-container">
                            <a>|</a>
                        </div>
                        <div class="detail-container">
                            <a href="/member/detail?id=${sessionScope.memberId.id}">개인정보</a>
                        </div>
                    </div>
                </div>
            </header>
</body>
</html>
