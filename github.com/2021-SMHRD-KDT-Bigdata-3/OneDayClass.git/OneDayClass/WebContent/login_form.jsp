<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/style2.css">
<link rel="stylesheet" href="css/font.css"/>
<style>
.selcet division{
height:40px;
width:250px;
}
</style>
</head>

<body width="100%" height="100%">
	<form action="login" method="post" class="loginForm" name = "search1">
		<h2 style="color:black;">�α���</h2>
		<select class="division" name="op">
			<option value="user" class="user" style="color:#323232;">�α��� ���¸� �����ϼ���</option>
			<option value="teacher" class="teacher">����</option>
			<option value="user" class="user">�Ϲ�</option>
		</select>
		<div class="idForm">
			<input type="text" class="id" placeholder="���̵� �Է��ϼ���" name="id" style="color:#323232;" >
		</div>
		<div class="passForm">
			<input type="password" class="pw" placeholder="��й�ȣ�� �Է��ϼ���" name="pw" style="color:#323232;">
		</div>
		
		<button type="submit" class="btn" style="color:#323232;">�α���</button>
		
		<div class="bottomText">
			������ ���ٸ�? <a href="register_main.jsp" style="color:black;">ȸ������</a>
		</div>
		<br>
		<div class="bottomText">
			<a href="main.jsp" style="color:black;">��������</a>
		</div>
	</form>
	
	
	<script src="js/jquery-3.6.0.js"></script>
	
	<script type="text/javascript">
		
	</script>
</body>
</html>