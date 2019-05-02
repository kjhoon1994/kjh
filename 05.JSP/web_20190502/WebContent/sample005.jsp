<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import ="java.util.Calendar" %>
    
<%!
private int method(int a, int b)
    {
		return a + b;	
    }
%>

<%
	StringBuilder sb=new StringBuilder();;
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int date = cal.get(Calendar.DATE);
	
	sb.append(String.format("%d년 %d월 %d일<br>",year,month,date));
	sb.append(String.format("%d", method(10,20)));		
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용교육센터</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<style></style>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>

	$(document).ready(function(){

	  // jQuery methods go here...

	});
	
	function myFunction(){
		
	}
</script>
</head>
<body>
	
	<div class="container">
	
		오늘날짜: <%= sb.toString() %>
	</div>

</body>
</html>