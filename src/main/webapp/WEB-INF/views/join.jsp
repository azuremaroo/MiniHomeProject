<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login">로그인</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid bg-1 text-center" >
  <h1 class="margin"  style="font-size:0.9cm; font-weight: bold ;color:#555555;">MINIHOME 회원가입</h1>
      <h2 >프로필 입력</h2>
      <hr>
      
    	<form action="join" method="POST">
      <h2 >아이디</h2> <input style="color: black;" type="text" name="m_id" >
      <h2>비밀번호</h2> <input style="color: black;" type="password" name="m_pw" >
      <h2>이름</h2> <input style="color: black;" type="text" name="m_name" >
      <h2>전화번호</h2> <input style="color: black;" type="text" name="m_phone" >
      <h2>생일</h2> <input style="color: black;" type="text" name="m_birth" >
    	<div class="container-fluid bg-1 text-center">  
   			 <input  style="color: black;" type="submit" value="작성완료" >
 		</div>
		</form>


</div>


<footer class="container-fluid bg-4 text-center">
 <a href="">www.MINIHOME.com</a></p> 
</footer>



	

</body>
</html>