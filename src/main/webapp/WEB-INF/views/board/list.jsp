<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	<link href="${pageContext.request.contextPath}/resources/css/Board_List.css"rel="stylesheet" type="text/css">
	 	<title>게시판</title>
	</head>
	<body>
		<div id="root">
	<%@include file="../include/header.jsp" %>
			<hr />
			<div>
			<%@include file="../include/nav.jsp" %>
			</div>
			<hr />
			
			<section class="container">
				<form role="form" method="post" action="write">
					<table>
						 <tr>
                            <th class="bno">번호</th>
                            <th class="title">제목</th>
                            <th class="writer">작성자</th>
                            <th class="date">등록일</th>
                        </tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="readView?bno=${list.bno}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						                      </c:forEach>
                    </table>
                </form>
           
        </section>
    </div>
    <footer>
    </footer>
</body>