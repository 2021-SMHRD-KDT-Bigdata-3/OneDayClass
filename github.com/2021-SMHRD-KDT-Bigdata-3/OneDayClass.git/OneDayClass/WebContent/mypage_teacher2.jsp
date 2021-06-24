<%@page import="DTO.TEACHERSDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/font-awesome.min.css" />
	<link rel="stylesheet" href="css/owl.carousel.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style2.css" />
	<link rel="stylesheet" href="css/style3.css" />
</head> 
<body>	
	<% TEACHERSDTO teacher = (TEACHERSDTO)session.getAttribute("login"); %>	
	<section class="contact-page spad pb-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="contact-form-warp">
						<div class="section-title text-white">
						<h2>����������</h2>
						<p>������Ŭ���� ���� ������ ���� ������ �Է����ּ���</p>
						</div>
						
						<form action="CLASS_insert" class="contact-form" method="post"  enctype="multipart/form-data">
						<h4>���� ���</h4>
						<br>
						<select name="category" style="width:250px; height:50px;">
                        <option value="category">������ ���� ����</option>
                        <option value="sport">�</option>
                        <option value="food">�丮</option>
                        <option value="certification">�ڰ���</option>
                        <option value="music">����</option>
                        <option value="arts">����</option>
                        <option value="beautys">�м�/��Ƽ</option>
                        <option value="medias">����/����</option>
                        <option value="finance">����ũ</option>
                        </select>
						<input disabled="disabled" type="text" class="name" value=<%=teacher.getTeacher_name() %> name="name" style="width:250px; height:50px;"> 
						<input name="title" type="text" class="class_id" placeholder="���� �̸��� �Է��ϼ���" style="width:505px; height:50px;">
						<input name="time" type="text" class="class_id" placeholder="�ð� �Է� : 00�� 00�� (����) 00:00 ~ 00:00" style="width:505px; height:50px;">
						<input name="price" type="text" class="class_id" placeholder="��� : 00�� / �� 0ȸ / 0�ð�" style="width:505px; height:50px;">
						<textarea name="content" placeholder="���� ������ �Է��ϼ���" style="width:505px; height:300px;"></textarea>
						<div id="inputFile">
						<label class="site-btn3" for="input-file">���� ÷��</label>
						<input type="file" id="input-file" name="img">
						</div>
						<br>
						<input type="submit" class="site-btn4" id="enroll2" value="��� �Ϸ�">
						<input type="button" class="site-btn4" id="enroll3" value="��� ���" onClick="location.href='mypage_teacher.jsp'">
						</form>
					</div>
				</div>
	</section>
	<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		$('#input-file').change(function(){
			let img = $(this).val();
			let imgArr = [ ".jfif", ".bmp", ".gif", ".png", ".jpeg", ".tif", ".tiff", ".jpg"];
			let result = 0;
			for(let i = 0; i < imgArr.length; i++){
				if($(this).val().indexOf(imgArr[i]) != -1){
					result += 1
				}
			}
			if(result > 0){
				console.log($(this).val());
				$('#inputFile').append("<span>" + img + "</span>");
				console.log(img);
			}else{
				alert("�̹��� ���ϸ� �÷��ּ���.");
				$(this).val("");
			}
		});
	</script>
	
</body>
</html>