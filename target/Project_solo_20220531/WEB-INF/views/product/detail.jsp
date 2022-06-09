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
</head>
<body>
    <jsp:include page="../../layout/header.jsp" flush="false"></jsp:include>
    <a href="/product/detail?id=${product.id}"><img src="${pageContext.request.contextPath}/upload/${product.productProfile}" alt="신상품 이미지" width="200" height="200"></a><br>
    <c:forEach items="${image}" var="image">
            <c:choose>
                <c:when test="${image.productId == product.id}">
                    <a href="/product/detail?id=${product.id}"><img src="${pageContext.request.contextPath}/upload/${image.image}" alt="신상품 이미지" width="200" height="200"></a>
                    <a href="/image/delete?id=${image.id}&productId=${product.id}">삭제</a>
                </c:when>
            </c:choose>
    </c:forEach>
    <br>
    <div class="container">
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
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.id}</td>
                        <td>${comment.commentWriter}</td>
                        <td>${comment.commentContents}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentDate}"></fmt:formatDate></td>
                        <td><a href="/comment/delete?id=${comment.id}&productId=${product.id}">삭제</a></td>
                        <td><a href="javascript:aaa3()?id=${comment.id};">수정</a></td>
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
                    output += "<td>"+result[i].commentContents+"</td>";
                    output += "<td>"+moment(result[i].commentDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "<td>" + "<a href='javascript:aaa3();'>" + "수정" + "</a>"+"</td>";
                    output += "<td>" + "<a href='/comment/update?productId=" + productId + "&id=" + result[i].id + "'>" + a + "</a>"+"</td>";
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
      const aaa3 = () => {
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = $("#commentContents").val();
        const productId = '${product.id}';
        const memberId = '${sessionScope.member}';
        $.ajax({
            type: "post",
            url: "/comment/update",
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
                    output += "<td>"+moment(result[i].commentDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "<td>" + "<a href='/comment/delete?productId=" + productId + "&id=" + result[i].id + "'>" + a + "</a>"+"</td>";
                    output += "<td>" + "<input type='text' value='" + result[id].commentContents + "'>" + "<input type='submit'>" + "</td>";
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
    }
</script>
</html>
