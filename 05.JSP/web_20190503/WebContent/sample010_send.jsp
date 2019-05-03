<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- <%!private String method() {

	}
%> --%>

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
		<h1>폼 전송</h1>
		
		<form action="sample010_receive.jsp" method="post">
			<div class="form-group">
				<label for="email">Email address:</label> 
				<input type="email"
					class="form-control" id="email" name="email">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> 
				<input type="password"
					class="form-control" id="pwd" name="pwd">
			</div>
			<div class="checkbox">
				<label><input type="checkbox" value="checked" name="rememberme">Remember me</label>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>

		

	</div>

</body>
</html>