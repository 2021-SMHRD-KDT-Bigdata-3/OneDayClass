<%@page import="DTO.CLASSDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CLASSDAO"%>
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
		table{
			width:578px;
			border: 2px solid #FEA698;
			border-collapse: separate;
			border-radius: 12px;
			padding:10px;
		}
	</style>
</head>
<body>	
	<% 
	TEACHERSDTO teacher = (TEACHERSDTO)session.getAttribute("login");
	CLASSDAO c_dao = new CLASSDAO();
	ArrayList<CLASSDTO> classArray = c_dao.Select_class(teacher.getTeacher_id());
	%>	
	<section class="contact-page spad pb-0">
		<div class="container" >
			<div class="row">
				<div class="col-lg-8">
					<div class="contact-form-warp">
						<div class="section-title text-white" >
							<h2>�������� ����</h2>
							<p>������ ������Ŭ���� ���� ������ ���� ��Ȯ�� ������ �Է����ּ���</p>
							<br><br>
						<form action="delete_teacher.jsp" method="post" style="margin: auto; left:80%;">
						<input type="submit" class="site-btn4" value="ȸ��Ż��">
						</form>
						</div>
						<form action="TEACHERS_update" class="contact-form">
							<h5>���̵�</h5><input disabled="disabled" type="text" class="id" value=<%=teacher.getTeacher_id() %> name="id">
							<h5>��й�ȣ</h5><input type="password" class="pw" value=<%=teacher.getTeacher_pw() %> name="pw">
							<h5>�̸�</h5><input disabled="disabled" type="text" class="name" value=<%=teacher.getTeacher_name() %> name="name"> 
							<h5>��ȭ��ȣ</h5><input type="text" class="tel" value=<%= teacher.getTel() %> name="tel"> 
						</form>
						<br><br>
					<h4>���� ����</h4>
					<br>
					<table style="width:660px;">
                    <thead>
                    <tr align="center" bgcolor="white" style="font-size:16px;">
                    <th style="width:50px;">���̵�</th>
                    <th>����</th>
                    <th style="width:80px;">ī�װ�</th>
                    <th>����</th>
                    <th></th>
               		</tr>
           		    </thead>
		            <tbody>
       	   		<!-- <tr align="center" bgcolor="white">
                    <td>smart</td>
                    <td>��ȹ�Ѱ�</td>
                    <td>JAVA</td>
                    <td>2021/06/18</td>
                    <td> <input type="button" class="site-btn3" id="cancel" value="���� ���"></td>   
            	</tr>
               		<tr align="center" bgcolor="white">
                    <td>develop</td>
                    <td>�����Ѱ�</td>
                    <td>PYTHON</td> 
                    <td>2021/06/18</td>
                    <td><input type="button" class="site-btn3" id="cancel" value="���� ���"></td>
                </tr>
                 -->
                <%if(classArray != null) {%>
                <%for(int i = 0; i < classArray.size(); i++){ %>
                	
               		<tr align="center" bgcolor="white" style="font-size:18px;">
                    <td> <%=classArray.get(i).getId() %> </td>
                    <td> <%=classArray.get(i).getTitle() %> </td>
                    <td> <%=classArray.get(i).getCategory() %></td> 
              	    <td> <%=classArray.get(i).getPrice() %></td>
                    <td><input type="button" class="site-btn3" id="cancel" value="���� ���"></td>
                </tr>
                <%} }%>
            </tbody>
        </table>
        </div>
		<div style="text-align: center;">
        <input type="button" class="site-btn4" id="enroll" value="���� ���" onClick="location.href='mypage_teacher2.jsp'">&nbsp;
							 <input type="submit" class="site-btn4" id="edit" value="���� �Ϸ�"> &nbsp;
							 <input type="button" class="site-btn4" id="main" value="��������" onClick="location.href='main.jsp'">
					</div>
					</div>
				</div>
				</div>
				</section>
</body>
</html>