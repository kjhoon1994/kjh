<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.guestbook.*, java.util.*"%>
<%
	GuestbookDAO gbdao = new GuestbookDAO();
	// 데이터 수신 ->  글쓴이이름, 패스워드, 내용
	request.setCharacterEncoding("UTF-8");

	String name_ = request.getParameter("name_");
	String ipaddress = request.getRemoteAddr();
	String pw = request.getParameter("pw");
	String contents = request.getParameter("contents");

	// DAO 클래스의 add() 메소드 호출 
	Guestbook gb = new Guestbook(name_, ipaddress, pw, contents);
	int results = gbdao.add(gb);
	String result = "";
	
// 메시지 전달(성공 또는 실패 메시지) get 방식
	if (results == 0) {
		result = "fail";
	}

	if (results == 1) {
		result = "success";
	}
	
	// 강제 페이지 전환
	response.sendRedirect("guestbook.jsp?result= " + result);

%>
