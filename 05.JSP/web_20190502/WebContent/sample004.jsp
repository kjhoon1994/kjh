<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%><!-- 디렉티브  -->
<%@ page import="java.util.*" %> 	<!-- 페이지 디렉티브 -->    
    
<% 
	/* 스트립트릿  : 실행문 적을때 ex) for 문 console 출력문을 적지 않는다.*/
	String result = "Hello, World!";

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용교육센터</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<style></style>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>

	$(document).ready(function(){

	  // jQuery methods go here...

	});
	
	function myFunction(){
		
	}
</script>
</head>
<body>

	
	
	<div class="container">
	
		결과 : <%=result %><!-- 표현식: 출력부분 -->
	
	</div>

</body>
</html>