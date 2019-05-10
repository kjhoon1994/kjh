<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<title>쌍용교육센터</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>

</head>
<body>

	<div class="container">

		<h1>파일 업로드 테스트</h1>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">Picture Upload</div>
			<div class="panel-body">
				<!-- 
                    주의) 파일 업로드를 위해서 <form> 엘리먼트에
                    enctype="multipart/form-data" 속성 필수
                    -->
				<form action="fileupload.jsp" method="post"
					enctype="multipart/form-data">

					<div class="form-group">
						<!-- 
                            주의) 파일 업로드를 위해서 파일선택폼 필요
                            type="file" 속성은 파일선택시 사용 
                            주의) 입력폼에 선택버튼이 기본 제공된다.
                            -->
						<input type="file" class="form-control" id="filename"
							name="filename" placeholder="파일선택" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="content"
							name="content" placeholder="사진설명(max 100)" required value="">
					</div>

					<!-- 폼 전송시 type="submit" 속성 필수 -->
					<button type="submit" class="btn btn-default">업로드</button>

				</form>
			</div>
		</div>


	</div>

</body>
</html>
