<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오후 3:11
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
</head>
<body>
<jsp:include page="../../layout/header.jsp" flush="false"></jsp:include>
<c:forEach items="${myPage}" var="my">
<c:forEach items="${product}" var="p">
    <c:choose>
        <c:when test="${my.productId == p.id && my.memberId == sessionScope.member}">
            <a href="#"><img src="${pageContext.request.contextPath}/upload/${p.productProfile}" alt="신상품 이미지" width="200" height="200"></a>
            상품 이름<span>${p.productName}</span>
            상품 가격<span>${p.productPrice}</span>
            상품 설명<span>${p.productContents}</span>
            상품 재고<span>${p.productQuantity}</span>
            구매 수량<input type="text" value="${my.myQuantity}" id="myQuantity${p.id}" name="myQuantity">
            <a href="/myPage/delete?id=${my.id}">관심없어짐</a>
            <a href="javascript:void(0)" onclick="aa(${p.productPrice},${p.productQuantity},${my.id},${p.id},'myQuantity'.value)" class="cart"><span>구매</span></a>
        </c:when>
    </c:choose>
</c:forEach>
</c:forEach>
</body>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    const aa = (productPrice, productQuantity,my, productId) => {
        const myQuantity = document.getElementById("myQuantity" + productId);
        const myQuantity2 = productQuantity - myQuantity.value;
        const qq = productPrice * myQuantity.value;
        console.log(myQuantity);
        if(myQuantity.value == 0){
            alert("0개는 못산다")
        } else if(myQuantity2 < 0){
            alert("재고 없어 줄여");
        }else {
            var IMP = window.IMP;
            IMP.init('imp20919452');
            IMP.request_pay({
                pg : "kakaopay",
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '결제',
                amount : qq,
                buyer_email : '${sessionScope.memberId.memberEmail}',
                buyer_name : '${sessionScope.memberId.memberName}',
                buyer_tel : '${sessionScope.memberId.memberMobile}',
                buyer_addr : '${sessionScope.memberId.memberLocal}',
                buyer_postcode : '${sessionScope.memberId.memberLocal2}',
            }, function(rsp) {
                if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.';
                    location.href="/buy/buy?myPageId=" + my + "&productQuantity=" + myQuantity2 + "&myQuantity=" + myQuantity.value + "&memberId=" + ${sessionScope.member} + "&productId=" + productId + "&id=" + productId;
                } else {
                    console.log("실패")
                    var msg = '결제에 실패하였습니다.';

                }
            });
        }
    }
</script>
</html>
