<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page
	import="java.sql.*, com.connection.*, com.guestbook.*, java.util.*"%>
<%!%>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	StringBuilder sb = new StringBuilder();

	LoginDAO ldao = new LoginDAO();

	//데이터 수신 -> ID, PW
	String id1 = request.getParameter("id1");
	String pwd = request.getParameter("pwd");
	
	//Admin 전용 LoginDAO 클래스의 login() 메소드 호출
	Login al = ldao.adminLogin(id1, pwd, 0);

	String result2 = "";

	//login() 메소드의 결과값을 가지고 회원 인증 여부 확인
	if (al == null) {
		//로그인 실패 -> 일반 사용자 페이지 또는 에러 메시지 페이지로 이동
		result2 = "fail";
		response.sendRedirect("guestbook.jsp?result2=" + result2);

	} else {
		//로그인 성공 -> 세션 객체 생성 -> 관리자 전용 페이지로 이동   
		result2 = "success";
		session.setAttribute("login", al);
		response.sendRedirect("adminguestbook.jsp?result2=" + result2);
	}

%>
