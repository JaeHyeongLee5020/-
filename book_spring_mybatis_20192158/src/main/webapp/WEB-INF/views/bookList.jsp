<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">

function fnCmdNew() {
	document.bookForm.bno.value = 0;
	document.bookForm.action = "newUpdate" ;
	document.bookForm.submit();
}

function fnCmdEdit(recordNo) {
	document.bookForm.bno.value = recordNo;
	document.bookForm.action = "newUpdate" ;
	document.bookForm.submit();
}

function fnCmdDelete(recordNo) {
	document.bookForm.bno.value = recordNo;
	document.bookForm.action = "delete" ;
	document.bookForm.submit();
}

function fnCmdView(recordNo) {
	document.bookForm.bno.value = recordNo;
	document.bookForm.action = "view" ;
	document.bookForm.submit();
}

</script>
</head>
<body>
메세지 : ${message}<br/>
<a href="#" onclick="fnCmdNew()">[신규]</a>

<form:form id="bookForm" name="bookForm" method="post">
	<input type="hidden" name="bno" />
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>책이름</th>
				<th>출판사</th>
				<th>저자</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="result" items="${list}" varStatus="status">
				<tr>
					<td>${result.bno}</td>
					<td><a href="#" onclick="fnCmdView('${result.bno}')">${result.title}</a></td>
					<td>${result.publisher}</td>
					<td>${result.author}</td>
					<td>${result.price}</td>
					<td><a href="#" onclick="fnCmdEdit('${result.bno}')">수정</a></td>
					<td><a href="#" onclick="fnCmdDelete('${result.bno}')">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	
	</table>
</form:form>
</body>
</html>