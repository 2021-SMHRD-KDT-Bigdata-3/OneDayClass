<%@page import="DTO.USERSDTO"%>
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
<% USERSDTO user = (USERSDTO)session.getAttribute("login"); %>
	<section class="contact-page spad pb-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="contact-form-warp">
						<div class="section-title text-white text-left">
							<h2>ȸ�� Ż��</h2>
							<h4>��ȸ�� Ż�� �� ȸ�� ������ ������ �Ұ����մϴ�.��</h4>
						</div>
						<form action="USERS_delete" class="contact-form" method="post"> 
							<h3>���̵� �Է����ּ���</h3>
							<br> <input type="text" class="pw" name="id">
							<h3>��й�ȣ�� �Է����ּ���</h3>
							<br> <input type="password" class="pw" name="pw">
				
							 <input type="submit" class="site-btn4"  value="ȸ�� Ż��">
							 <br><br> 
													
						</form>							
					</div>
				</div>
	</section>
</body>
</html>