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
			$("#sBtn").click(function(){
				//무결성검사하고..				
				//넘기기
				//"#sForm"
				$("#sForm").submit();
			})
			//글쓰기 버튼
			$("#wBtn").click(function(){
				//글쓰기(폼보여줘)요청
				$(location).attr("href","../freeBoard/writeForm.sm");
				
				//(글쓰기, 수정하기,삭제하기등등..)
				//로그인한 user만 글쓰기를 할 수 있도록 하겠다.
				//인터셉터를 이용하여 자동으로 로그인 기능으로 유도하고자 한다.
				
				
			})
			$("#hBtn").click(function(){
				$(location).attr("href","../index.sm");
			})
		})
		function getView(oriNo,nowPage){
			$('#oriNo').val(oriNo);
			$('#nowPage').val(nowPage);
			$('#a').submit();
		}
	</script>
	</head>
<body>
<form id="a" method="POST" action="../freeBoard/boardView.sm">
	<input type="hidden" id="oriNo" name="oriNo" />
	<input type="hidden" id="nowPage" name="nowPage" />
</form>
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
  <%-- 게시판 목록보기 
  req.setAttribute("LIST", list);--%>
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
  		<c:forEach var="data" items="${LIST}">
  			<tr>
  				<td>${data.no}</td>
  				<%-- <td>
  					조회수 증가<a href="../freeBoard/hitProc.sm?oriNo=${data.no}&nowPage=${PINFO.nowPage}">${data.title}</a>
  				</td> --%>
  				<td>
  					<a class="list" href="javascript:void(0);" onclick="javascript:getView('${data.no}','${PINFO.nowPage}')">
  					${data.title}</a>
  				</td>
  				<td>${data.id}</td>
  				<td>${data.wday}</td>
  				<td>${data.hit}</td>
  				<td>${data.filecount}</td>
  			</tr>
  		</c:forEach>
  	</tbody>
  </table>
  <%-- 페이지 이동기능 
  req.setAttribute("PINFO", pInfo);		--%>
  <table border="1"width="700"align="center">
  	<tr>
  		<td align="center">
  			<!-- [<][1][2][3][4][5][>] -->
  			<%--이전페이지 [<] --%>
  			<c:if test="${PINFO.nowPage eq 1}">
  			 	[<]
  			 </c:if>
  			 <c:if test="${PINFO.nowPage ne 1}">
  			 <a href="../freeBoard/boardList.sm?nowPage=${PINFO.nowPage-1}">[<]</a>
  			 </c:if>
  				
  			<%-- [1][2][3][4][5] --%>
  			<c:forEach var="page" begin="${PINFO.startPage}"
  			 end="${PINFO.endPage}" 
  			 >
  				<a href="../freeBoard/boardList.sm?nowPage=${page}">[${page}]</a>
  			</c:forEach>
  			<%--다음 페이지 현재 보고 있는 페이지가 마지막페이지까지 갔으면 --%>
  			 <c:if test="${PINFO.nowPage eq PINFO.totalPage}">
  			 	[>]
  			 </c:if>
  			 <c:if test="${PINFO.nowPage ne PINFO.totalPage}">
  			 <a href="../freeBoard/boardList.sm?nowPage=${PINFO.nowPage+1}">[>]</a>
  			 </c:if>
  			
  		</td>
  	</tr>
  </table>
  
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
</body>
</html>