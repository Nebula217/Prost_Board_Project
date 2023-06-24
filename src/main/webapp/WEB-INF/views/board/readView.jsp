<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	<link href="${pageContext.request.contextPath}/resources/css/Board_List.css"rel="stylesheet" type="text/css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제 하시겠습니까?");
				if(deleteYN == true){
				formObj.attr("action", "delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			})
			
			
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "list";
			})
		})
	</script>
	
	<body>
	
		<div id="root">
			<%@include file="../include/header.jsp" %>
			<hr />
			 
				<div>
			<%@include file="../include/nav.jsp" %>
			</div>
			<hr />
			
			<section class="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				</form>
				<div>
				<table>
					
					<tbody>
                        <tr><th><label for="title"></label><input class="readInput" type="text" id="title" name="title" value="${read.title}" readonly="readonly" /></th></tr>
						<tr>
							<td>
                                <label for="writer"></label><input type="text" class="readInputOther" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
							</td>
                        
						</tr>	
						<tr>
							<td>
								<label for="content"></label><textarea class="readInputContent" id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
							</td>
						</tr>
						<tr>
							<td>
								  <label for="regdate"></label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />	
							</td>
						</tr>
						<tr>
							<td >
											
							</td>
						</tr>		
					</tbody>						
				</table>
				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>	
				</div>
				</div>
			</section>
			
		</div>
		  <footer>
    </footer>
	</body>
</html>