<%@page import="DTO.CLASSDTO"%>
<%@page import="DAO.CLASSDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	CLASSDAO c_dao =  new CLASSDAO();
	int class_id = Integer.parseInt(request.getParameter("class_id"));
	
	CLASSDTO c_dto = c_dao.allselect(class_id);
%>
<fieldset>
<legend>���� ��</legend>
<form>
<table>
	<tr>
		<td>Ŭ������ȣ</td>
		<td><%=c_dto.getId() %></td>
	</tr>
	<tr>
		<td>�����</td>
		<td><%=c_dto.getTeacher_id() %></td> 
	</tr>
	<tr>
		<td>����</td>
		<td><%=c_dto.getContent() %></td>
	</tr>
	<tr>
		<td>�ð�</td>
		<td><%=c_dto.getTime() %></td>
	</tr>
	<tr>
		<td>���</td>
		<td><%=c_dto.getPrice() %></td>
	</tr>
	<tr>
		<td>ī�װ�</td>
		<td><%=c_dto.getCategory() %></td>
	</tr>
	<tr>
		<td>�̹���</td>
		<td> <img alt="���� �ȵ���" src=<%=c_dto.getImage() %>> </td>
		
	</tr>
	





</table>
</form>
</fieldset>
</body>
</html>