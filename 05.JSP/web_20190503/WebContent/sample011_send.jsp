<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>


<%
	// 데이터 수신
	// 주의) 최초 실행시 수신할 데이터가 없다
	request.setCharacterEncoding("utf-8");
	
	String pageNum = request.getParameter("pageNum");
	String name = request.getParameter("name");
	// 디폴트 데이터
	if (pageNum == null) {
		pageNum = "2";
	}
	
	System.out.println("pageNum : " +pageNum);
	System.out.println("name : " +name);
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

<style></style>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

		// jQuery methods go here...

	});

	function myFunction() {

	}
</script>
</head>
<body>

	<div class="container">


		<h2>
			<img src="img/prodo.PNG" width="100" height="70">방명록<small>v1.0</small>
		</h2>
		<div class="btn-group btn-group-justified header01">
			<a href="#" class="btn btn-default">방명록관리</a> <a href="#"
				class="btn btn-default">사진 관리</a> <a href="#"
				class="btn btn-default">마이 페이지</a> <a href="#"
				class="btn btn-default">로그아웃</a>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">사진 업로드</div>
			<div class="panel-body">
				<form action="/action_page.php">
					<div class="form-group">
						<label for="contents">사진 설명(50자이내)</label> <input type="text"
							class="form-control" id="contents">
					</div>
					<div class="form-group">
						<label for="picture">사진 파일</label> <input type="file"
							class="form-control" id="picture">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">사진 목록</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="img/chicago.jpg"> <img src="img/chicago.jpg"
								alt="Lights" style="width: 100%">
								<div class="caption">
									<p>시카고공연</p>
								</div>
							</a>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="img/la.jpg"> <img src="img/la.jpg" alt="Nature"
								style="width: 100%">
								<div class="caption">
									<p>LA 공연</p>
								</div>
							</a>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="img/ny.jpg"> <img src="img/ny.jpg" alt="Fjords"
								style="width: 100%">
								<div class="caption">
									<p>뉴욕공연</p>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<ul class="pager">
			<li><a href="sample011_send.jsp?pageNum=1">Previous</a></li>
			<li><a href="sample011_send.jsp?pageNum=3&name=홍길동">Next</a></li>
		</ul>

	</div>

</body>
</html>