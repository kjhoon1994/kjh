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
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="<%=cp%>/main.do"><span
							class="glyphicon glyphicon-home"> 홈</span></a></li>
					<li><a href="<%=cp%>/team/list.do?leagueId=1">K-리그</a></li>
					<li><a href="<%=cp%>/team/list.do?leagueId=2">WK-리그</a></li>
					<li><a href="<%=cp%>/team/list.do?leagueId=3">내셔널리그</a></li>
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
	<div class="container">
		<form class="form-horizontal" method="post" action="<%=cp%>/team/created_ok.do?leagueId=${leagueId}">
			<div class="form-group">
				<label class="control-label col-sm-4" for="teamNname">팀 이름 :</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="teamName"
						placeholder="팀이름" name="teamName">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="coach">감독 이름 :</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="coach"
						placeholder="감독님 이름" name="coach">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="tnumber">리그 번호 :</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="tnumber"
						 name="tnumber" value="${leagueId}">
				</div>
			</div>
			
			<br>
			<div class="form-group">
				<label class="control-label col-sm-4" for="submit"></label>
				<div class="col-sm-4">
					<button type="submit" class="btn btn-default">등록하기</button>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>