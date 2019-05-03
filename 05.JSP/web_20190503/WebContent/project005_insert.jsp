<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.* ,com.connection.*"%>
<%
	// HTML 태그가 없는 액션 전용 페이지

	// 데이터 수신
	request.setCharacterEncoding("utf-8");

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
	// 강제 페이지 전환
	response.sendRedirect("project005.jsp");

%>