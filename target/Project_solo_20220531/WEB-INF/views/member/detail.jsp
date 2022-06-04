<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
아이디 : ${sessionScope.memberId.memberId} <br>
이름 : ${sessionScope.memberId.memberName} <br>
이메일 : ${sessionScope.memberId.memberEmail} <br>
전화번호 : ${sessionScope.memberId.memberMobile} <br>
주소 : ${sessionScope.memberId.memberLocal} <br>
상세 주소 : ${sessionScope.memberId.memberLocal2} <br>
<a href="/member/update">회원정보 수정</a>
<a href="/member/check?id=${sessionScope.memberId.id}">회원 탈퇴</a>
</body>
</html>
