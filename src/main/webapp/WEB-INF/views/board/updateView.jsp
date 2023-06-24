<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	<link href="${pageContext.request.contextPath}/resources/css/Board_List.css"rel="stylesheet" type="text/css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	 	<style>
input{
border:0px;
border-radius:5px;
}
textarea:focus {
  outline: none;
}
input:focus {
  outline: none;
}
textarea{
border:0px;
border-radius:5px;
background-color: #fff9ea;
}
</style>
	</head>
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "list";
		})
		
		$(".update_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "update");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
		
	function fn_valiChk(){
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i = 0; i<updateForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	
		
	</script>
	<body>
	
		<div id="root">
			<%@include file="../include/header.jsp" %>
	
			
			<section class="container">
				<form name="updateForm" role="form" method="post" action="update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<h1 style="color: #ff601c;">수정하기</h1>
					<table>
						<tbody>
							<tr>
								<th>
									<label for="title">제목 : </label><input  style="width:600px;" class="writeInput" type="text" id="title" name="title" value="${update.title}"/>
								</th>
							</tr>	
							<tr class="yel">
							<td>
									<label for="writer">작성자 : </label><input type="text" id="writer" class="readInputOther" name="writer" value="${update.writer}" readonly="readonly"/>
								</td>
								</tr>
							<tr style="background-color: #fffcf5;">
								<td>
									<label for="content">내용</label><textarea style="height:400px; margin-top:20px; background-color: #ffffff;" class="writeInputContent" id="content" name="content"><c:out value="${update.content}" /></textarea>
								</td>
							</tr>
							<tr>
								
							</tr>
							<tr class="yel">
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
					<button style="float:right;" type="submit" class="cancel_btn">취소</button>
						<button style="float:right;" type="submit" class="update_btn">저장</button>
						
					</div>
				</form>
			</section>
	
		</div>
		  <footer>
    </footer>
	</body>
</html>