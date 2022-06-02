<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 7:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
    <style>
        * {
            margin: 0px;
            padding: 0px;
            text-decoration: none;
            font-family:sans-serif;

        }

        body {
            background-image:#34495e;
        }

        .joinForm {
            position:absolute;
            width:400px;
            height:400px;
            padding: 30px, 20px;
            background-color:#FFFFFF;
            text-align:center;
            top:40%;
            left:50%;
            transform: translate(-50%,-50%);
            border-radius: 15px;
        }

        .joinForm h2 {
            text-align: center;
            margin: 30px;
        }

        .textForm {
            border-bottom: 2px solid #adadad;
            margin: 30px;
            padding: 10px 10px;
        }


        .id {
            width: 100%;
            border:none;
            outline:none;
            color: #636e72;
            font-size:16px;
            height:25px;
            background: none;
        }

        .pw {
            width: 100%;
            border:none;
            outline:none;
            color: #636e72;
            font-size:16px;
            height:25px;
            background: none;
        }

        .name {
            width: 100%;
            border:none;
            outline:none;
            color: #636e72;
            font-size:16px;
            height:25px;
            background: none;
        }

        .email {
            width: 100%;
            border:none;
            outline:none;
            color: #636e72;
            font-size:16px;
            height:25px;
            background: none;
        }

        .nickname {
            width: 100%;
            border:none;
            outline:none;
            color: #636e72;
            font-size:16px;
            height:25px;
            background: none;
        }

        .cellphoneNo {
            width: 100%;
            border:none;
            outline:none;
            color: #636e72;
            font-size:16px;
            height:25px;
            background: none;
        }

        .btn {
            position:relative;
            left:40%;
            transform: translateX(-50%);
            margin-bottom: 40px;
            width:80%;
            height:40px;
            background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
            background-position: left;
            background-size: 200%;
            color:white;
            font-weight: bold;
            border:none;
            cursor:pointer;
            transition: 0.4s;
            display:inline;
        }

        .btn:hover {
            background-position: right;
        }
    </style>
</head>
<body>
        <form action="/member/save" method="post" class="joinForm" name="saveForm">
            <h2>회원가입</h2>
            <div class="textForm">
                <input type="text" name="memberId" placeholder="아이디" id="memberId" class="id">
            </div>
            <div class="textForm">
                <input type="text" name="memberPassword" placeholder="비밀번호" id="memberPassword" class="pw">
            </div>
            <div class="textForm">
                <input type="text" name="memberPassword2" placeholder="비밀번호" id="memberPassword2" class="pw">
            </div>
            <div class="textForm">
                <input type="text" name="memberName" placeholder="이름" id="memberName" class="name">
            </div>
            <div class="textForm">
                <input type="text" name="memberMobile" placeholder="010-0000-0000" id="memberMobile" class="cellphoneNo">
            </div>
            <div class="textForm">
                <input type="text" name="memberEmail" placeholder="이메일" id="memberEmail" class="email">
            </div>
            <div class="textForm">
                <input type="text" name="memberLocal" placeholder="주소" id="memberLocal" class="nickname">
            </div>
            <input type="button" onclick="idCheck()" value="가입하기" class="btn">

        </form>
</body>
<script>
    const idCheck = () => {
        const memberId = document.getElementById("memberId").value;
        $.ajax({
            type: "post",
            url: "/member/check",
            data: {"memberId": memberId},
            dataType: "text",
            success: function (data) {
                if(memberId == ""){
                    alert("아이디를 입력해주세요")
                }else if(data == "ok") {
                }else {
                    alert("중복된 아이디입니다")
                }
            },
            error: function (){
                alert("에러")
            }
        });
    }
    const pCheck = () => {
        const mPass = document.getElementById("memberPassword").value;
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-_!#$~`@%^&*()=+|/?.,><])[a-z\d-_!#$~`@%^&*()=+|/?.,><]{8,16}$/;
        if(mPass.match(exp)) {
            return true;
        }else {
            alert("영어, 숫자, 특수문자를 섞어 8자이상 16자 이하로 해주세요")
        }
    }
    const pCheck2 = () => {
        const mPass = document.getElementById("memberPassword").value;
        const mPass2 = document.getElementById("memberPassword2").value;
        if(mPass == mPass2){
            return true;
        }else {
            alert("비밀번호가 일치하지 않습니다.")
        }
    }
    const name1 = () => {
        const mName = document.getElementById("memberName").value;
        if(mName == ""){
            alert("이름을 입력해주세요")
        }else {
            return true;
        }
    }
    const email1 = () => {
        const mEmail = document.getElementById("memberEmail").value;
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-@.])[a-z\d-@\d-.]{1,20}$/;
        if(mEmail.match(exp)) {
            return true;
        }else {
            alert("이메일 형식에 맞게 작성해주세요.")
        }

    }
    const phone1 = () =>{
        const mPhone = document.getElementById("memberMobile").value;
        const exp = /^\d{3}-\d{4}-\d{4}$/;
        if(mPhone.match(exp)) {
            return true;
        }else {
            alert("형식에 맞게 작성해 주세요.")
        }
    }
    const click1 = () => {
        const mId = document.getElementById("mId").value;
        $.ajax({
            type: "post",
            url: "/member/check",
            data: {"mId": mId},
            dataType: "text",
            success: function (data) {
                if(data == "ok" && pCheck() == true && pCheck2() == true && name1() == true && email1() == true && phone1() == true) {
                    saveForm.submit();
                }else {
                    alert("모든 항목이 필수 입력입니다.");
                }
            },
            error: function (){
                alert("에러")
            }
        });
    }
</script>
</html>
