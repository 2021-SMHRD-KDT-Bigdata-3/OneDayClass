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
		.table2{
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
						<div class="section-title text-white text-left">
							<h2>�������� ����</h2>
							<p style="font-size:20px;">������ ������Ŭ���� ���� ������ ���� ��Ȯ�� ������ �Է����ּ���.</p>
							</div>
							<form action="TEACHERS_update" class="contact-form" style="width:680px;"> 
							<table class="table1" style="width: 500px">
							<tr><td colspan='2'><h3>������ ����</h3></td></tr>
							<tr height="20px"></tr>
							<tr><td><h5>���̵�</h5></td><td><h5>��й�ȣ</h5></td></tr>
							<tr height="10px"></tr>
							<tr><td><input disabled="disabled" type="text" class="id" value=<%=teacher.getTeacher_id() %> name="id" style="width:290px;"> </td>
								<td><input type="password" class="pw" value=<%=teacher.getTeacher_pw() %> name="pw" style="width:290px;"></td>
							</tr>
							<tr></tr>	
							<tr><td><h5>�̸�</h5></td><td><h5>��ȭ��ȣ</h5></td></tr>
							<tr height="10px"></tr>
							<tr><td><input disabled="disabled" type="text" class="name" value=<%=teacher.getTeacher_name() %> name="name" style="width:290px;"></td>
								<td><input disabled="disabled" type="text" class="name" value=<%=teacher.getTel() %> name="name" style="width:290px;"></td>
							</tr>
							<tr><td colspan='2'><h5>�ּ�</h5></td></tr>
							<tr height="10px"></tr>
							<tr><td colspan='2'><input type="text" class="address" value="<%=teacher.getTel() %>" name="address" style="width:595px;"></td></tr>
							</table>
							<div style="margin: auto; width: 50%;">
								<input type="submit" class="site-btn4" id="edit" value="���� �Ϸ�" style="margin: auto;">
								<input type="button" class="site-btn4" id="enroll" value="���� ���" onClick="location.href='mypage_teacher2.jsp'" style="margin: auto;">
							</div>
						</form>
						<br>
					<h3>���� ���� ����</h3>
					<br>
					<table class="table2" style="width:660px;">
                    <thead>
                    <tr align="center" bgcolor="white" style="font-size: 15px;">
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
        <br>
		<form action="delete_teacher.jsp" method="post">
		<input type="button" class="site-btn4" id="main" value="��������" onClick="location.href='main.jsp'" style="margin: auto; left:180px;">
		<input type="submit" class="site-btn4" value="ȸ�� Ż��" style="margin: auto; left:180px;">
		</form>
		</div>
		</div>
		</div>
		</div>
		</section>
		
</body>
</html>