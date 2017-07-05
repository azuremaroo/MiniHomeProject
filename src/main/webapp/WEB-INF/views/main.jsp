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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>나의 미니홈피</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<style>
@import
	url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

li {
	margin: 5px 0 0 0;
}

ul.nav2 li a {
	-webkit-transition: all 0.3s ease-out;
	background: #cbcbcb url(images/border.png) no-repeat;
	color: #174867;
	padding: 7px 15px 7px 15px;
	-webkit-border-top-right-radius: 15px;
	-webkit-border-bottom-right-radius: 15px;
	width: 100px;
	display: block;
	text-decoration: none;
	-webkit-box-shadow: 1px 1px 4px #888;
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

header, footer {
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

table, th, td {
	border: 1px solid honeydew;
	border-collapse: collapse;
	color: #2f2f2f;
}
</style>


</head>








<body>

	<!-- 윗부분-->
	<nav class="navbar navbar-default">

	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNavbar">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"
			style="font-family: 'Nanum Gothic Coding', serif; font-size: 0.9cm; font-weight: bold; color: palevioletred;">MINIHOME</a>
	</div>
	<div class="collapse navbar-collapse" id="myNavbar">
		<c:if test="${loginMember.m_id == null }">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login">로그인</a></li>
				<li><a href="join">회원가입</a></li>
			</ul>
		</c:if>
		<c:if test="${loginMember.m_id != null }">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">이웃추가</a></li>
				<li><a href="#">이웃리스트</a></li>
				<li><a href="logout">로그아웃</a></li>
				<li><a href="./myPage">회원정보수정</a></li>
			</ul>
		</c:if>
	</div>

	</nav>
	<!-- 윗부분끝-->

	<div >
		<h1 class="text-center">
			나의 미니홈피 <a href="#" class="close" data-dismiss="alert"
				aria-label="close">×</a>
		</h1>
	</div>

	<div class="container2" style="max-width: 1800px; height: 800px;">

		<div class="col-sm-2 navbar-right" style="width: 10%">
			<div class="navbox">
				<ul class="nav nav2">
					<li><a href="">홈</a></li>
					<li><a href="./p_board">사진첩</a></li>
					<li><a href="">동영상</a></li>
					<li><a href="">방명록</a></li>
					<li><a href="">관리</a></li>
				</ul>
			</div>
		</div>


		<div class="container" style="max-width: 1480px; height: 800px;">
			<div class="col-sm-3 well">
				<div class="well">
					<p>
						<a href="#">${m_id}</a>
					</p>
					<img src="img/aaa.jpg" class="img-circle" height="65" width="65"
						alt="Avatar">
				</div>
				<div class="alert alert-success fade in">

					<p>
						<strong>session id : ${loginMember.m_id}</strong>
					</p>
					${loginMember.m_intro}
					<form method='post'>
						<input type="text" name='m_intro'> <input type='submit'
							value='프로필 작성 완료' name='intro_button'> <input
							type="hidden" name='m_id' value="${loginMember.m_id }">
					</form>
				</div>
			</div>

			<p class="text-left" style="color: royalblue">update news</p>

			<div class="col-sm-7">

				<div class="row panel-body col-sm-12 text-left">

					<table style="width: 130%">
						<tr>
							<th style="color: deeppink">최근 게시글 리스트</th>
							<th style="color: deeppink">게시글수</th>
						</tr>
						<tr>
							<td style="color: gray;">최신글</td>
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

				</div>

				<div class="row">
					<div class="col-sm-40">
						<p class="text-left" style="color: royalblue">photto story</p>
						<div class="well1" style="padding: 50px; align: center">
							<img src="bandmember.jpg" class="img-circle" height="100"
								width="100" alt="Avatar"> <img src="bandmember.jpg"
								class="img-circle" height="100" width="100" alt="Avatar">
							<img src="bandmember.jpg" class="img-circle" height="100"
								width="100" alt="Avatar"> <img src="bandmember.jpg"
								class="img-circle" height="100" width="100" alt="Avatar">
							<img src="bandmember.jpg" class="img-circle" height="100"
								width="100" alt="Avatar"> <img src="bandmember.jpg"
								class="img-circle" height="100" width="100" alt="Avatar">
							<img src="bandmember.jpg" class="img-circle" height="100"
								width="100" alt="Avatar"> <img src="bandmember.jpg"
								class="img-circle" height="100" width="100" alt="Avatar">
							<img src="bandmember.jpg" class="img-circle" height="100"
								width="100" alt="Avatar"> <img src="bandmember.jpg"
								class="img-circle" height="100" width="100" alt="Avatar">
							<img src="bandmember.jpg" class="img-circle" height="100"
								width="100" alt="Avatar"> <img src="bandmember.jpg"
								class="img-circle" height="100" width="100" alt="Avatar">
							<img src="bandmember.jpg" class="img-circle" height="100"
								width="100" alt="Avatar"> <img src="bandmember.jpg"
								class="img-circle" height="100" width="100" alt="Avatar">
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