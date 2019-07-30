<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	border-collapse: collapse;
}

table thead {
	text-align: center;
	border: 1px solid black;
	font-size: 20px;
	backgroud-color: skyblue;
}

table tr th {
	text-align: center;
	border: 1px solid black;
}

table tr td {
	border: 1px solid black;
	text-align: center;
}

.container-login li {
	list-style: none;
	margin: 0px;
	padding: 0px;
	padding-right: 10px;
	float: right;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container text-center">
		<h1>Sports</h1>
	</div>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="<%=cp%>/main.do"><span
							class="glyphicon glyphicon-home"> 홈</span></a></li>
					<li><a href="<%=cp%>/record/list.do?leagueId=1&mode=goal">K-리그</a></li>
					<li><a href="<%=cp%>/record/list.do?leagueId=2&mode=goal">WK-리그</a></li>
					<li><a href="<%=cp%>/record/list.do?leagueId=3&mode=goal">내셔널리그</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<ul class="container-login">
		<c:if test="${empty sessionScope.member}">
			<li><a href="<%=cp%>/member/login.do">로그인</a></li>
			<li><a href="<%=cp%>/member/member.do">회원가입</a></li>
		</c:if>
		<c:if test="${not empty sessionScope.member}">
			<li><a href="<%=cp%>/member/logout.do">로그아웃</a></li>
			<li><a href="#">정보수정</a></li>
			<li style="color: black;">${sessionScope.member.userName}님</li>
		</c:if>
	</ul>

	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<form name="recordlistForm" method="post">
				<div class="panel panel-default">
					<div class="panel-heading"></div>
					<div class="panel-body">
						<table
							style="width: 100%; height: 35px; margin: 10px auto 0px; border: 1px solid black">
							<tr>
								<th width="50">순위</th>
								<th width="250">팀</th>
								<th width="150">승</th>
								<th width="150">무</th>
								<th width="150">패</th>
								<th>승점</th>
							</tr>

							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.rownum}</td>
									<td>${dto.teamname}</td>
									<td>${dto.win}</td>
									<td>${dto.draw}</td>
									<td>${dto.lose}</td>
									<td>${dto.point}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</form>
			
			<form name="teamlistForm" method="post">
				<div class="panel panel-default">
					<div class="panel-heading">
						<button type="button" onclick="javascript:location.href='<%=cp%>/record/list.do?mode=goal&leagueId=${leagueId}';">골</button>
						<button type="button" onclick="javascript:location.href='<%=cp%>/record/list.do?mode=assist&leagueId=${leagueId}';">도움</button>
						<button type="button" onclick="javascript:location.href='<%=cp%>/record/list.do?mode=mvp&leagueId=${leagueId}';">mvp</button>
					</div>
					<div class="panel-body">
						<table
							style="width: 100%; height: 35px; margin: 10px auto 0px; border: 1px solid black">
							<tr>
								<th width="50">순위</th>
								<th width="250">선수이름</th>
								<th width="150">소속팀</th>
								<th width="150">골</th>
								<th width="150">도움</th>
								<th>mvp</th>
							</tr>

							<c:forEach var="dto" items="${plist}">
								<tr>
									<td>${dto.rownum}</td>
									<td>${dto.playername}</td>
									<td>${dto.teamname}</td>
									<td>${dto.goal}</td>
									<td>${dto.assist}</td>
									<td>${dto.mvp}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

			</form>

			<div class="col-lg-3"></div>

		</div>
	</div>
</body>
</html>