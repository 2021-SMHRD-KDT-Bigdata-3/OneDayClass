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
	
	<style>
		.tableone > table tr{
			height: 30px;
		}
		.tableone > table{
			width:600px;
			border: 2px solid #FEA698;
			border-collapse: separate;
			border-radius: 12px;
			padding:10px;
			color:#424242;
		}
	</style>
</head>
<body>	
	<% //TEACHERSDTO teacher = (TEACHERSDTO)session.getAttribute("login");
	TEACHERSDTO teacher = new TEACHERSDTO("123","123","123","123");
	%>	
	<section class="contact-page spad pb-0">
		<div class="container" >
			<div class="row">
				<div class="col-lg-8">
					<div class="contact-form-warp">
<<<<<<< HEAD
						<div class="section-title text-white text-left">
						<h2>����������</h2>
							<p>���� ������ �����ϰ� ���� ������ Ȯ���ϼ���</p>
=======
						<div class="section-title text-white" >
							<h2>�������� ����</h2>
							<p>������ ������Ŭ���� ���� ������ ���� ��Ȯ�� ������ �Է����ּ���</p>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-Bigdata-3/OneDayClass.git
						</div>
						<form action="TEACHERS_update" class="contact-form">
<<<<<<< HEAD
						<h3>���� ����</h3>
						<br>
						<input disabled="disabled" type="text" class="id" value=<%=teacher.getTeacher_id() %> name="id">
						<input type="password" class="pw" value=<%=teacher.getTeacher_pw() %> name="pw">
						<input disabled="disabled" type="text" class="name" value=<%=teacher.getTeacher_name() %> name="name"> 
						<input type="text" class="tel" value=<%=teacher.getTel() %> name="tel"> 
						<input type="submit" class="site-btn4" id="edit" value="���� �Ϸ�"> 
						<input type="button" class="site-btn4" id="main" value="��������" onClick="location.href='main.jsp'">
						<br>
						<br>
						<h3>���� ����</h3>
						<br>
						<div class="tableone"><table border="2" bordercolor="#FEA698" width="150%" height="200%" cellspacing="100">
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
                    	<td><input type="button" class="site-btn3" id="cancel" value="���� ���"></td>   
            	    	</tr>
               			<tr align="center" bgcolor="white">
                    	<td>develop</td>
                    	<td>������</td>
                    	<td>�����Ѱ�</td>
                    	<td>PYTHON</td> 
                    	<td>2021/06/18</td>
                    	<td><input type="button" class="site-btn3" id="cancel" value="���� ���"></td>
                	</tr>
=======
							<h3>���� ����</h3>
							<br> <input disabled="disabled" type="text" class="id" value=<%=teacher.getTeacher_id() %> name="id">
							<input type="password" class="pw" value=<%=teacher.getTeacher_pw() %> name="pw">
							<input disabled="disabled" type="text" class="name" value=<%=teacher.getTeacher_name() %> name="name"> 
							<input type="text" class="tel" value=<%= teacher.getTel() %> name="tel"> 
							 <input type="submit" class="site-btn4" id="edit" value="���� �Ϸ�"> 
							 <input type="button" class="site-btn4" id="main" value="��������" onClick="location.href='main.jsp'">
								<br> <br>
					<h3>���� ����</h3>
					<br>
					<div class="tableone">
					<table>
                    <thead>
                    <tr align="center" bgcolor="white" >
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
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-Bigdata-3/OneDayClass.git
            </tbody>
        </table>
        </div>
         <br>
        <input type="button" class="site-btn4" id="enroll" value="���� ���" onClick="location.href='mypage_teacher2.jsp'">
        <input type="button" class="site-btn4" id="leave" value="ȸ�� Ż��" onClick="location.href='mypage_teacher3.jsp'">
							
						</form>
					</div>
				</div>
	</section>
</body>
</html>