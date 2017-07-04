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

	<form id='registerForm' role="form" method="post" >
		<div class="fileDrop"></div>
		<div>
			<hr>
		</div>

		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>


	<!-- 시작 : 첨부파일의 화면처리를 위한 템플릿 -->
	
		<!-- 만들어진 자바스크립트 소스 파일을 삽입하는 코드 2줄 -->
		<script type="text/javascript" >
		function checkImageType(fileName){
			
			var pattern = /jpg|gif|png|jpeg/i;
			
			return fileName.match(pattern);

		}

		function getFileInfo(fullName){
				
			var fileName,imgsrc, getLink;
			
			var fileLink;
			
			if(checkImageType(fullName)){
				imgsrc = "/minihome/p_board/displayFile?fileName="+fullName;
				fileLink = fullName.substr(14);
				
				var front = fullName.substr(0,12); // 이부분을 의미함 : /2015/07/01/ 
				var end = fullName.substr(14);
				
				getLink = "/minihome/p_board/displayFile?fileName="+front + end;
				
			}else{
				imgsrc ="/resources/dist/img/file.png";
				fileLink = fullName.substr(12);
				getLink = "/minihome/p_board/displayFile?fileName="+fullName;
			}
			fileName = fileLink.substr(fileLink.indexOf("_")+1);
			
			return  {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
			
		}
		</script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	

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









</body>
</html>