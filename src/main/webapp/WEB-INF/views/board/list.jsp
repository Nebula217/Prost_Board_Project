<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/Board_List.css"
	rel="stylesheet" type="text/css">
<title>게시판</title>

<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}

a {
	color: #ff601c;
}
</style>

</head>

<body>
	<div id="root">
		<%@include file="../include/header.jsp"%>


		<section class="container">
			<div>
				<form role="form" method="post" action="write">
					<h1 style="color: #ff601c;">자유게시판</h1>
					<table>
						<tr>
							<th style="width: 70px;" class="bno">번호</th>
							<th style="width: 550px;" class="title">제목</th>
							<th style="width: 130px;" class="writer">작성자</th>
							<th style="width: 100px;" class="date">등록일</th>
						</tr>

						<c:forEach items="${list}" var="item">
							<tr style="background-color: #fffcf5;">
								<td class="bno"><c:out value="${item.bno}" /></td>
								<td><a style="text-decoration: none;"
									href="readView?bno=${item.bno}"> <c:forEach begin="1"
											end="${item.depth}" varStatus="loop">
            &#8199;&#8199; <!-- 공백 문자 -->
										</c:forEach> <c:if test="${item.depth > 0}">
            └[답글]
          </c:if> <c:out value="${item.title}" />
								</a></td>
								<td><c:out value="${item.writer}" /></td>
								<td><fmt:formatDate value="${item.regdate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</table>


					<div style="text-align: center; margin-right:10px;">
						<ul style="display: inline-block;">
							<c:if test="${pageMaker.prev}">
								<li><a style="color: #ff601c; font-size: medium;"
									href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a style="color: #ff601c; font-size: medium;" href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a style="color: #ff601c; font-size: medium;"
									href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>


				</form>
				<table>
					<tr>
						<td style="background-color: #ffffff00;" colspan="4"
							class="last-row">
							<div class="search-bar">
								<input type="text" placeholder="검색어를 입력하세요">
								<button class="search-button" title="미구현">검색</button>
							</div>
							<div class="action-buttons">
								<a href="list"><button class="list-button">목록</button></a> <a
									href="writeView"><button href="writeView"
										class="write-button">글작성</button></a>
							</div>
						</td>
					</tr>
				</table>
		</section>
	</div>
	<footer> </footer>
</body>