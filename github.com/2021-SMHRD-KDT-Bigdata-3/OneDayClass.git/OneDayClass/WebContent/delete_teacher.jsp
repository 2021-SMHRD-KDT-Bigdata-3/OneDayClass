<%@page import="DTO.TEACHERSDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body> 
<% TEACHERSDTO teacher = (TEACHERSDTO)session.getAttribute("login"); %>
	<section class="contact-page spad pb-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="contact-form-warp">
						<div class="section-title text-white text-left">
							<h2>ȸ�� Ż��</h2>
							<h4>��ȸ�� Ż�� �� ȸ�� ������ ������ �Ұ����մϴ�.��</h4>
						</div>
						<form action="TEACHERS_delete" class="contact-form" method="post"> 
							<h3>���̵� Ȯ�����ּ���</h3>
							<br> <input type="password" class="pw" name="id" value=<%=teacher.getTeacher_id() %>>
							<h3>��й�ȣ�� �Է����ּ���</h3>
							<br> <input type="password" class="pw" name="pw">
							<input type="button" class="site-btn4" id="main" value="��������" onClick="location.href='main.jsp'">
							<input type="submit" class="site-btn4"  value="ȸ�� Ż��">
							<br><br> 	
						</form>							
					</div>
				</div>
	</section>
</body>
</html>