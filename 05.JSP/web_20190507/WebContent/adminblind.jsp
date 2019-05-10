<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page
	import="java.sql.*, com.connection.*, com.guestbook.*, java.util.*"%>
<%!%>
<%
	//관리자 전용 페이지
	// 세션 검사 과정 아무나 못들어오게 하는 창을 만들기 위해 사용

	Object sess = session.getAttribute("login");
	if (sess == null) {
		// 강제 페이지 전환
		response.sendRedirect("guestbook.jsp");		
	}

	AdminGuestbookDAO agdao = new AdminGuestbookDAO();

	String ssn = request.getParameter("ssn");
	String blind = request.getParameter("blind");

	if (blind.equals("1")) {
		agdao.blind(ssn, 0);
	} else {
		agdao.blind(ssn, 1);
	}

	response.sendRedirect("adminguestbook.jsp");
%>