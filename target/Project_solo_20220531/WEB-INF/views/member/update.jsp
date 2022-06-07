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
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
    <style>
        * {
            margin: 0px;
            padding: 0px;
            text-decoration: none;
            font-family:sans-serif;
        }
        /*body {*/
        /*    background-image: ;*/
        /*}*/
        .joinForm {
            position:absolute;
            width:400px;
            height:400px;
            /*padding: 30px,20px;*/
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
<form action="/member/update" method="post" class="joinForm" name="updateForm">
    <h2>회원정보 수정</h2>
    <input name="id" type="hidden" value="${updateMember.id}" readonly>
    <input name="memberId" type="hidden" value="${updateMember.memberId}" readonly>
    <div class="textForm">
        <input type="text" name="memberPassword" placeholder="비밀번호" id="memberPassword" class="pw" onblur="pCheck()" value="${updateMember.memberPassword}">
        <span id="r1"></span>
    </div>
    <div class="textForm">
        <input type="text" name="memberPassword2" placeholder="비밀번호" id="memberPassword2" class="pw" onblur="pCheck2()">
        <span id="r2"></span>
    </div>
    <div class="textForm">
        <input type="text" name="memberName" placeholder="이름" id="memberName" class="name" onblur="name1()" value="${updateMember.memberName}">
        <span id="r3"></span>
    </div>
    <div class="textForm">
        <input type="text" name="memberMobile" placeholder="010-0000-0000" id="memberMobile" class="cellphoneNo" value="${updateMember.memberMobile}" onblur="phone1()">
        <span id="r5"></span>
    </div>
    <div class="textForm">
        <input type="text" name="memberEmail" placeholder="이메일" id="memberEmail" class="email" onblur="email1()" value="${updateMember.memberEmail}">
        <span id="r4"></span>
    </div>
    <div class="textForm">
        <input type="text" name="memberLocal" placeholder="주소" id="sample5_address" class="nickname" onblur="local()" value="${updateMember.memberLocal}">
        <input type="text" name="memberLocal2" placeholder="상세 주소입력" id="local" class="nickname" onblur="local()" value="${updateMember.memberLocal2}">
        <span id="r6"></span>
    </div>
    <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="btn">
    <input type="button" onclick="click1()" value="수정하기" class="btn">
    <input type="button" onclick="c()" value="취소" class="btn">
</form>
</body>
<script>
    const pCheck = () => {
        const mPass = document.getElementById("memberPassword").value;
        const r1 = document.getElementById("r1");
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-_!#$~`@%^&*()=+|/?.,><])[a-z\d-_!#$~`@%^&*()=+|/?.,><]{8,16}$/;
        if(mPass.match(exp)) {
            r1.innerHTML = "";
            return true;
        }else {
            r1.innerHTML = "영어, 숫자, 특수문자를 섞어 8자이상 16자 이하로 해주세요.";
            r1.style.color = "red";
        }
    }
    const pCheck2 = () => {
        const mPass = document.getElementById("memberPassword").value;
        const mPass2 = document.getElementById("memberPassword2").value;
        const r2 = document.getElementById("r2");
        if(mPass == mPass2){
            r2.innerHTML = "";
            return true;
        }else {
            r2.innerHTML = "비밀번호가 일치하지 않습니다.";
            r2.style.color = "red";
        }
    }
    const name1 = () => {
        const mName = document.getElementById("memberName").value;
        const r3 = document.getElementById("r3");
        if(mName == ""){
            r3.innerHTML = "이름을 입력해주세요.";
            r3.style.color = "red";
        }else {
            r3.innerHTML = "";
            return true;
        }
    }
    const email1 = () => {
        const mEmail = document.getElementById("memberEmail").value;
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-@.])[a-z\d-@\d-.]{1,20}$/;
        const r4 = document.getElementById("r4");
        if(mEmail.match(exp)) {
            r4.innerHTML = "";
            return true;
        }else {
            r4.innerHTML = "이메일 형식에 맞게 작성해주세요.";
            r4.style.color = "red";
        }
    }
    const phone1 = () =>{
        const mPhone = document.getElementById("memberMobile").value;
        const r5 = document.getElementById("r5");
        const exp = /^\d{3}-\d{4}-\d{4}$/;
        if(mPhone.match(exp)) {
            r5.innerHTML = "";
            return true;
        }else {
            r5.innerHTML = "형식에 맞게 작성해주세요.";
            r5.style.color = "red";
        }
    }
    const local = () => {
        const memberLocal = document.getElementById("sample5_address").value;
        const memberLocal2 = document.getElementById("local").value;
        const r6 = document.getElementById("r6");
        if(memberLocal == "" && memberLocal2 == "") {
            r6.innerHTML = "주소를 입력해주세요.";
            r6.style.color = "red";
        }else{
            r6.innerHTML = "";
            return true;
        }
    }
    const click1 = () => {
        if(pCheck() == true && pCheck2() == true && name1() == true && email1() == true && phone1() == true && local() ==true) {
            updateForm.submit();
        }else {
            alert("모든 항목이 필수 입력입니다.");
        }
    }
    const c = () => {
        location.href = "/member/detail?id=${updateMember.id}";
    }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 API KEY를 사용하세요&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</html>