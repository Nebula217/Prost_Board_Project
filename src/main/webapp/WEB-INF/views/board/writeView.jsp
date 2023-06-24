<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/Board_List.css"rel="stylesheet" type="text/css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>게시판</title>
	<style>
input{
border:0px;
border-radius:5px;
}
input:focus {
  outline: none;
}
textarea:focus {
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
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
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
				<form name="writeform" role="form" method="post" action="write">
					<h1 style="color: #ff601c;">글 쓰기</h1>
					<table>
						<tbody>
							<tr>
								<th>
									<label for="title">제목  : </label><input style="margin-left:20px;width:600px;" class="writeInputOther" type="text" id="title" name="title" class="chk" title="제목을 입력하세요" />
								</th>
							</tr>	
							<tr class="yel">
							<td>
							<label for="writer">작성자 : </label><input style="width:300px;" class="writeInputOther" type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요" />
							</td>
							</tr>
							<tr style="background-color: #fffcf5;">
								<td>
									<label for="content">내용 : </label><textarea style="height:400px; margin-top:15px; background-color: #ffffff;" class="writeInputContent" id="content" name="content" class="chk" title="내용을 입력하세요" ></textarea>
								</td>
							</tr>
							<tr>
						
							<tr>
								<td>				
									
									
								</td>
							</tr>			
						</tbody>			
					</table>
					<a style="float:right;" href="list"><button type="button" class="list-button">취소</button></a>
										
									<button style="float:right;" class="update_btn" type="submit">작성</button>
				</form>
			</section>
			
		</div>
		  <footer>
    </footer>
	</body>
</html>
