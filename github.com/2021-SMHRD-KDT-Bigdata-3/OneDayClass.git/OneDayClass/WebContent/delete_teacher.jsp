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

<h1>ȸ��Ż��</h1>
<h3>Ż���Ͻø� �������մϴ�</h3>
<form action="TEACHERS_delete" method="post">
���̵� �Է��ϼ���<input type="text" name="id">
��й�ȣ�� �Է��ϼ���<input type="text" name="pw">	
<input type="submit" value="Ż��">
</form>
</body>
</html>