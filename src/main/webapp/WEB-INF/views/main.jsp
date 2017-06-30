<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${loginMember.m_id == null }">
	<%
		response.sendRedirect("./login");
	%>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set black background color, white text and some padding */
    
    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
    ul.nav nav2 {
      list-style: none;
      display: block;
      width: 200px;
      position: relative;
      top: 100px;
      left: 100px;
      padding: 60px 0 60px 0;
      background: url(images/shad2.png) no-repeat;
      -webkit-background-size: 50% 100%;
    }
    
    li {
      margin: 5px 0 0 0;
    }
    
    ul.nav2 li a {
      -webkit-transition: all 0.3s ease-out;
      background: #cbcbcb url(images/border.png) no-repeat;
      color: #174867;
      padding: 7px 15px 7px 15px;
      -webkit-border-top-right-radius: 10px;
      -webkit-border-bottom-right-radius: 10px;
      width: 100px;
      display: block;
      text-decoration: none;
      -webkit-box-shadow: 2px 2px 4px #888;
    }
    
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
      color: #2f2f2f;
    }
    
    .bg-4 {
      background-color: #2f2f2f;
      /* Black Gray */
      color: #fff;
    }
    
    .navbar {
      padding-top: 15px;
      padding-bottom: 15px;
      border: 0;
      border-radius: 0;
      margin-bottom: 0;
      font-size: 12px;
      letter-spacing: 5px;
      background-color: #fff;
    }
    
    .navbar-nav li a:hover {
      color: #1abc9c !important;
    }
    
    div.container {
      width: 100%;
      border: 1px solid gray;
    }
    
    header,
    footer {
      padding: 1em;
      color: gray;
      background-color: white;
      clear: left;
      text-align: center;
    }
    
    nav ul {
      list-style-type: none;
      padding: 0;
    }
    
    nav ul a {
      text-decoration: none;
    }
    
    article {
      margin-left: 170px;
      border-left: 1px solid gray;
      padding: 1em;
      overflow: hidden;
    }
    
    table,
    th,
    td {
      border: 1px solid honeydew;
      border-collapse: collapse;
      color: #2f2f2f;
    }
  </style>
</head>

<body>

  <!-- 윗부분-->
  <nav class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="#" style="font-family: 'Nanum Gothic Coding', serif; font-size:0.9cm; font-weight: bold ;color:palevioletred;">MINIHOME</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#">이웃추가</a></li>
          <li><a href="#">이웃리스트</a></li>
          <li><a href="#">로그인</a></li>
          <li><a href="#">로그아웃</a></li>
          <li><a href="#">회원정보수정</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- 윗부분끝-->
  <div>
    <h1 class="container text-center">나의 미니홈피 <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a></h1>
  </div>
  <div class=" text-center">
    <div class="col-sm-2 navbar-right"style="width:12%">
      <div class="navbox">
        <ul class="nav nav2">
          <li><a href="">홈</a></li>
          <li><a href="">사진첩</a></li>
          <li><a href="">동영상</a></li>
          <li><a href="">방명록</a></li>
          <li><a href="">관리</a></li>
          <li><a href="">PHP</a></li>
        </ul>
      </div>
    </div>
    <div class="container"style="width:80%">
    <!-- <div class="row"> -->
    <div class="col-sm-3 well">
      <div class="well">
        <p><a href="#">이종석</a></p>
        <img src="img/aaa.jpg" class="img-circle" height="200" width="200" alt="Avatar">
      </div>
      <div class="alert alert-success fade in">
        <!--    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>-->
        <p><strong>session id : ${loginMember.m_id}</strong></p>
        People are looking at your profile. Find out who.
      </div>
    </div>
    <p  class="text-left" style="color:gray;" >update news</p>
    <div class="col-sm-7">
      <div class="row">
        <div class="col-sm-12">
          <div class="text-left">
            <div class="panel-body">
              <table style="width:130%">
                <tr>
                  <th>최근 게시글 리스트</th>
                  <th>게시글수</th>
                </tr>
                <tr>
                  <td style="color:gray;">최신글</td>
                  <td>사진첩</td>
                </tr>
                <tr>
                  <td>최신글</td>
                  <td>동영상</td>
                </tr>
                <tr>
                  <td>최신글</td>
                  <td>방명록</td>
                </tr>
              </table>
              <!--         <p contenteditable="true">Status: Feeling Blue</p>
              <button type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-thumbs-up"></span> Like
              </button>     
              <button type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-thumbs-up"></span> Like
              </button>   -->
            </div>
          </div>
        </div>
      </div>

      <!--  <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>John</p>
           <img src="bird.jpg" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Just Forgot that I had to mention something about someone to someone about how I forgot something, but now I forgot it. Ahh, forget it! Or wait. I remember.... no I don't.</p>
          </div>
        </div>
      </div> -->
      <div class="row">
        <div class="col-sm-9">
          <div class="well" style="padding:50px">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
            <img src="bandmember.jpg" class="img-circle" height="100" width="100" alt="Avatar">
          </div>
        </div>
      </div>
    </div>
    </div>
    
  </div>




  <footer class="container-fluid text-center">
    <p>Footer Text</p>
  </footer>

</body>

</html>