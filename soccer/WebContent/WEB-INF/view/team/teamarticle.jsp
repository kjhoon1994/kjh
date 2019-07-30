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

<script type="text/javascript">
	$(function(){
		$("#delete").click(function(){
			
			var cnt=$("input[name=check]:checked").length;
			if(cnt==0) {
				alert("삭제할 선수를 먼저 선택하세요.");
				return false;
			}
			
			if(cnt>1){
				
				alert("한명만 선택하세요.");
				return false;
				
			}
			if(confirm("게시물을 삭제 하시겠습니까 ?")){
			var s =document.articleForm;
			s.action="<%=cp%>/player/delete.do";
			s.submit();
			}
		});
	
		$("#update").click(function(){
			var cnt=$("input[name=check]:checked").length;
			if(cnt==0) {
				alert("변경할 선수를 먼저 선택하세요.");
				return false;
			}
			
			if(cnt>1){
				
				alert("한명만 선택하세요.");
				return false;
				
			}
			
			var f =document.articleForm;
			f.action="<%=cp%>/player/update.do";
			f.submit();
		});

	});
</script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="<%=cp%>/main.do"><span
							class="glyphicon glyphicon-home"></span></a></li>
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
			<li style="color: black;">${sessionScope.member.userName}님</li>
		</c:if>
	</ul>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<form name="articleForm" method="post">
				<div class="panel panel-default">

					<div class="panel-heading">팀 정보</div>
					<div class="panel-body">

						<table
							style="width: 100%; height: 35px; margin: 10px auto 0px; border: 1px solid black">
							<tr>
								<th style="width: 20px">선택</th>
								<th style="width: 20px;">선수이름</th>
								<th style="width: 50px;">등번호</th>
								<th style="width: 50px;">팀이름</th>
								<th style="width: 50px;">골</th>
								<th style="width: 50px;">도움</th>
								<th style="width: 50px;">MVP</th>
								<th style="width: 50px;">국적</th>
							</tr>

							<c:forEach var="dto" items="${list}">
								<tr>
									<td><input type="checkbox" name="check"
										value="${dto.playerId}"></td>
									<td>${dto.playerName}</td>
									<td>${dto.playerBackNum}</td>
									<td>${dto.teamName}</td>
									<td>${dto.goal}</td>
									<td>${dto.assist}</td>
									<td>${dto.mvp}</td>
									<td>${dto.country}</td>
								</tr>
							</c:forEach>

						</table>

					</div>
				</div>
				<div>
					<button type="button"
						onclick="javascript:location.href='<%=cp%>/player/created.do?teamId=${teamId}&leagueId=${leagueId}';">선수
						추가</button>
					&nbsp; &nbsp;
					<button type="button" id="delete">선수삭제</button>
					&nbsp; &nbsp;
					<button type="button" id="update">선수 정보 변경</button>

					<input type="hidden" name="leagueId" value="${leagueId}"> <input
						type="hidden" name="teamId" value="${teamId}">
				</div>
			</form>
			<div class="col-sm-3"></div>

		</div>
	</div>
</body>
</html>