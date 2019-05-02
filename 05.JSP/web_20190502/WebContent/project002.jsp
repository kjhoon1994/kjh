<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@ page import="java.sql.* ,com.connection.*" %>

<%
	StringBuilder sb = new StringBuilder();
	
	Connection conn = null;
	PreparedStatement stmt = null;

	try {
		conn = MySQLConnection80.connect();
			
		String sql = "SELECT id, name_, phone, email FROM members";
		stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()){
			
			sb.append(String.format("<tr>"));
			sb.append(String.format("<td>%s</td>", rs.getString("id")));
			sb.append(String.format("<td>%s</td>", rs.getString("name_")));
			sb.append(String.format("<td>%s</td>", rs.getString("phone")));
			sb.append(String.format("<td>%s</td>", rs.getString("email")));
			sb.append(String.format("</tr>"));
		}
			rs.close();
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
	<h1>회원정보</h1>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>PHONE</th>
						<th>EMAIL</th>
					</tr>
				</thead>
				<tbody>
					<%=sb.toString()%>
				</tbody>
			</table>

		</div>

	</div>
</body>
</html>