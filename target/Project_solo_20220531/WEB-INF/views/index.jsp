<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 4:23
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
        .main-container {
            width: 72%;
            /*height: 400px;*/
            /*border: 1px solid gray;*/
            padding: 10px 30px;
            margin-left: 14%;
        }
        .span-container {
            padding-bottom: 50px;
        }
        .file-container {
            margin-left: 6%;
            margin-bottom: 5%;
        }
        .ul-container li {
            display: block;
            float: left;
            overflow: hidden;
            position: relative;
        }
        .ul-container li figure {
            position: relative;
            margin-left: 100px;
            margin-bottom: 80px;
        }
        .ul-container li figure img {
            display: block;
        }
        .cart {
            display: block;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<a href="/member/save">회원가입</a>
<a href="/product/findAll">상품 리스트</a>
<a href="/product/saveFile">상품 등록</a>
<%--    <a href="/product/detail?id=7">상품 테스트</a>--%>
${sessionScope.memberId.id}
${sessionScope.memberId.memberId}
<%--    <div class="main-container">--%>
<%--        &lt;%&ndash;        <img src="${pageContext.request.contextPath}/upload/${product.productProfile}" alt="" height="100" width="100">&ndash;%&gt;--%>
<%--        &lt;%&ndash;        ${product.productName}&ndash;%&gt;--%>
<%--            <c:forEach var="p" items="${product}">--%>
<%--                    <img src="${pageContext.request.contextPath}/upload/${p.productProfile}" alt="" height="200" width="200" class="file-container">--%>
<%--                        <a>${p.productName}</a>--%>
<%--                        --%>
<%--            </c:forEach>--%>
<%--    </div>--%>


<%--<div class="tab-content">--%>
<%--    <div class="tab-pane fade in active" id="popular">--%>

<%--        <ul class="aa-product-catg aa-popular-slider">--%>
<%--            <c:forEach items="${product}" var="p">--%>
<%--            <li>--%>
<%--                <figure>--%>
<%--                    <a class="aa-product-img" href="#"><img src="${pageContext.request.contextPath}/upload/${p.productProfile}" alt="신상품 이미지" width="200" height="200"></a>--%>
<%--                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>장바구니에 담기</a>--%>
<%--                    <figcaption>--%>
<%--                        <h4 class="aa-product-title"><a href="#">${p.productName}</a></h4>--%>
<%--                        <span class="aa-product-price"><fmt:formatNumber pattern="#,### 원" value="${p.productPrice}"/></span>--%>
<%--                    </figcaption>--%>
<%--                </figure>--%>
<%--            </li>--%>
<%--            </c:forEach>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>


<div class="main-container">
    <ul class="ul-container">
        <c:forEach items="${product}" var="p">
            <li>
                <figure>
                    <a href="/product/detail?id=${p.id}"><img src="${pageContext.request.contextPath}/upload/${p.productProfile}" alt="신상품 이미지" width="200" height="200"></a>
                    <figcaption>
                        <h4><a href="/product/detail?id=${p.id}">${p.productName}</a></h4>
                        <a href="/product/detail?id=${p.id}"><span>${p.productPrice}원</span></a>
                        <c:choose>
                            <c:when test="${sessionScope.member != null}">
                                <a href="/myPage/save?memberId=${sessionScope.member}&productId=${p.id}" class="cart"><span>장바구니</span></a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${sessionScope.memberId.memberId == 'admin'}">
                                <a href="/product/delete?id=${p.id}">상품 삭제</a>
                            </c:when>
                        </c:choose>
                    </figcaption>
                </figure>
            </li>
        </c:forEach>
    </ul>
</div>


<%--<br />--%>
<%--    <c:forEach var="i" items="${product}" begin="0" end="3" step="1">--%>
<%--        <img src="${pageContext.request.contextPath}/upload/${i.productProfile}" alt="" height="200" width="200" class="file-container">--%>
<%--    </c:forEach>--%>
<%--<br />--%>
<%--<div class="container234">--%>
<%--    <c:forEach var="i" items="${product}" begin="0" end="3" step="1">--%>
<%--        <a class="text234">${i.productName}</a>--%>
<%--    </c:forEach>--%>
<%--</div>--%>
<%--<br />--%>
<%--    <c:forEach var="i" items="${product}" begin="4" end="7" step="1">--%>
<%--        <img src="${pageContext.request.contextPath}/upload/${i.productProfile}" alt="" height="200" width="200" class="file-container">--%>
<%--    </c:forEach>--%>
<%--<div class="container234">--%>
<%--    <c:forEach var="i" items="${product}" begin="4" end="7" step="1">--%>
<%--        <a class="text234">${i.productName}</a>--%>
<%--    </c:forEach>--%>
<%--</div>--%>

<%--<div class="container">--%>
<%--    <table class="table">--%>
<%--        <tr>--%>
<%--            <th>글번호</th>--%>
<%--            <th>작성자</th>--%>
<%--            <th>제목</th>--%>
<%--            <th>작성시간</th>--%>
<%--            <th>조회수</th>--%>
<%--        </tr>--%>
<%--        <c:forEach items="${memberList}" var="member">--%>
<%--            <tr>--%>
<%--                <td>${member.id}</td>--%>
<%--                <td>${member.memberId}</td>--%>
<%--                <td>${member.memberName}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
<%--<div class="container">--%>
<%--    <ul class="pagination justify-content-center">--%>
<%--        <c:choose> &lt;%&ndash; if/else 역할 &ndash;%&gt;--%>
<%--            &lt;%&ndash; 현재 페이지가 1페이지면 이전 글자만 보여줌 &ndash;%&gt;--%>
<%--            <c:when test="${paging.page<=1}">--%>
<%--                <li class="page-item disabled">--%>
<%--                    <a class="page-link">[이전]</a>--%>
<%--                </li>--%>
<%--            </c:when>--%>
<%--            &lt;%&ndash; 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 &ndash;%&gt;--%>
<%--            <c:otherwise>--%>
<%--                <li class="page-item">--%>
<%--                    <a class="page-link" href="/member/paging?page=${paging.page-1}">[이전]</a>--%>
<%--                </li>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1"> &lt;%&ndash; 일반 for문처럼 사용가능 &ndash;%&gt;--%>
<%--            <c:choose>--%>
<%--                &lt;%&ndash; 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 &ndash;%&gt;--%>
<%--                <c:when test="${i eq paging.page}">--%>
<%--                    <li class="page-item active">--%>
<%--                        <a class="page-link">${i}</a>--%>
<%--                    </li>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <li class="page-item">--%>
<%--                        <a class="page-link" href="/member/paging?page=${i}">${i}</a>--%>
<%--                    </li>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </c:forEach>--%>
<%--        <c:choose>--%>
<%--            <c:when test="${paging.page>=paging.maxPage}">--%>
<%--                <li class="page-item disabled">--%>
<%--                    <a class="page-link">[다음]</a>--%>
<%--                </li>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <li class="page-item">--%>
<%--                    <a class="page-link" href="/member/paging?page=${paging.page+1}">[다음]</a>--%>
<%--                </li>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </ul>--%>
<%--</div>--%>
</body>


<%--<script>--%>
<%--    const idCheck = () => {--%>
<%--        const productId = document.getElementById("productId").value;--%>
<%--        $.ajax({--%>
<%--            type: "post",--%>
<%--            url: "/myPage/check",--%>
<%--            data: {"productId": productId},--%>
<%--            dataType: "text",--%>
<%--            success: function (data) {--%>
<%--                if(data == "ok") {--%>
<%--                    location.href="/myPage/save?memberId=${sessionScope.member}&productId=${product.id}"--%>
<%--                }else {--%>
<%--                    alert("장바구니에 이미 있어")--%>
<%--                }--%>
<%--            },--%>
<%--            error: function (){--%>
<%--                alert("에러")--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
</html>