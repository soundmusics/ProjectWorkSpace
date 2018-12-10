<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<title>Document</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(function(){
			$("#wbtn").click(function(){
				//페이지 주소변경(이동)
				location.href = "${path}/notice/noticeWrite.sm"
			});
		});
	</script>
	</head>
<body>
<h1>게시글 목록</h1>
<script>
		$(function(){
			$("#sBtn").click(function(){
				//무결성검사하고..
				if(word==null||word.length()==0){
					alert('제목을 작성하시오.')
				}
				//넘기기
				//"#sForm"
				$("#sForm").submit();
			})
			//글쓰기 버튼
			$("#wBtn").click(function(){
				//글쓰기(폼보여줘)요청
				$(location).attr("href","../fileBoard/writeForm.sun");
				
				//(글쓰기, 수정하기,삭제하기등등..)
				//로그인한 user만 글쓰기를 할 수 있도록 하겠다.
				//인터셉터를 이용하여 자동으로 로그인 기능으로 유도하고자 한다.
				
				
			})
			$("#hBtn").click(function(){
				$(location).attr("href","../index.html");
			})
		})
	</script>
	</head>
<body>
  <h1> 여기에 내가 boardList를 뿌릴 것이다. 언젠가는</h1>
  <%-- 검색기능 --%>
  <form id="sForm" method="post" action="">
  	<table border="1"width="700"align="center">
  		<tr>
  			<td align="center">
  			<%-- 검색 대상 --%>
  			<select name="target" id="target">
  				<option value="title">제목</option>
  				<option value="body">내용</option>
  				<option value="writer">작성자</option>
  				<option value="both">제목+내용</option>
  			</select>
  			<!-- 검색 단어 -->
  			<input type="text" name="word" id="word"/>
  			<!-- 검색 버튼 -->
  			<input type="button" id="sBtn" value="search"/>
  			</td>
  		</tr>
  	</table>
  </form>
  <%-- 게시판 목록보기 --%>
  <table border="1"width="700"align="center">
  	<thead>
  		<tr>
  			<th>번호</th>
  			<th>제목</th>
  			<th>작성자</th>
  			<th>작성일</th>
  			<th>조회수</th>
  			<th>첨부파일</th>
  		</tr>
  	</thead>
  	<tbody>
  		<tr>
  			<td>-</td>
  			<td>-</td>
  			<td>-</td>
  			<td>-</td>
  			<td>-</td>
  			<td>-</td>
  		</tr>
  	</tbody>
  </table>
  <%-- 페이지 이동기능 --%>
  <%-- 글쓰기 (기타기능)--%>
  <form id="wForm" method="get" action="">
		<table border="1" width="700" align="center">
			<tr>
				<td align="center">
					<input type="button" id="wBtn" value="글쓰기" />
					<input type="button" name="hBtn" id="hBtn" value="홈으로"/>
				</td>
			</tr>
		</table>
	</form>

<input type ="button" id="wbtn" value="글쓰기"/>  
</body>
</html>