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

.container-login li{
	list-style: none;
	margin: 0px;
	padding: 0px;
	padding-right: 10px;
	float:right;
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
					<li><a href="<%=cp%>/match/list.do?leagueId=1">K-리그 경기</a></li>
					<li><a href="<%=cp%>/match/list.do?leagueId=2">WK-리그 경기</a></li>
					<li><a href="<%=cp%>/match/list.do?leagueId=3">내셔널리그 경기</a></li>
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
			<li style="color: black;">${sessionScope.member.userName} 님</li>
		</c:if>
	</ul>
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<form name="teamlistForm" method="post">
				<div class="panel panel-default">
					<div class="panel-heading"></div>
					<div class="panel-body">
						<table
							style="width: 100%; height: 35px; margin: 10px auto 0px; border: 1px solid black">
							<tr>
								<th width="50">선택</th>
								<th width="70">번호</th>
								<th width="150">홈팀</th>
								<th width="150">어웨이팀</th>
								<th width="100">경기 날짜</th>
								<th width="150">경기장</th>
								<th>리그 이름</th>
							</tr>

							<c:forEach var="dto" items="${matchlist}">
								<tr>
									<td><input type="checkbox" name="check"
										value="${dto.matchId}"></td>
									<td><a href="<%=cp%>/match/article.do?matchId=${dto.matchId}&leagueId=${leagueId}">${dto.matchId}</a></td>
									<td>${dto.hometeam}</td>
									<td>${dto.awayteam}</td>
									<td>${dto.matchdate}</td>
									<td>${dto.stadium}</td>
									<td>${dto.leaguename}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<button type="button"
					onclick="javascript:location.href='<%=cp%>/match/created.do?leagueId=${leagueId}';">경기
					추가</button>
				<button type="button" id="delete">경기 삭제</button>
			</form>
			<div class="col-lg-3"></div>

		</div>
	</div>
</body>
</html>