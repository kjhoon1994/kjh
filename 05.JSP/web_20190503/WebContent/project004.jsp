<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.* ,com.connection.*"%>
<%
	// 데이터 수신 

	request.setCharacterEncoding("utf-8");

	String pageNum = request.getParameter("pageNum");

	String id = request.getParameter("id");
	String name_ = request.getParameter("name_");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

	// JDBC 액션
	// SELECT -> 최초 실행시

	StringBuilder sb = new StringBuilder();

	Connection conn = null;
	PreparedStatement stmt = null;
	int count = 0;
	try {
		if (id != null) {

			conn = MySQLConnection80.connect();

			String sql12 = "INSERT INTO members(id, name_, phone, email) VALUES (?, ?, ? ,?)";
			stmt = conn.prepareStatement(sql12);

			stmt.setString(1, id);
			stmt.setString(2, name_);
			stmt.setString(3, phone);
			stmt.setString(4, email);

			stmt.executeUpdate();
			stmt.close();
		}
		conn = MySQLConnection80.connect();

		String sql = "SELECT id, name_, phone, email FROM members";
		stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
	
		
		while (rs.next()) {
			sb.append(String.format("<tr>"));

			sb.append(String.format("<td>%s</td>", rs.getString("id")));
			sb.append(String.format("<td>%s</td>", rs.getString("name_")));
			sb.append(String.format("<td>%s</td>", rs.getString("phone")));
			sb.append(String.format("<td>%s</td>", rs.getString("email")));
			sb.append(String.format("</tr>"));
			++count;
		}
		rs.close();
	} catch (Exception e) {
		System.out.println(e);
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

	// INSERT + SELECT -> submit 액션 진행시
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

		<h1>
			회원관리 <small>v2.0 by KJH</small>
		</h1>
		<form action="project004.jsp" method="post">
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
			<button type="button" class="btn btn-default">Totalcount<span class="badge"><%=count %></span></button>
		</div>




	</div>

</body>
</html>