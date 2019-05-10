<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*, com.connection.*, com.guestbook.*, java.util.*"%>
<%!

%>
<%
   //데이터 수신 -> ssn, blind
   
   //admin DAO 클래스의 blind() 메소드 호출
   
   //강제 페이지 전환
   
   AdminGuestbookDAO agdao = new AdminGuestbookDAO();

   String ssn = request.getParameter("ssn");
   String blind = request.getParameter("blind");
   
   if(blind.equals("1")) {
      agdao.blind(ssn, 0);
   } else {
      agdao.blind(ssn, 1);
   }
   
   response.sendRedirect("adminguestbook.jsp");
%>