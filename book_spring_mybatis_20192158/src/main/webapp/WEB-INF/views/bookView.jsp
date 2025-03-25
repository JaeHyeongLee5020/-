<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script type="text/javascript">

</script>
</head>
<body>



<form:form modelAttribute="book" name="bookView" method="post">
	<input type="hidden" name="bno" name="bno" value="${book.bno}" readonly />
	
	<table border="1">
	
		<tr>
			<th>책이름</th>
			<td>${book.title}</td>
			
		</tr>

		<tr>
			<th>출판사</th>
			<td>${book.publisher}</td>
		</tr>
		
		<tr>
			<th>저자</th>
			<td>${book.author}</td>
		</tr>
		
		<tr>
			<th>가격</th>
			<td>${book.price}</td>
		</tr>
		
	</table>
</form:form>


</body>
</html>