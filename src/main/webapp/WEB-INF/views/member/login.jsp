<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/resources/css/login.css">
</head>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <form action="/member/login" method="post" name="c">--%>
<%--        <input type="text" name="memberId" placeholder="아이디" class="form-control" id="memberId">--%>
<%--        <input type="text" name="memberPassword" placeholder="비밀번호" class="form-control" id="memberPassword">--%>
<%--        <input type="submit" value="로그인" class="btn btn-primary">--%>
<%--        <input type="button" onclick="c2()" value="취소" class="btn btn-primary">--%>
<%--    </form>--%>
<%--</div>--%>
<div class="container">
    <h1>로그인</h1>
    <form action="/member/login" method="post">
        <div class="form-control">
            <input type="text" name="memberId" id="memberId" required />
            <label><span>아이디</span></label>
        </div>

        <div class="form-control">
            <input type="password" name="memberPassword" id="memberPassword" required />
            <label><span>패스워드</span></label>
        </div>

        <button type="submit" class="btn">로그인</button>

        <p class="text">회원이 아니신가요? <a href="/member/save">회원가입</a></p>
    </form>
</div>
</body>
<%--<script>--%>
<%--    const c2 = () =>{--%>
<%--        location.href="/";--%>
<%--    }--%>
<%--</script>--%>
</html>