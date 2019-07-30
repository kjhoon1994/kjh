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
			<li style="color: black;">${sessionScope.member.userName}님</li>
		</c:if>
	</ul>

	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<form name="matcharticleForm">
				<div class="panel panel-default">
					<c:forEach var="dto" items="${list}">
							<div class="panel-heading">${dto.hometeam}VS
								${dto.awayteam}</div>
							<div class="panel-body">
								<c:choose>
									<c:when test="${dto.homescore > dto.awayscore}">
										<p>경기 결과: ${dto.homescore} : ${dto.awayscore}&nbsp;&nbsp;
											${dto.hometeam} 승</p>
									</c:when>
									<c:when test="${dto.homescore < dto.awayscore}">
										<p>경기 결과: ${dto.homescore} : ${dto.awayscore}&nbsp;&nbsp;
											${dto.awayteam} 승</p>
									</c:when>
									<c:otherwise>
										<p>경기 결과: ${dto.homescore} : ${dto.awayscore}&nbsp;&nbsp;무</p>
									</c:otherwise>
								</c:choose>

								<p>경기 시간: ${dto.matchdate}</p>
								<p>경기장 : ${dto.stadium}</p>
							</div>
					</c:forEach>
					
					<c:if test="${empty list}">
							<div class="panel-heading">경기 내용 없음</div>
							<div class="panel-body">
								<p>경기 내용을 입력해 주세요.</p>
								<p>
								<button type="button" onclick="javascript:location.href='<%=cp%>/match/add.do?matchId=${matchId}&leagueId=${leagueId}';">추가하기</button>
							</p>	
							</div>
											
					</c:if>
					
				</div>

			</form>
		</div>
		<div class="col-sm-3"></div>
	</div>

</body>
</html>