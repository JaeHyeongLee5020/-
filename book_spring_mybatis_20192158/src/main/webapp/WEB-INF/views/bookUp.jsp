<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script type="text/javascript">

function fnCmdSave() {
	
	document.bookView2.action = '${commandUrl}';
	
	if (bookView2.title.value.length < 1) {
		alert("책이름을 입력하세요.");
		bookView2.title.focus();
		return false;
	}
	if (bookView2.publisher.value.length < 1) {
		alert("출판사를 입력하세요.");
		bookView2.publisher.focus();
		return false;
	}
	if (bookView2.author.value.length < 1) {
		alert("저자를 입력하세요.");
		bookView2.author.focus();
		return false;
	}
	if (bookView2.price.value.length < 1) {
		alert("가격을 입력하세요.");
		bookView2.price.focus();
		return false;
	}
	
	if (document.bookView2.bno.value == ""){
		document.bookView2.bno.value = 0;
	}
	
	document.bookView2.submit();
}
</script>
</head>
<body>


<a href="#" onclick="fnCmdSave()">[Submit]</a>
<form:form modelAttribute="book" name="bookView2" method="post">
	<input type="hidden" name="bno" name="bno" value="${book.bno}" />
	
	<table border="1">
	
		<tr>
			<th>책이름</th>
			<td><form:input path="title" size="50" value="${book.title}" />
			<span class="fieldError"><form:errors path="title" /></span>
			</td>
			
		</tr>

		<tr>
			<th>출판사</th>
			<td><form:input path="publisher" size="50" value="${book.publisher}" />
			<span class="fieldError"><form:errors path="publisher" /></span>
			</td>
		</tr>
		
		<tr>
			<th>저자</th>
			<td><form:input path="author" size="50" value="${book.author}" />
			<span class="fieldError"><form:errors path="author" /></span>
			</td>
		</tr>
		
		<tr>
			<th>가격</th>
			<td><form:input path="price" size="50" value="${book.price}" />
			<span class="fieldError"><form:errors path="price" /></span>
			</td>
		</tr>
		
	</table>
</form:form>


</body>
</html>