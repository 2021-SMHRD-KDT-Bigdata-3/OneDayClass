<%@page import="DTO.TEACHERSDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="EUC-KR">
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
						<div class="section-title text-white text-left">
							<h2>�������� ����</h2>
							<p>������ ������Ŭ���� ���� ������ ���� ��Ȯ�� ������ �Է����ּ���</p>
						</div>
						<form action="TEACHERS_update" class="contact-form">
							<h3>���� ����</h3>
							<br> <input disabled="disabled" type="text" class="id" value=<%=teacher.getTeacher_id() %> name="id">
							<input type="password" class="pw" value=<%=teacher.getTeacher_pw() %> name="pw">
							<input disabled="disabled" type="text" class="name" value=<%=teacher.getTeacher_name() %> name="name"> 
							<input type="text" class="tel" value=<%=teacher.getTel() %> name="tel"> 
							 <input type="submit" class="site-btn" id="edit" value="���� �Ϸ�"> <br> <br>
							<h3>���� ���� ����</h3>
							<br> <input type="text" class="class_id"
								placeholder="���� ���̵� ǥ�� �ڵ�"> <input type="text"
								class="class_name" placeholder="���� �̸� ǥ�� �ڵ�"> <input
								type="text" class="class_title" placeholder="���� ���� ǥ�� �ڵ�">
							<input type="text" class="class_date"
								onfocus="(this.type = 'date')" placeholder="���� ��¥ ǥ�� �ڵ�">
							<input type="button" class="site-btn" id="main" value="��������"
								onClick="location.href='main.jsp'">
						</form>
					</div>
				</div>
	</section>
</body>
</html>