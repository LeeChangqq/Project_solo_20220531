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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css">
    <style>
        /*.main-container{*/
        /*    width: 70%;*/
        /*    margin-left: 15%;*/
        /*    !*border: solid green;*!*/
        /*}*/
        .detail-container{
            margin-top: 50px;
            margin-left: 50px;
        }
        .detail-id-wrap{
            font-size: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="../../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="detail-container">
        <div>
            <span class="detail-id-wrap">아이디: ${member.memberId}</span>
        </div>
        <div>
            <span class="detail-id-wrap">이름: ${member.memberName}</span>
        </div>
        <div>
            <span class="detail-id-wrap">이메일: ${member.memberEmail}</span>
        </div>
        <div>
            <span class="detail-id-wrap">전화번호: ${member.memberMobile}</span>
        </div>
        <div>
            <span class="detail-id-wrap">주소: ${member.memberLocal}</span>
        </div>
        <div>
            <span class="detail-id-wrap">상세 주소: ${member.memberLocal2}</span>
        </div>
        <div>
            <button type="button" class="btn btn-dark" onclick="aa()"><span>회원정보 수정</span></button>
            <button type="button" class="btn btn-outline-dark" onclick="gg()"><span>회원 탈퇴</span></button>
        </div>
    </div>
</div>


<%--아이디 : ${member.memberId} <br>--%>
<%--이름 : ${member.memberName} <br>--%>
<%--이메일 : ${member.memberEmail} <br>--%>
<%--전화번호 : ${member.memberMobile} <br>--%>
<%--주소 : ${member.memberLocal} <br>--%>
<%--상세 주소 : ${member.memberLocal2} <br>--%>
<%--<a href="/member/update">회원정보 수정</a>--%>
<%--<a href="/member/check?id=${sessionScope.memberId.id}">회원 탈퇴</a>--%>
</body>
<script>
    const aa = () => {
        location.href="/member/update";
    }
    const gg = () => {
        location.href="/member/check?id=${sessionScope.member}";
    }
</script>
</html>