<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="./jsp_header.jsp"%>
<html>
<head>
<title>도서 정보</title>
</head>

<body>
	<div align="center" class="body">
		<h2>도서 정보</h2>
                책이 검색되었습니다, ${findBook.title}！ <br><br>
		<table border="1" width="400">
		  <tr>
		    <th bgcolor="skyblue">저 자</th>
		    <td>${findBook.author}</td>		  
		  </tr>
		  <tr>
		    <th bgcolor="skyblue">출 판 사</th>
		    <td>${findBook.publisher}</td>		  
		  </tr>		  
		  <tr>
		    <th bgcolor="skyblue">가 격</th>
		    <td>${findBook.price}</td>		  
		  </tr>		
	
		</table>

	</div>
</body>
</html>
