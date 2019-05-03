<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	StringBuilder sb = new StringBuilder();
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


		<h1>회원 관리 v2.</h1>
		<form action="project003_receive.jsp" method="post">
			<div class="form-group">
				<label for="id">MID:</label> <input type="text" class="form-control"
					id="id" name="id">
			</div>
			<div class="form-group">
				<label for="name">NAME:</label> <input type="text"
					class="form-control" id="name" name="name_">
			</div>
			<div class="form-group">
				<label for="phone">PHONE:</label> <input type="text"
					class="form-control" id="phone" name="phone">
			</div>
			<div class="form-group">
				<label for="email">EMAIL:</label> <input type="email"
					class="form-control" id="email" name="email">
			</div>
			<div class="checkbox">
				<label><input type="checkbox" value="checked"
					name="rememberme">Remember me</label>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>


	</div>

</body>
</html>