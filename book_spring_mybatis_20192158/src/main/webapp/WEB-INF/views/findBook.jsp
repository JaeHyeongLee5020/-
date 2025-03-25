<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="./jsp_header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>도서 검색</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>

<body>
<h2 align="center">도서명으로 검색하기</h2>
		<div class="form">
			<form:form class="login-form" modelAttribute="book" method="post" action="find">

				<p align="left">
					<span class="fieldError"><form:errors path="title" /></span>
				</p>
				<form:input path="title" type="text" placeholder="도서명" />
				<button type="submit">책검색</button>
			</form:form>
		</div>
</body>
</html>
