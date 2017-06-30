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
/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

@import
	url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

body {
	font: 20px Montserrat, sans-serif;
	line-height: 1.8;
	color: #f5f6f7;
}

.bg-4 {
	background-color: #2f2f2f; /* Black Gray */
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
}

.navbar-nav  li a:hover {
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
</style>


</head>








<body>

	<!-- 윗부분-->
	<nav class="navbar navbar-default">
	<div class="container">
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
					<li><a href="#">회원정보수정</a></li>
				</ul>
			</c:if>
		</div>
	</div>
	</nav>
	<!-- 윗부분끝-->

	<div class="container text-center">
		<div class="row">
			<div class="col-sm-3 well">
				<div class="well">
					<p>
						<a href="#">${m_id}</a>
					</p>
					<img src="img/aaa.jpg" class="img-circle" height="65" width="65"
						alt="Avatar">
				</div>
				<div class="well">
					<p>
						<a href="#">Interests</a>
					</p>
					<p>
						<span class="label label-default">News</span> <span
							class="label label-primary">W3Schools</span> <span
							class="label label-success">Labels</span> <span
							class="label label-info">Football</span> <span
							class="label label-warning">Gaming</span> <span
							class="label label-danger">Friends</span>
					</p>
				</div>
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
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
				<p>
					<a href="#">Link</a>
				</p>
				<p>
					<a href="#">Link</a>
				</p>
				<p>
					<a href="#">Link</a>
				</p>
			</div>
			<div class="col-sm-7">

				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default text-left">
							<div class="panel-body">
								<p contenteditable="true">Status: Feeling Blue</p>
								<button type="button" class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-thumbs-up"></span> Like
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>John</p>
							<img src="bird.jpg" class="img-circle" height="55" width="55"
								alt="Avatar">
						</div>
					</div>
					<div class="col-sm-9">
						<div class="well">
							<p>Just Forgot that I had to mention something about someone
								to someone about how I forgot something, but now I forgot it.
								Ahh, forget it! Or wait. I remember.... no I don't.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>Bo</p>
							<img src="bandmember.jpg" class="img-circle" height="55"
								width="55" alt="Avatar">
						</div>
					</div>
					<div class="col-sm-9">
						<div class="well">
							<p>Just Forgot that I had to mention something about someone
								to someone about how I forgot something, but now I forgot it.
								Ahh, forget it! Or wait. I remember.... no I don't.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>Jane</p>
							<img src="bandmember.jpg" class="img-circle" height="55"
								width="55" alt="Avatar">
						</div>
					</div>
					<div class="col-sm-9">
						<div class="well">
							<p>Just Forgot that I had to mention something about someone
								to someone about how I forgot something, but now I forgot it.
								Ahh, forget it! Or wait. I remember.... no I don't.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>Anja</p>
							<img src="bird.jpg" class="img-circle" height="55" width="55"
								alt="Avatar">
						</div>
					</div>
					<div class="col-sm-9">
						<div class="well">
							<p>Just Forgot that I had to mention something about someone
								to someone about how I forgot something, but now I forgot it.
								Ahh, forget it! Or wait. I remember.... no I don't.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-2 well">
				<div class="thumbnail">
					<p>Upcoming Events:</p>
					<img src="paris.jpg" alt="Paris" width="400" height="300">
					<p>
						<strong>Paris</strong>
					</p>
					<p>Fri. 27 November 2015</p>
					<button class="btn btn-primary">Info</button>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
	<p>Footer Text</p>
	</footer>





</body>
</html>