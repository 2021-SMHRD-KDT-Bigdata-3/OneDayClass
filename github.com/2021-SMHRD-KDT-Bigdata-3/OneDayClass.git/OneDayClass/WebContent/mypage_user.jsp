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
							<h2>�������� ����</h2>
							<p>������ ������Ŭ���� ���� ��õ�� ���� ��Ȯ�� ������ �Է����ּ���</p>
						</div>
						<form action="USERS_update" class="contact-form"> 
							<h3>������ ����</h3>
							<br> <input disabled="disabled" type="text" class="id" value=<%=user.getId() %> name="id">
							<input type="password" class="pw" value=<%=user.getPw() %> name="pw">
							<input disabled="disabled" type="text" class="name" value=<%=user.getName() %> name="name"> 
							<input type="text" class="address" value=<%=user.getAddress() %> name="address"> 
							 <input type="submit" class="site-btn4" id="edit" value="���� �Ϸ�">
							 <input type="button" class="site-btn4" id="survey" value="���� �м�" onClick="location.href='hobby_survey.jsp'">
							 <br><br> 
							<h3>���� ���� ����</h3>
							<br>
					<div class="tableone">
					<table width="600px">
                   	<thead>
                    <tr align="center" bgcolor="white" style="font-size: 15px;">
                    <th>���� �̸�</th>
                    <th>���� ����</th>
                    <th>���� ����</th>
                    <th>���� ��¥</th>
                    <th></th>
               		</tr>
           		    </thead>
		            <tbody>
       	   			<tr align="center" bgcolor="white" style=>
                    <td>smart</td>
                    <td>������ �м����� <br> �����ڰ���</td>
                    <td>���̽� Ȱ���� ������ <br> ũ�Ѹ� �� �ӽŷ���</td>
                    <td>2021/06/22</td>
                    <td> <input type="button" class="site-btn3" id="cancel" value="���� ���"></td>   
            		</tr>
               		<tr align="center" bgcolor="white">
                    <td>develop</td>
                    <td>�ΰ����� ���ռ��� <br> �����ڰ���</td>
                    <td>���̽� Ȱ���� ������ <br> ũ�Ѹ� �� ������ </td>
                    <td>2021/06/22</td>
                    <td><input type="button" class="site-btn3" id="cancel" value="���� ���"></td>
                </tr>
                </tbody>
       			</table>
				</form>
				<br>
				<form action="delete_page.jsp" method="post">
				<input type="submit" class="site-btn4" value="ȸ��Ż��">
				</form>
				</section>
</body>
</html>
</html>