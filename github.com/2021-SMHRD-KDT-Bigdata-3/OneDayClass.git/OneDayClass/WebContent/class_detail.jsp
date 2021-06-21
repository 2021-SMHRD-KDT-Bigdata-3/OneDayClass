<%@page import="DTO.TEACHERSDTO"%>
<%@page import="DAO.TEACHERSDAO"%>
<%@page import="DTO.CLASSDTO"%>
<%@page import="DAO.CLASSDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/font-awesome.min.css" />
	<link rel="stylesheet" href="css/owl.carousel.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style2.css" />
	<link rel="stylesheet" href="css/style3.css" />
<title>Insert title here</title>
<style>
		.tabletwo > table tr{
			height: 30px;
		} 

		.table_content{
			
			border: 3px solid #FEA698;
			border-collapse: separate;
			border-radius: 12px;
			padding:10px;
			max-width : 30%;
			margin: auto;
		
		}
		th {
        color : #0D3B66;
        font-size : 20px;
        
      }
      td.teacher {
        color : #0D3B66;
        font-size : 16px;
        font-weight: bold;
      }
      td {
        color : #0D3B66;
        font-size : 16px;
        
      }
      th.title{
      	font-size : 24px;
      	color: indianred;
      }
	</style>
</head>
<body>
<% 
	CLASSDAO c_dao =  new CLASSDAO();
	int class_id = Integer.parseInt(request.getParameter("class_id"));
	TEACHERSDAO t_dao = new TEACHERSDAO();
	CLASSDTO c_dto = c_dao.allselect(class_id);
	//CLASSDTO c_dto = new CLASSDTO(1, "1", "������", "����", "�ð�", "���", "ī�װ�", "�̹���");
	
%>

<form action='#' method="post">
<br>
<div class="home">
<a href="main.jsp"><img style="width:60px; height:60px;" class = "home-logo" src="img/home_btn.png"></a>
</div>
<br>
<div class = "tabletwo">
<table class = 'table_content'>
<colgroup>
<col style="width:30%;">
<col style="width:70%;">
</colgroup>
	<tr>
	<td colspan = '2'>
	<img alt="���� �ȵ���" src=<%=c_dto.getImage() %>></td>
	</tr>

	<tr bgcolor="white">
	<th colspan = '2'><%=c_dto.getCategory() %></th>
	</tr>

	<tr>
	<th class ='title' colspan = '2'><%=c_dto.getTitle() %></th>
	</tr>
	
	<tr align="right" bgcolor="white">
		
		<td class = 'teacher' colspan = '2' ><%=t_dao.who(c_dto.getTeacher_id()) %> ����</td> 
	</tr>
	<tr>
	<td colspan = "2"><hr style = "border: 1px solid #FEA698;"></td>

	</tr>
	
	<tr align="center" bgcolor="white">
		<td colspan = "2" style = "font-weight: bold;">���� �Ұ�</td>
		
	</tr>
	<tr><td colspan = "2"><%=c_dto.getContent() %></td></tr>

	<tr align="center" bgcolor="white">
		<td style = "font-weight: bold;">�ð�</td>
		<td><%=c_dto.getTime() %></td>
	</tr>

	<tr align="center" bgcolor="white">
		<td style = "font-weight: bold;">���</td>
		<td><%=c_dto.getPrice() %></td>
	</tr>
	<tr></tr>
	<tr><td colspan = "2" align = "center">
	<input type="submit" class="site-btn" name="apply" value="Ŭ���� ��û�ϱ�" >
	
	</td></tr> 
	</table>
</div>

</form>
	<script>
		// Ŭ���� ��û��ư Ŭ��-> �α������̸� DB�� ���� ����ֱ� �ƴϸ� �α����ϰ��ϱ�
		
	
	
	</script>


</body>
</html>