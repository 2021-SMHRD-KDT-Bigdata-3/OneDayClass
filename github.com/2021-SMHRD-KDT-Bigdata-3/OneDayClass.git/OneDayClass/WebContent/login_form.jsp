<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/style2.css">
<link rel="stylesheet" href="font/NanumFontSetup_TTF_SQUARE_ROUND.css"/>
 
</head>

<body width="100%" height="100%">
	<form action="login" method="post" class="loginForm">
		<h2>�α���</h2>
		<select class="division" name="op">
			<option value="user" class="user">�α��� ���¸� �����ϼ���</option>
			<option value="teacher" class="teacher">����</option>
			<option value="user" class="user">�Ϲ�</option>
		</select>
		<div class="idForm">
			<input type="text" class="id" placeholder="���̵� �Է��ϼ���" name="id" >
		</div>
		<div class="passForm">
			<input type="password" class="pw" placeholder="��й�ȣ�� �Է��ϼ���" name="pw">
		</div>
		
		<button type="submit" class="btn">�α���</button>
		
		<div class="bottomText">
			������ ���ٸ�? <a href="register_main.jsp">ȸ������</a>
		</div>
		<br>
		<div class="bottomText">
			<a href="main.jsp">��������</a>
		</div>
	</form>
	
	
	<script src="js/jquery-3.6.0.js"></script>
	
	<script type="text/javascript">
		
	</script>
</body>
</html>