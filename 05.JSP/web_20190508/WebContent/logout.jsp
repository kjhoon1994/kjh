<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*, com.connection.*"%>
<%!
 
%>
<%
   String path = request.getContextPath();
   request.setCharacterEncoding("UTF-8");
   StringBuilder sb = new StringBuilder();
   
   //세션 객체 소명
   session.invalidate();
   
   //강제 페이지 전환 -> 로그아웃 메시지 페이지
   String result2 = "logout";
   response.sendRedirect("guestbook.jsp?result2=" + result2);