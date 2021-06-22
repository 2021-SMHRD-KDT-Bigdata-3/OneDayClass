<%@page import="DAO.CLASSDAO"%>
<%@page import="DTO.CLASSDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ENROLMENTDAO"%>
<%@page import="DTO.USERSDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
.tableone{
border:2px solid #FEA698;
}
.tableone> table th{
font-family:'NanumSquareRound';
color:#0D3B66;
}
.tableone> table td{
font-family:'NanumSquareRound';
color:#0D3B66;
}


</style>
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
	<% 
		CLASSDAO c_dao = new CLASSDAO();
		ENROLMENTDAO e_dao = new ENROLMENTDAO();
		ArrayList<CLASSDTO> c_arr = e_dao.allEnrolment(user.getId());
	%>
	<section class="contact-page spad pb-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="contact-form-warp">
						<div class="section-title text-white text-left">
							<h2>�������� ����</h2>
							<p style="font-size:20px;">������ ������Ŭ���� ���� ��õ�� ���� ��Ȯ�� ������ �Է����ּ���.</p>
						</div>
				<form action="delete_page.jsp" method="post">
				<input type="button" class="site-btn4" id="survey" value="���� �м�" onClick="location.href='hobby_survey.jsp'" style="margin: auto; left:60%">
				<input type="submit" class="site-btn4" value="ȸ�� Ż��" style="margin: auto; left:60%">
				</form>
				<br>
					<form action="USERS_update" class="contact-form" style="width:680px;"> 
							<table style="width: 500px">
							<tr><td colspan='2'><h3>������ ����</h3></td></tr>
							<tr height="20px"></tr>
							<tr><td><h5>���̵�</h5></td><td><h5>��й�ȣ</h5></td></tr>
							<tr height="10px"></tr>
							<tr><td><input disabled="disabled" type="text" class="id" value=<%=user.getId() %> name="id" style="width:290px;"> </td>
								<td><input type="password" class="pw" value=<%=user.getPw() %> name="pw" style="width:290px;"></td>
							</tr>
							<tr></tr>	
							<tr><td><h5>�̸�</h5></td><td><h5>��ȭ��ȣ</h5></td></tr>
							<tr height="10px"></tr>
							<tr><td><input disabled="disabled" type="text" class="name" value=<%=user.getName() %> name="name" style="width:290px;"></td>
								<td><input disabled="disabled" type="text" class="name" value=<%=user.getName() %> name="name" style="width:290px;"></td>
							</tr>
							<tr><td colspan='2'><h5>�ּ�</h5></td></tr>
							<tr height="10px"></tr>
							<tr><td colspan='2'><input type="text" class="address" value="<%=user.getAddress() %>" name="address" style="width:595px;"></td></tr>
															

							</table>
							<div style="margin: auto; width: 50%;">
								<input type="submit" class="site-btn4" id="edit" value="���� �Ϸ�" style="margin: auto; left:25%">
					
					
							</div>
					</form>
								<br>
							<h3>���� ���� ����</h3>
							<br>
					<div class="tableone">
					<table width="567px">
                   	<thead>
                    <tr align="center" bgcolor="white" style="font-size: 15px;">
                    <th>���� �̸�</th>
                    <th>���� ����</th>
                    <th>���� ���</th>
                    <th>���� ��¥</th>
                    <th></th>
               		</tr>
           		    </thead>
		            <tbody>
		            <%if(c_arr != null){  %>
		            <%for(int i = 0; i < c_arr.size(); i++){ %>
       	   			<tr align="center" bgcolor="white" style=>
                    <td><%=c_dao.findTeacher(c_arr.get(i).getTeacher_id()) %></td>
                    <td><%=c_arr.get(i).getTitle() %></td>
                    <td><%=c_arr.get(i).getPrice() %></td>
                    <td><%=c_arr.get(i).getTime() %></td>
                    <td> <input type="button" class="site-btn3" id="cancel" value="���� ���"></td>   
            		</tr>
            		<%} } %>
               		<tr align="center" bgcolor="white">
                    <td>develop</td>
                    <td>�ΰ����� ���ռ��� <br> �����ڰ���</td>
                    <td>���̽� Ȱ���� ������ <br> ũ�Ѹ� �� ������ </td>
                    <td>2021/06/22</td>
                    <td><input type="button" class="site-btn3" id="cancel" value="���� ���"></td>
                </tr>
                </tbody>
       			</table>
       			

				</div>
				<br>

				</section>
				
</body>
</html>
</html>