<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<<<<<<< HEAD
<title>추억의 미니홈피 로그인</title>
=======
<title>추억의 미니홈피 로그인 페이지</title>
>>>>>>> master

<style>
      

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
  body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
      color: #f5f6f7;
  }
  p {font-size: 16px;}
  .margin {margin-bottom: 45px;}
  .bg-1 { 
      background-color: #1abc9c; /* Green */
      color: #ffffff;
  }
  .bg-2 { 
      background-color: #474e5d; /* Dark Blue */
      color: #ffffff;
  }
  .bg-3 { 
      background-color: #ffffff; /* White */
      color: #555555;
  }
  .bg-4 { 
      background-color: #2f2f2f; /* Black Gray */
      color: #fff;
  }
  .container-fluid {
      padding-top: 70px;
      padding-bottom: 70px;
  }
  .navbar {
      padding-top: 15px;
      padding-bottom: 15px;
      border: 0;
      border-radius: 0;
      margin-bottom: 0;
      font-size: 12px;
      letter-spacing: 5px;
  }
  .navbar-nav  li a:hover {
      color: #1abc9c !important;
  }
  </style>


</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="" style="font-family: 'Nanum Gothic Coding', serif; font-size:0.9cm; font-weight: bold ;color:palevioletred;">MINIHOME</a>
      </div>
</nav>
<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin" style="font-size:1.5cm">로그인</h3>
 <form style="text-align:center;" method='post'>
    <br>
    아이디<input style="color: black;" type="text" name="m_id" >
비밀번호<input style="color: black;" type="text" name="m_pw" >
<input  style="color: #474e5d;" type="submit" value="로그인">
</form>
<p>${msg}</p> 
</div>
<div class="container-fluid bg-1 text-center">
     <form style="text-align:center;" >
    <input  style="color: #474e5d;" type="submit" value="아이디찾기">
    <input  style="color: #474e5d;" type="submit" value="비밀번호찾기">
    </form>
    
    
    <form  action="join" method="GET">
	<input  style="color: #474e5d;" type="submit" value="회원가입">
    </form> 
</div>

<footer class="container-fluid bg-4 text-center">
 <a href="">www.MINIHOME.com</a>
</footer>








	
	
	
</body>
</html>
