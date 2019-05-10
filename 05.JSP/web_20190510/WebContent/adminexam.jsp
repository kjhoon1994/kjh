<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	StringBuilder sb = new StringBuilder();
	// 절대경로 확인
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용교육센터</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<style></style>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		// jQuery methods go here...
	});

	function myFunction() {

	}
</script>
</head>
<body>

	<div class="container">
		<h2>
			시험<small>v1.0</small>
		</h2>
		<nav class="navbar navbar-default">

			<div class="navbar-header"></div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">과목 관리</a></li>
				<li><a href="#">문제 관리</a></li>
				<li><a href="#">채점 관리</a></li>
				<li><a href="#">[관리자/admin]로그아웃</a></li>
			</ul>

		</nav>


	</div>

</body>
</html>