<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.guestbook.*, java.util.*"%>
<%!%>
 <%-- <%=path%> 절대경로 표기법--%>
<%
	GuestbookDAO gdao = new GuestbookDAO();
	// 절대경로 확인
	String path = request.getContextPath();

	List<Guestbook> list = gdao.glist();

	StringBuilder sb = new StringBuilder();

	String result = request.getParameter("result");
	String message = "";

	if (result == null) {
		result = "";
	} else if (result.equals("success")) {
		message += "<div class='alert alert-success alert-dismissible'>";
		message += "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
		message += "<strong>Success!</strong>글작성에 성공하였습니다.";
		message += "</div>";
	} else if (result.equals("fail")) {
		message += "<div class='alert alert-danger alert-dismissible'>";
		message += "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
		message += "<strong>Fail!</strong>글 작성에 실패하였습니다.";
		message += "</div>";
	}

	for (Guestbook g : list) {
		sb.append(String.format("<tr>"));
		sb.append(String.format("<td>%d</td>", g.getSsn()));
		sb.append(String.format("<td>%s</td>", g.getName_()));
		sb.append(String.format("<td>%s</td>", g.getContents()));
		sb.append(String.format("<td>%s</td>", g.getSdate()));
		sb.append(String.format("<td><button type='button' class='delete'>삭제</button></td>"));
		sb.append(String.format("</tr>"));
	}

	//동적으로 <tr>, <td>를 작성하는 위치
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

<style>
</style>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {

	});

	function myFunction() {

	}
</script>

</head>
<body>
	<div class="container">
		<!-- 방명록에 대한 정적 HTML 태그(화명 설계에 따른 구현) 구성 -->
		<h2>
			<img src="img/la.jpg" width="100" height="70">방명록<small>v1.0</small>
		</h2>
		<div class="panel panel-default">
			<div class="panel-body">서울 마포구 월드컵북로 21 2층 풍성빌딩 지번서울 마포구 서교동
				447-5</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">Picture List</div>
			<div class="panel-body">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="img/la.jpg" alt="Los Angeles">
						</div>

						<div class="item">
							<img src="img/chicago.jpg" alt="Chicago">
						</div>

						<div class="item">
							<img src="img/ny.jpg" alt="New York">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">방명록 글쓰기</div>
			<div class="panel-body">
			<%=message %>
				<form action="guestbook_insert.jsp">
					<div class="form-group">
						<input type="text" class="form-control input-lg" id="name_"
							placeholder="name(max:20)">
					</div>
					<div class="form-group">
						<input type="password" class="form-control input-lg" id="pw"
							placeholder="password(max:20)">
					</div>
					<div class="form-group">
						<input type="text" class="form-control input-lg" id="contents"
							placeholder="content(max:500)">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>

			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">방명록 글목록</div>
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>글쓴이</th>
							<th>글내용</th>
							<th>작성일</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<%=sb.toString()%>
					</tbody>
				</table>
				<ul class="pager">
					<li><a href="#">Previous</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
