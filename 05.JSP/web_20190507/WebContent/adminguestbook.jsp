<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.guestbook.*, java.util.*"%>
<%!%>
<%
   AdminGuestbookDAO agdao = new AdminGuestbookDAO();

   List<Guestbook> list = agdao.glist();

   StringBuilder sb = new StringBuilder();
   int cnt = 0;
   int tcnt = 0;
   int bcnt = 0;

   //동적으로 <tr>, <td>를 작성하는 위치
   for (Guestbook g : list) {
      sb.append(String.format("<tr>"));
      sb.append(String.format("<td>%d</td>", g.getSsn()));
      sb.append(String.format("<td>%s</td>", g.getName_()));
      sb.append(String.format("<td>%s</td>", g.getContents()));
      sb.append(String.format("<td>%s</td>", g.getSdate()));
      sb.append(String.format("<td>%s</td>", g.getIpaddress()));
      if (g.getBlind() == 0) {
         sb.append(String.format(
               "<td><div class='btn-group'><button type='button' class='btn btn-default disabled on' value="+g.getSsn()+">on</button>"));
         sb.append(String.format(
               "<button type='button' class='btn btn-default active off value="+g.getSsn()+"'>off</button></div></td>"));
         ++cnt;
      } else {
         sb.append(String.format(
               "<td><div class='btn-group'><button type='button' class='btn btn-default active on' value="+g.getSsn()+">on</button>"));
         sb.append(String.format(
               "<button type='button' class='btn btn-default disabled off' value="+g.getSsn()+">off</button></div></td>"));
         ++bcnt;
      }

      sb.append(String.format("</tr>"));
      ++tcnt;
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

.search {
   display: inline-block;
}
</style>

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
   $(document).ready(function() {
      
      //blind on/off 버튼에 대한 클릭 이벤트 등록
      //서버 요청시 get방식 자료 전송
      $(".on").on("click", function() {
         
         location.assign("adminblind.jsp?ssn="+this.value+"&blind=0");
      });
      
      $(".off").on("click", function() {
         location.assign("adminblind.jsp?ssn="+this.value+"&blind=1");
      });

      
   });

   function myFunction(value) {
      
   }
</script>

</head>
<body>
   <div class="container">
      <!-- 방명록에 대한 정적 HTML 태그(화명 설계에 따른 구현) 구성 -->
      <h2>
         <img src="img/1.PNG" width="100" height="70">방명록<small>v1.0</small>
      </h2>
      <nav class="navbar navbar-default">
         <div class="container-fluid">
            <div class="navbar-header">
               <a class="navbar-brand" href="#">쌍용교육센터</a>
            </div>
            <ul class="nav navbar-nav">
               <li class="active"><a href="#">방명록관리</a></li>
               <li><a href="#">사진관리</a></li>
               <li><a href="#">로그아웃</a></li>
            </ul>
         </div>
      </nav>

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
                     <th>ClientIP</th>
                     <th>Blind</th>
                  </tr>
               </thead>
               <tbody>
                  <%=sb.toString()%>
               </tbody>
            </table>
            <div class="form-group row">
               <div class="btncount col-xs-4">
                  <button type="button" class="btn btn-default">
                     TotalCount<span class="badge"><%=tcnt%></span>
                  </button>

                  <button type="button" class="btn btn-default">
                     Count<span class="badge"><%=cnt%></span>
                  </button>

                  <button type="button" class="btn btn-default">
                     BlindCount<span class="badge"><%=bcnt%></span>
                  </button>
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
</body>
</html>