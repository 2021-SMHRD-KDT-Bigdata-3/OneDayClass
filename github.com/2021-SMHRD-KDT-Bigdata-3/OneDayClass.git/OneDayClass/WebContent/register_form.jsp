<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="./css/style2.css">
 <link rel="stylesheet" type="text/css" href="./css/style3.css">
<title>Insert title here</title>
</head>
<body width="100%" height="100%">
        <form action="join" method="post" class="registerForm">
          <h2>ȸ������</h2>
          <select class="division" name="op">
			<option value="user" class="user">�α��� ���¸� �����ϼ���</option>
			<option value="teacher" class="teacher">����</option>
			<option value="user" class="user">�Ϲ�</option>
		</select>
          <div class="idForm">
            <input type="text" class="id" placeholder="���̵� �Է��ϼ���">
          </div>
          <div class="passForm">
            <input type="password" class="pw" placeholder="��й�ȣ�� �Է��ϼ���">
          </div>
          <div class="nickForm">
            <input type="text" class="name" placeholder="�̸��� �Է��ϼ���">
          </div>
          <div class="telForm">
            <input type="text" class="address" placeholder="�������� �Է��ϼ���">
          </div>
          <script>
              let button = () => {
                alert('ȸ������ ��ư ����!')
            }
          </script>
          <button type="button" class="btn" onclick="button()">
            �����ϱ�
          </button>
          <div class="bottomText">
            ������ �ִٸ�? <a href="login_form.jsp">�α���</a>
          </div>
          <br>
          <div class="bottomText">
            <a href="main.jsp">��������</a>
          </div>
        </form>
      </body>
</html>