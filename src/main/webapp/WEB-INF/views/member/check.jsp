<%--
  Created by IntelliJ IDEA.
  User: hasan
  Date: 2022-06-04
  Time: 오후 4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <input type="text" name="memberPassword" id="memberPassword">
    <input type="button" onclick="check1()" value="탈퇴">
</body>
<script>
    const check1 = () => {
        const pass = document.getElementById("memberPassword").value;
        const passDB = '${member.memberPassword}';
        if(pass == passDB){
            location.href = "/member/delete?id=${member.id}";
        }else {
            location.href = "/member/check?id=${member.id}";
        }

    }
</script>
</html>
