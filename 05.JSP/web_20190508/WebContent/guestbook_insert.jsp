<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*, com.connection.*, com.guestbook.*"%>
<%!%>
<%
	GuestbookDAO gdao = new GuestbookDAO();
	request.setCharacterEncoding("UTF-8");

	String name_ = request.getParameter("name_");
	String pw = request.getParameter("pw_");
	String contents = request.getParameter("contents");
	String ipaddress = request.getRemoteAddr();

	String result = "fail";
	Guestbook gb = new Guestbook(name_, pw, contents, ipaddress);
	int i = gdao.addguestbook(gb);
	if (i==1){
		result = "success";
	}

	//강제 페이지 전환
	response.sendRedirect("guestbook.jsp?result=" + result);
%>
response.sendRedirect("adminguestbook.jsp"); %>
