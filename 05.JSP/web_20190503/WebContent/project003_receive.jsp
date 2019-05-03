<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.* ,com.connection.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name_ = request.getParameter("name_");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	Connection conn = null;
	PreparedStatement stmt = null;

	try {
		conn = MySQLConnection80.connect();

		String sql = "INSERT INTO members(id, name_, phone, email) VALUES (?, ?, ? ,?)";
		stmt = conn.prepareStatement(sql);
		
		stmt.setString(1,id);
		stmt.setString(2,name_);
		stmt.setString(3,phone);
		stmt.setString(4,email);
		
		stmt.executeUpdate();

		
		
	 } catch (Exception e) {
		 
	    } finally {
	        try {
	            if (stmt != null)
	                stmt.close();
	        } catch (SQLException se2) {
	        }
	        try {
	            MySQLConnection80.close();
	        } catch (SQLException se) {
	            se.printStackTrace();
	        }
	    }
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
		<p>회원 정보 추가 성공</p>
		
	</div>

</body>
</html>