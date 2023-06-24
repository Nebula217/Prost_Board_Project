<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link
	href="${pageContext.request.contextPath}/resources/css/Board_List.css"
	rel="stylesheet" type="text/css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
<style>
input{
border:0px;
border-radius:5px;
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
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "updateView");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			var deleteYN = confirm("삭제 하시겠습니까?");
			if (deleteYN == true) {
				formObj.attr("action", "delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		})

		// 취소
		$(".list_btn").on("click", function() {

			location.href = "list";
		})
	})
	
	
	
</script>
<!-- 숨겨진 답변 창 나오도록 -->
<script type="text/javascript">
  var bDisplay = true;
  function doDisplay() {
    var con = document.getElementById("myDIV");
    if (con.style.display == 'none') {
      con.style.display = 'block';
      // 해당 요소로 스크롤하면서 부드럽게 이동
      con.scrollIntoView({ behavior: 'smooth' });
    } else {
      con.style.display = 'none';
    }
  }
</script>
<body>

	<div id="root">
		<%@include file="../include/header.jsp"%>


		<section class="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" />
			</form>
			<div>
			<h1 style="color: #ff601c;">게시글 열람</h1>
				<table>

					<tbody>
						<tr>
							<th><label for="title">제목 : </label><input style="width:600px; color: #ffffff;" class="readInput"
								type="text" id="title" name="title" value="${read.title}"
								readonly="readonly" /></th>
						</tr>
						<tr class="yel">
							<td><label for="writer">작성자 : </label><input style="width:300px;" type="text"
								class="readInputOther" id="writer" name="writer"
								value="${read.writer}" readonly="readonly" /></td>

						</tr>
						<tr style="background-color: #fffcf5;">
							<td><label for="content"></label>
							<textarea  style="height:400px; border:0px;" class="readInputContent" id="content" name="content"
									readonly="readonly"><c:out value="${read.content}" /></textarea>
							</td>
						</tr>
						<tr class="yel">
							<td><label for="regdate">작성일자 : </label> <fmt:formatDate
									value="${read.regdate}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div>
				
		<table>
					<tr>
						<td style="background-color: #ffffff00;" colspan="4"
							class="last-row">
							<button style="float:right; type="submit" class="delete_btn">삭제</button>
							
					
					<a href="javascript:doDisplay();" style="text-decoration: none;">
					<button style="float:right; type="submit"
							class="answer_btn">답변</button> </a>
							<button style="float:right; type="submit" class="update_btn">수정</button>
					<button style="float:right; type="submit" class="list_btn">목록</button>
						</td>
					</tr>
				</table>
				</div>
		
				<!-- 숨겨 놓은 답변 창 -->
				<div id="myDIV" style="display:none; margin-top:80px; padding-top:70px; margin-bottom:300px;">
					<form name="answerform" role="form" method="post" action="answer">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<h1 id="answerH1" style="color: #ff601c;">답변하기</h1>
					<table>
						<tbody>
							<tr>
								<th>
									<label for="title">제목  : </label><input style="width:600px; margin-left:15px;" class="writeInputOther"  type="text" id="title" name="title" class="chk" title="제목을 입력하세요" />
								</th>
							</tr>	
							<tr class="yel">
							<td>
							<label for="writer">작성자 : </label><input style="width:300px;" class="writeInputOther" type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요" />
							</td>
							</tr>
							<tr style="background-color: #fffcf5;">
								<td>
									<label for="content">내용 : </label><textarea style="margin-top:10px; height:400px; background-color: #ffffff;" class="writeInputContent" id="content" name="content" class="chk" title="내용을 입력하세요" ></textarea>
								</td>
							</tr>
							<tr>
						
							<tr>
								<td>		
											
									<button style="float:right;"" class="update_btn" type="submit">작성</button>
									
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			
				</div>
			</div>
	</div>
	</section>
	</div>
	<footer> </footer>
</body>
</html>