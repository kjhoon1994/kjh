<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page
	import="java.sql.*, com.connection.*, com.guestbook.*, java.util.*"%>
<%
	
	GuestbookDAO gdao = new GuestbookDAO();

	// 절대경로 확인
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	
	//데이터 수신 -> 글 번호, 패스워드
	String ssn = request.getParameter("ssn");
	String pw = request.getParameter("pw");


	// DAO 클래스의 remove() 메소드 호출
	int re = gdao.removeguestbook(ssn,pw);
	
	String result1 = "fail";

	if (re == 1) {
		result1 = "success";
	}

	//강제페이지 전환
	response.sendRedirect("guestbook.jsp?result1=" + result1);
%>
