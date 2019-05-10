<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page
	import="java.io.*,java.util.*, com.connection.*, com.guestbook.*"%>
<%
	//절대경로 확인	
	String path = request.getContextPath();

	// 페이지 수신
	// 최초 실행시 기본값 설정 -> 1페이지
	String pagenum = request.getParameter("pagenum");
	String pagecount = request.getParameter("pagecount");

	if (pagenum == null) {
		pagenum = "1";
	}
	if (pagecount == null) {
		pagecount = "5";
	}

	GuestbookDAO gdao = new GuestbookDAO();
	AdminpictureDAO apdao = new AdminpictureDAO();

	List<Guestbook> list = gdao.glist(pagenum, pagecount);
	List<Adminpicture> list1 = apdao.plist();

	// 페이지 정보 제공
	String pre = "";
	String next = "";
	String prepage = "" + (Integer.parseInt(pagenum) - 1);
	String nextpage = "" + (Integer.parseInt(pagenum) + 1);

	int ttcnt = gdao.totalcount();
	int cnt = list.size();

	if (pagenum.equals("1")) {
		pre = "disabled='disabled'";
	}
	if (Integer.parseInt(pagenum) * Integer.parseInt(pagecount) >= ttcnt) {
		next = "disabled='disabled'";
	}

	//-> offset, count 형태로 변환해서 제공
	// 1페이지 -> 0, 10
	// 2페이지 -> 10, 10

	StringBuilder sb = new StringBuilder();

	int tcnt = 0;
	int ssn = 0;

	String result = request.getParameter("result");
	String message = "";

	String result1 = request.getParameter("result1");
	String message1 = "";

	String result2 = request.getParameter("result2");
	String message2 = "";

	String pic = "";
	String li = "";

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

	if (result1 == null) {
		result1 = "";
	} else if (result1.equals("success")) {
		message1 += "<div class='alert alert-success alert-dismissible'>";
		message1 += "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
		message1 += "<strong>Success!</strong>삭제를 성공하였습니다";
		message1 += "</div>";
	} else if (result1.equals("fail")) {
		message1 += "<div class='alert alert-danger alert-dismissible'>";
		message1 += "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
		message1 += "<strong>Fail!</strong>삭제를 실패하였습니다.";
		message1 += "</div>";
	}

	if (result2 == null) {
		result2 = "";
	} else if (result2.equals("fail")) {
		message2 += "<div class='alert alert-danger alert-dismissible'>";
		message2 += "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
		message2 += "<strong>Fail!</strong> 로그인에 실패하였습니다.";
		message2 += "</div>";

	} else if (result2.equals("logout")) {
		message2 += "<div class='alert alert-warning alert-dismissible'>";
		message2 += "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
		message2 += "<strong>Logout!</strong> 로그아웃되었습니다.";
		message2 += "</div>";
	}

	//동적으로 <tr>, <td>를 작성하는 위치
	for (Guestbook g : list) {
		sb.append(String.format("<tr>"));
		sb.append(String.format("<td>%d</td>", g.getSsn()));
		sb.append(String.format("<td>%s</td>", g.getName_()));
		sb.append(String.format("<td>%s</td>", g.getContents()));
		sb.append(String.format("<td>%s</td>", g.getSdate()));
		sb.append(String.format("<td><button type='button' class='btn btn-default btnDelete' value='"
				+ g.getSsn() + "'>삭제</button></td>"));
		sb.append(String.format("</tr>"));
		++tcnt;
	}

	int row = 0;

	for (Adminpicture ap : list1) {
		if (row == 0) {
			pic += "<div class='item active'>";
			li += "<li data-target='#myCarousel' data-slide-to=" + row + " class='active'></li>";
		} else {
			pic += "<div class='item'>";
			li += "<li data-target='#myCarousel' data-slide-to='" + row + "'></li>";
		}
		pic += "<img src='resources/picture/" + ap.getPname() + "' alt='" + ap.getPcontents() + "'>";
		pic += "</div>";
		System.out.println(row);
		++row;
	}
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
h2 {
	text-align: center;
}
</style>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(
			function() {
				$(".btnDelete").on("click", function() {
					$("#myModal01").children().find("#ssn").val(this.value);
					$("#myModal01").modal();
				});

				$("#btnPrevious").on(
						"click",
						function() {

							location.assign("guestbook.jsp?pagenum="
									+ this.value + "&pagecount=5");

						});

				$("#btnNext").on(
						"click",
						function() {

							location.assign("guestbook.jsp?pagenum="
									+ this.value + "&pagecount=5");

						});
			});

	// 이전, 다음 버튼에 대해서 value 속성의 값 할당
	// 현재 페이지가 1인 경우 이전 버튼은 비활성, 다음 버튼이 2가 되도록한다.
	// 현재 페이지가 2인 경우 이전 버튼은 (현재페이지 -1), 다음 버튼이 3이 되도록한다.

	// 이전, 다음에 버튼에 대한 클릭 이벤트

	function myFunction() {

	}
</script>

</head>
<body>
	<div class="container">
		<!-- 방명록에 대한 정적 HTML 태그(화명 설계에 따른 구현) 구성 -->
		<h2>
			<img src="resources/img/prodo.PNG" width="100" height="70">방명록<small>v1.0</small>
		</h2>
		<div class="panel panel-default">
			<div class="panel-body">
				서울 마포구 월드컵북로 21 2층 풍성빌딩 지번서울 마포구 서교동 447-5
				<button class="btn btn-default btn-xs btnMap" data-toggle="modal"
					data-target="#myModal02">Map</button>
				<button class="btn btn-default btn-xs btnAdmin" data-toggle="modal"
					data-target="#myModal03">Admin</button>
			</div>
		</div>

		<%=message2%>

		<div class="panel panel-default">
			<div class="panel-heading">사진 목록</div>
			<div class="panel-body">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">

					<!-- Wrapper for slides -->
					<ol class='carousel-indicators'>
						<%=li%>
					</ol>

					<div class='carousel-inner'>
						<%=pic%>
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
				<%=message%>
				<form action="guestbook_insert.jsp" method="post">
					<div class="form-group">
						<input type="text" class="form-control input-lg" id="name_"
							name="name_" placeholder="name(max:20)">
					</div>
					<div class="form-group">
						<input type="password" class="form-control input-lg" id="pw_"
							name="pw_" placeholder="password(max:20)">
					</div>
					<div class="form-group">
						<input type="text" class="form-control input-lg" id="contents"
							name="contents" placeholder="content(max:500)">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>

			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">방명록 글목록</div>
			<div class="panel-body">
				<%=message1%>
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
				<div class="form-inline">
					<!-- 검색 결과 자료 갯수 -->
					<button type="button" class="btn btn-default">
						Count <span class="badge" id="count"><%=cnt%></span>
					</button>


				</div>

				<div class="form-group row">
					<div class="btncount col-xs-1">
						<button type="button" class="btn btn-default">
							TotalCount<span class="badge"><%=ttcnt%></span>
						</button>
					</div>
					<div class="col-xs-3">
						<ul class="pager">
							<button type="button" class="btn btn-default btn-md" <%=pre%>
								id="btnPrevious" value=<%=prepage%>>Previous</button>
							<button type="button" class="btn btn-default btn-md" <%=next%>
								id="btnNext" value=<%=nextpage%>>Next</button>
						</ul>
					</div>
					<div class="col-xs-2">
						<select class="form-control" id="sel1">
							<option>번호</option>
							<option>글쓴이</option>
							<option>글내용</option>
						</select>
					</div>
					<div class="col-xs-4">
						<input type="text" class="form-control" placeholder="Search"
							name="search">
					</div>
					<div class="col-xs-2">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search">Search</i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal01" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">게시물 삭제</h4>
				</div>
				<div class="modal-body">

					<div class="panel panel-default">
						<div class="panel-heading"></div>
						<div class="panel-body">

							<form action="guestbook_delete.jsp">
								<div class="form-group">
									<label for="ssn">게시물 번호:</label> <input type="text"
										class="form-control input-lg" id="ssn" name="ssn"
										placeholder="ssn">
								</div>
								<div class="form-group">
									<label for="pw">비밀번호:</label> <input type="password"
										class="form-control input-lg" id="pw" name="pw"
										placeholder="password">
								</div>
								<button type="submit" class="btn btn-default">Submit</button>
							</form>

						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal02" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">찾아오는길</h4>
				</div>
				<div class="modal-body">

					<div class="panel panel-default">
						<div class="panel-heading"></div>
						<div class="panel-body">

							<div id="googleMap" style="width: 100%; height: 400px;"></div>

							<script>
								function myMap() {
									var mapProp = {
										center : new google.maps.LatLng(
												37.556488, 126.919493),
										zoom : 16,
									};
									var map = new google.maps.Map(document
											.getElementById("googleMap"),
											mapProp);

									var marker = new google.maps.Marker({
										position : new google.maps.LatLng(
												37.556488, 126.919493)
									});
									marker.setMap(map);

									var infowindow = new google.maps.InfoWindow(
											{
												content : "강북쌍용교육센터<br> 안내전화번호 02-1111-2222"
											});
									google.maps.event.addListener(marker,
											'click', function() {
												infowindow.open(map, marker);
											});

								}
							</script>
						</div>
						<script
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVPywAdtG5UAexlrhBU8XYNsTTVdTSZWg&callback=myMap"></script>

					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal03" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Admin Login</h4>
				</div>
				<div class="modal-body">
					<form action="login.jsp" method="post">
						<div class="form-group">
							<label for="id1">ID:</label> <input type="text"
								class="form-control input-lg" id="id1" name="id1"
								placeholder="ID">
						</div>
						<div class="form-group">
							<label for="pwd">비밀번호:</label> <input type="password"
								class="form-control input-lg" id="pwd" name="pwd"
								placeholder="password">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>

				</div>
			</div>
		</div>

		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>




</body>
</html>
