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



</head>

<body>
	<div id="root">
		<%@include file="../include/header.jsp"%>
		<hr />
		<div>
			<%@include file="../include/nav.jsp"%>
		</div>
		<hr />

		<section class="container">
			<div>
				<form role="form" method="post" action="write">
<table>
  <tr>
    <th class="bno">번호</th>
    <th class="title">제목</th>
    <th class="writer">작성자</th>
    <th class="date">등록일</th>
  </tr>

  <c:forEach items="${list}" var="item">
    <tr>
      <td class="bno"><c:out value="${item.bno}" /></td>
      <td>
        <a href="readView?bno=${item.bno}">
          <c:forEach begin="1" end="${item.depth}" varStatus="loop">
            &#8199;&#8199; <!-- 공백 문자 -->
          </c:forEach>
          <c:if test="${item.depth > 0}">
            └[답글]
          </c:if>
          <c:out value="${item.title}" />
        </a>
      </td>
      <td><c:out value="${item.writer}" /></td>
      <td><fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd" /></td>
    </tr>
  </c:forEach>
</table>
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