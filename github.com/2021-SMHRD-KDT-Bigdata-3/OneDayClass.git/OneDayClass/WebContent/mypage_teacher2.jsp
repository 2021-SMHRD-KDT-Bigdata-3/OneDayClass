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
					<br>
					<table border="1" bordercolor="#FEA698" width="150%" height="200%" cellspacing="100">
                    <thead>
                    <tr align="center" bgcolor="white">
                    <th>���̵�</th>
                    <th>�̸�</th>
                    <th>����</th>
                    <th>ī�װ�</th>
                    <th>��¥</th>
                    <th></th>
               		</tr>
           		    </thead>
		            <tbody>
        	        <tr align="center" bgcolor="white">
                    <td>smart</td>
                    <td>������</td>
                    <td>��ȹ�Ѱ�</td>
                    <td>JAVA</td>
                    <td>2021/06/18</td>
                    <td> <input type="button" class="site-btn3" id="cancel" value="���� ���"></td>   
            	    </tr>
               		<tr align="center" bgcolor="white">
                    <td>develop</td>
                    <td>������</td>
                    <td>�����Ѱ�</td>
                    <td>PYTHON</td> 
                    <td>2021/06/18</td>
                    <td><input type="button" class="site-btn3" id="cancel" value="���� ���"></td>
                </tr>
            </tbody>
        </table>
        <br>
        <input type="button" class="site-btn4" id="enroll" value="���� ���" onClick="location.href='mypage_teacher3.jsp'"> &nbsp; 
        <input type="button" class="site-btn4" id="enroll" value="ȸ�� Ż��" onClick="location.href='main.jsp'" >
						</form>
					</div>
				</div>
	</section>
</body>
</html>