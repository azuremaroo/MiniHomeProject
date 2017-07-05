<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진 게시판</title>

<!-- 시작 : 필요한 외부파일 임포트문 -->

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />

<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<!-- 끝 : 필요한 외부파일 임포트문 -->

<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>



</head>
<body>

	<form id='registerForm' role="form" method="post">
		<div class="fileDrop"></div>
		<div>
			<hr>
		</div>

		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<!-- DBloadedList 클래스 : JSON 방식으로 읽어온 데이터를 뿌릴 부분 -->
	<ul class="mailbox-attachments clearfix DBloadedList"></ul>


	<!-- 시작 : 첨부파일의 화면처리를 위한 템플릿 -->

	<!-- 만들어진 자바스크립트 소스 파일을 삽입하는 코드 2줄 -->
	<script type="text/javascript">
		function checkImageType(fileName) {

			var pattern = /jpg|gif|png|jpeg/i;

			return fileName.match(pattern);

		}

		function getFileInfo(fullName) {

			var fileName, imgsrc, getLink;

			var fileLink;

			if (checkImageType(fullName)) {
				imgsrc = "/minihome/p_board/displayFile?fileName=" + fullName;
				fileLink = fullName.substr(14);

				var front = fullName.substr(0, 12); // 이부분을 의미함 : /2015/07/01/ 
				var end = fullName.substr(14);

				getLink = "/minihome/p_board/displayFile?fileName=" + front
						+ end;

			} else {
				imgsrc = "/resources/dist/img/file.png";
				fileLink = fullName.substr(12);
				getLink = "/minihome/p_board/displayFile?fileName=" + fullName;
			}
			fileName = fileLink.substr(fileLink.indexOf("_") + 1);

			return {
				fileName : fileName,
				imgsrc : imgsrc,
				getLink : getLink,
				fullName : fullName
			};

		}
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


	<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
	</script>
	<!-- 끝 : 첨부파일의 화면처리를 위한 템플릿 -->



	<script>
		// 화면처리를 위한 템플릿 html 코드를 컴파일하여 변수에 저장
		var template = Handlebars.compile($("#template").html());

		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;

			var file = files[0];

			console.log("file------------------");
			console.log(file);

			var formData = new FormData();

			formData.append("file", file);

			$.ajax({
				url : '/minihome/p_board/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {

					var fileInfo = getFileInfo(data);

					var html = template(fileInfo);

					$(".uploadedList").append(html);
				}
			});
		});

		// 게시물을 등록할 때 업로드된 이미지 파일의 이름들을 같이 전달하기 위한 처리(input type='hidden' 태그를 생성하여 전달)
		$("#registerForm").submit(
				function(event) {
					event.preventDefault();

					var that = $(this);

					var str = "";
					$(".uploadedList .delbtn").each(
							function(index) {
								str += "<input type='hidden' name='files["
										+ index + "]' value='"
										+ $(this).attr("href") + "'> ";
							});

					that.append(str);

					that.get(0).submit();
				});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {

			var pbm_no = ${pbm_no};
			console.log("console----------------------1");
			console.log(pbm_no);

			// HTTP GET 방식 요청을 통해 서버로부터 받은 JSON데이터를 로드하는 메소드
			// $.getJSON(url, callback){}
			$.getJSON("/minihome/p_board/"+pbm_no, function(list) {
				
				console.log("getJSON function start--------------");
				
				console.log("console----------------------2");
				console.log(this);

				// $(순회할 배열이나 객체).each(각 요소를 대상으로 실행할 callback 함수
				$(list).each(function() {

					// getFileInfo(file) : file의 정보를 담은 객체를 리턴하는 메소드
					// this : 이벤트가 발생한 요소의 정보가 담긴 객체(이미지 파일의 fullname이 String 타입 저장됨)
					// fileInfo : 선택된 이미지파일의 정보를 담은 객체
					var fileInfo = getFileInfo(this);
					
					console.log("console----------------------3");
					console.log(fileInfo);
					console.log(this);
					

					// template(fileInfo) : 이미지 파일의 정보가 담긴 객체를 읽어 지정된 html 태그 사이에 배치하고 수정된 html 태그를 리턴하는 메소드
					var html = template(fileInfo);

					// .append(html) : 지정된 요소(.uploadedList) 끝에 지정된 내용(html)을 삽입하는 메소드
					$(".DBloadedList").append(html);

				});
			});
		});
	</script>








</body>
</html>