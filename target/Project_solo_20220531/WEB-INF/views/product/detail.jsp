<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오후 7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css">
    <style>
        .product-container {
            width: 70%;
            margin-left: 15%;
        }
        .product-detail-container {
            display: flex;
            padding: 20px 20px;
        }
        .product-img-container {
            width: 500px;
            height: 500px;
        }
        .product-img-container .product-img {
            padding: 0 2px 2px 0;
            width: 500px;
            height: 500px;
        }
        .product-intro-container {
            width: 500px;
            height: 500px;
            margin-left: 15%;
        }
        .product-name-wrap {
            margin-bottom: 20px;
        }
        .product-name-wrap h2 {
            font-size: 32px;
            font-weight: 700;
        }
        .product-contents-wrap {
            height: 275px;
            margin-bottom: 40px;
            line-height: 1.75rem;
        }
        .product-stock-price-wrap {
            display: flex;
            margin-bottom: 40px;
        }
        .product-stock-wrap span {
            font-size: 18px;
        }
        .product-price-wrap {
            margin-left: auto;
        }
        .product-price-wrap .won-symbol {
            margin-right: 20px;
        }
        .button-container {
            display: flex;
        }
        .product-quantity {
            width: 50px;
            height: 38px;
            margin-left: 20px;
        }
        .button-container .input-quantity {
            width: 150px;
            display: flex;
        }
        .button-container .cart-save-button {
            margin-left: 20px;
        }
        .product-detail-img-container {
            margin-top: 100px;
        }
        .product-detail-img-title {
            border-bottom: 1px solid #aaa;
            margin-bottom: 40px;
        }
        .detail-img {
            padding: 0 100px;
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="../../layout/header.jsp" flush="false"></jsp:include>

<div class="product-container">
    <div class="product-detail-container">
        <div class="product-img-container">
            <img class="product-img" src="${pageContext.request.contextPath}/upload/${product.productProfile}" alt="신상품 이미지">
        </div>

        <div class="product-intro-container">
            <div class="product-name-wrap">
                <h2 class="product-name">${product.productName}</h2>
            </div>

            <div class="product-contents-wrap">
                <span class="product-contents">${product.productContents} Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>
            </div>

            <div class="product-stock-price-wrap">
                <div class="product-stock-wrap">
                    <span>재고 : </span>
                    <span class="product-stock-wrap">${product.productQuantity}</span>
                </div>

                <div class="product-price-wrap">
                    <span class="won-symbol">₩</span>
                    <span class="product-price">${product.productPrice}</span>
                </div>
            </div>

            <div class="button-container">
                <div class="input-quantity">
                    <span>수량 : </span>
                    <input type="text" class="product-quantity" id="myQuantity" name="myQuantity">
                </div>
                <div class="product-buy">
                    <button type="button" class="btn btn-dark" onclick="aa()">구매</button>
                </div>
                <div class="cart-save-button">
                    <button type="button" class="btn btn-outline-dark" onclick="a123(${product.id})">장바구니</button>
                </div>
            </div>
        </div>
    </div>

    <div class="product-detail-img-container">
        <div class="product-detail-img-title">
            <h2>상세 이미지</h2>
        </div>
        <div class="detail-img">
            <c:forEach var="image" items="${image}">
                <c:choose>
                    <c:when test="${image.productId == product.id}">
                        <div class="image-container">
                            <a href="/product/detail?id=${product.id}"><img src="${pageContext.request.contextPath}/upload/${image.image}" alt="신상품 이미지" width="800" height="800"></a>
                        </div>
                <c:choose>
                    <c:when test="${sessionScope.memberId.memberId == 'admin'}">
                        <div class="delete-container">
                            <a href="/image/delete?id=${image.id}&productId=${product.id}">삭제</a>
                        </div>
                    </c:when>
                </c:choose>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
    </div>
</div>
<%--<div class="main-image-container">--%>
<%--    <div>--%>
<%--        <a href="/product/detail?id=${product.id}"><img src="${pageContext.request.contextPath}/upload/${product.productProfile}" alt="신상품 이미지" width="500" height="500"></a>--%>
<%--    </div>--%>
<%--    <div class="product-container-main">--%>
<%--        <div>--%>
<%--            ${product.productName}--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            ${product.productContents}--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            구매 수량<input type="text" value="" id="myQuantity" name="myQuantity">--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <a href="javascript:void(0)" onclick="aa()" class="cart"><span>구매</span></a><br>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<c:forEach items="${image}" var="image">--%>
<%--    <c:choose>--%>
<%--        <c:when test="${image.productId == product.id}">--%>
<%--            <div class="image-container">--%>
<%--                <a href="/product/detail?id=${product.id}"><img src="${pageContext.request.contextPath}/upload/${image.image}" alt="신상품 이미지" width="1000" height="2000"></a>--%>
<%--            </div>--%>
<%--            <c:choose>--%>
<%--                <c:when test="${sessionScope.memberId.memberId == 'admin'}">--%>
<%--                    <div class="delete-container">--%>
<%--                        <a href="/image/delete?id=${image.id}&productId=${product.id}">삭제</a>--%>
<%--                    </div>--%>
<%--                </c:when>--%>
<%--            </c:choose>--%>
<%--        </c:when>--%>
<%--    </c:choose>--%>
<%--</c:forEach>--%>
<br>
<div class="container" style="margin-top: 5%">
    <div id="comment-write" class="input-group mb-3 form-floating">
        <input type="text" id="commentWriter" class="form-control" value="${sessionScope.memberId.memberId}" readonly>
        <label for="commentWriter">작성자</label>
        <input type="text" id="commentContents" class="form-control" placeholder="내용">
        <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
    </div>

    <div id="comment-list">
        <table class="table">
            <tr>
                <th>댓글번호</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성시간</th>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.commentWriter}</td>
                    <td id="contents${comment.id}">${comment.commentContents}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentDate}"></fmt:formatDate></td>
                    <c:choose>
                        <c:when test="${sessionScope.memberId.memberId == comment.commentWriter && sessionScope.memberId.memberId != 'admin'}">
                            <td><a href="/comment/delete?id=${comment.id}&productId=${product.id}">삭제</a></td>
                        </c:when>
                        <c:otherwise>
                            <td></td>
                            <td></td>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${sessionScope.memberId.memberId == 'admin'}">
                            <td><a href="/comment/delete?id=${comment.id}&productId=${product.id}">삭제</a></td>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${sessionScope.memberId.memberId == comment.commentWriter}">
                            <td id="updateBTN${comment.id}"><a href="javascript:void(0)" onclick="aaa3(${comment.id})">수정</a></td>
                            <td></td>
                        </c:when>
                        <c:when test="${sessionScope.memberId.memberId == 'admin'}">
                            <td></td>
                            <td></td>
                        </c:when>
                    </c:choose>
                        <td><a href="javascript:void(0)" onclick="hitsCheck(${comment.id})"><span id="aa">좋아요${comment.commentHits}</span></a></td>
<%--                    <td><a href="javascript:void(0)" onclick="hitsCheck2(${comment.id})">엄청 좋아요${comment.commentHits}</a></td>--%>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
<script>
    $("#comment-write-btn").click(function () {
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = $("#commentContents").val();
        const productId = '${product.id}';
        const memberId = '${sessionScope.member}';
        const member = '${sessionScope.memberId.memberId}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {"commentWriter":commentWriter,"commentContents":commentContents,"productId":productId,"memberId":memberId},
            dataType: "json",
            success: function(result){
                const a = "삭제";
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td id='contents'" + result[i].id + ">" + result[i].commentContents+"</td>";
                    output += "<td>"+moment(result[i].commentDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    if(member == result[i].commentWriter){
                        output += "<td>" + "<a href='/comment/delete?productId=" + productId + "&id=" + result[i].id + "'>" + a + "</a>"+"</td>";
                        output += "<td>" + "<a href='javascript:aaa3();'>" + "수정" + "</a>"+"</td>";
                    }else if(member == 'admin'){
                        output += "<td>" + "<a href='/comment/delete?productId=" + productId + "&id=" + result[i].id + "'>" + a + "</a>"+"</td>";
                        output += "<td></td>";
                    }else{
                        output += "<td></td>";
                        output += "<td></td>";
                    }
                    output += "<td>" + "<a href='javascript:void(0)' onclick='hitsCheck(" + result[i].id + ")'>" + "<span id='aa'>" + "좋아요" + result[i].commentHits + "</span>" + "</a>" + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value='';
            },
            error: function () {
                alert("틀림");
            }
        });
    })
    const aaa3 = (id) => {
        const commentContents = document.getElementById("contents" + id).innerHTML;
        console.log(commentContents);
        const inputContents = document.getElementById("contents" + id);
        inputContents.innerHTML = "<input id='updateContents' type='text' name='commentContents' value='" + commentContents + "'>";
        const updateForm = document.getElementById("updateBTN" + id);
        updateForm.innerHTML = "<a href='javascript:void(0)' onclick='updateComment(" + id + ")'> 수정한다 </a>";
        const productId = '${product.id}';
        // $.ajax({
        //     type: "post",
        //     url: "/comment/update",
        //     data: {"commentWriter":commentWriter,"commentContents":commentContents,"productId":productId,"memberId":memberId},
        //     dataType: "json",
        //     success: function(result){
        //         const a = "삭제";
        //         let output = "<table class='table'>";
        //         output += "<tr><th>댓글번호</th>";
        //         output += "<th>작성자</th>";
        //         output += "<th>내용</th>";
        //         output += "<th>작성시간</th></tr>";
        //         for(let i in result){
        //             output += "<tr>";
        //             output += "<td>"+result[i].id+"</td>";
        //             output += "<td>"+result[i].commentWriter+"</td>";
        //             output += "<td>"+moment(result[i].commentDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
        //             output += "<td>" + "<a href='/comment/delete?productId=" + productId + "&id=" + result[i].id + "'>" + a + "</a>"+"</td>";
        //             output += "<td>" + "<input type='text' name='" + commentContents + "'" + "value='" + result[i].commentContents + "'>" + "<a href='javascript:aaa3();'>" + "수정" + "</a>" + "</td>";
        //             output += "</tr>";
        //         }
        //         output += "</table>";
        //         document.getElementById('comment-list').innerHTML = output;
        //         document.getElementById('commentContents').value='';
        //     },
        //     error: function () {
        //         alert("틀림");
        //     }
        // });
    }
    const updateComment = (id) => {
        const updateCommentContents = document.getElementById("updateContents").value;
        console.log(updateCommentContents);
        const productId = '${product.id}';
        $.ajax({
            url: '/comment/update?id=' + id,
            type: 'post',
            data: {"id": id,
                "commentContents": updateCommentContents,
                "productId": productId},
            success: function () {
                location.href = '/product/detail?id=' + productId;
            },
            err: function () {
                alert('에러');
            }
        });
    }
</script>
<script>
    const hitsCheck = (id2) => {
        const memberId = '${sessionScope.member}';
        const productId = '${product.id}';
        const aa = document.getElementById("aa");
        $.ajax({
            type: "post",
            url: "/comment/check",
            data: {"memberId":memberId, "commentId": id2},
            dataType: "text",
            success: function (data) {
                if(memberId == ""){
                    alert("로그인 후 좋아요 가능해");
                } else if(data == "ok") {
                    location.href='/comment/hits?memberId=' + memberId + "&commentId=" + id2 + "&id=" + id2 + "&productId=" + productId;
                }else {
                    // alert("dd")
                    location.href='/comment/hits2?memberId=' + memberId + "&productId=" + productId + "&commentId=" + id2;
                }
            }
        });
    }
</script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    const aa = () => {
        const myQuantity = document.getElementById("myQuantity");
        const myQuantity2 = '${product.productQuantity}' - myQuantity.value;
        const productPrice = '${product.productPrice}';
        if(myQuantity.value == 0){
            alert("0개는 못산다")
        }else if(myQuantity2 < 0) {
                alert("재고 없어 줄여");
        }else {
            var IMP = window.IMP;
            IMP.init('imp20919452');
            IMP.request_pay({
                pg : "kakaopay",
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '결제',
                amount : productPrice * myQuantity.value,
                buyer_email : '${sessionScope.memberId.memberEmail}',
                buyer_name : '${sessionScope.memberId.memberName}',
                buyer_tel : '${sessionScope.memberId.memberMobile}',
                buyer_addr : '${sessionScope.memberId.memberLocal}',
                buyer_postcode : '${sessionScope.memberId.memberLocal2}',
            }, function(rsp) {
                if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.';
                    location.href="/buy/buy2?memberId=" + ${sessionScope.member} + "&productQuantity=" + myQuantity2 + "&productId=" + ${product.id} + "&id=" + ${product.id} + "&myQuantity=" + myQuantity.value;
                } else {
                    var msg = '결제에 실패하였습니다.';
                }
            });
        }
    }
</script>
<script>
    const a123 = (id) => {
        const member = '${sessionScope.member}';
        $.ajax({
            type: "post",
            url: "/myPage/check",
            data: {"productId": id, "memberId":member},
            dataType: "text",
            success: function (data) {
                if(data == "ok") {
                    location.href="/myPage/save?memberId=" + member + "&productId=" + id;
                }else {
                    alert("장바구니에 이미 있어")
                }
            },
            error: function (){
                alert("에러")
            }
        });
    }
</script>
<%--<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>--%>
<%--<script>--%>
<%--    const aa = () => {--%>
<%--        const myQuantity = document.getElementById("myQuantity");--%>
<%--        const myQuantity2 = '${product.productQuantity}';--%>
<%--        const productPrice = '${product.productPrice}';--%>
<%--        if(myQuantity.value == 0){--%>
<%--            alert("0못삼")--%>
<%--        }else if(myQuantity2 < myQuantity.value) {--%>
<%--            alert("재고 없어 줄여주세요");--%>
<%--        }else {--%>
<%--            var IMP = window.IMP;--%>
<%--            IMP.init('imp20919452');--%>
<%--            IMP.request_pay({--%>
<%--                pg : "kakaopay",--%>
<%--                pay_method : 'card',--%>
<%--                merchant_uid : 'merchant_' + new Date().getTime(),--%>
<%--                name : '결제',--%>
<%--                amount : productPrice * myQuantity.value,--%>
<%--                buyer_email : '${sessionScope.memberId.memberEmail}',--%>
<%--                buyer_name : '${sessionScope.memberId.memberName}',--%>
<%--                buyer_tel : '${sessionScope.memberId.memberMobile}',--%>
<%--                buyer_addr : '${sessionScope.memberId.memberLocal}',--%>
<%--                buyer_postcode : '${sessionScope.memberId.memberLocal2}',--%>
<%--            }, function(rsp) {--%>
<%--                if ( rsp.success ) {--%>
<%--                    var msg = '결제가 완료되었습니다.';--%>
<%--                    location.href="/buy/buy2?memberId=" + ${sessionScope.member} + "&productQuantity=" + myQuantity2 + "&productId=" + ${product.id} + "&id=" + ${product.id} + "&myQuantity=" + myQuantity.value;--%>
<%--                } else {--%>
<%--                    var msg = '결제에 실패하였습니다.';--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>














<%--<script>--%>
<%--    const hitsCheck2 = (id) => {--%>
<%--        const memberId = '${sessionScope.member}';--%>
<%--        const productId = '${product.id}';--%>
<%--        $.ajax({--%>
<%--            type: "post",--%>
<%--            url: "/comment/check",--%>
<%--            data: {"memberId":memberId, "commentId": id},--%>
<%--            dataType: "text",--%>
<%--            success: function () {--%>
<%--                location.href='/comment/hits?memberId=' + memberId + "&commentId=" + id + "&id=" + id + "&productId=" + productId;--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
</html>