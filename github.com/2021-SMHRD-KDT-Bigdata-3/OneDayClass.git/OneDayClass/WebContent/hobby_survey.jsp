<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<script type="text/javascript">

function deselect() {
	  $("input:radio[name='experience']").prop('checked', false);
	  $("input:radio[name='hobby_choice']").prop('checked', false);
	  $("input:checkbox[name='non_give_up']").prop('checked', false);
	  $("input:radio[name='hobby_time']").prop('checked', false);
	  $("input:radio[name='Participants']").prop('checked', false);
	  $("input:radio[name='hobby_money']").prop('checked', false);
	  $("input:radio[name='obstacle']").prop('checked', false);
		}
		
</script>
	<!--  $('#write').on('click', function(){
			let id = $('.id').val();
			let pw = $('.pw').val();
			let name = $('.name').val();
			let tel = $('.tel').val();
			if(id != "" && pw != "" && name != "" && tel != ""){
				$('#write').attr('type', 'submit' )
			}else if(id == ""){
				alert('���̵� �Է����ּ���')
			}else if(pw == ""){
				alert('��й�ȣ�� �Է����ּ���')
			}else if(name == ""){
				alert('�̸��� �Է����ּ���')
			}else if( tel == ""){
				alert('��ȭ��ȣ�� �Է����ּ���')
			}
		});-->
<style>

div{
color: #0D3B66;
font-weight: bold;
text-align:left;
}
.div btn{
margin: auto;
left: 50%;

}

</style>
</head>
<body>
<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/font.css" />
	<link rel="stylesheet" href="css/owl.carousel.css" />
	<link rel="stylesheet" href="css/style.css" />
	
 
	<section class="contact-page spad pb-0">
		<div class="container" style="text-align: center;">
			<div class="row">
				<div class="col-lg-8">
					<div class="contact-form-warp">
						<div class="section-title text-white text-left" style="text-align: center !important;" > 
							<h2>��� ���� ����</h2>
							<h5>��̿� ������ �ľ��Ͽ� ������ ������Ŭ������ ��õ�ص帳�ϴ�</h5>
						</div>
						<form action="http://211.105.165.117:9000/survey" class="contact-form" method='POST'> 
						<table>
						<tr>
							<p><h5>������</h5></p>
							<div>
							<input type="radio" value="man" name="gender" class='gender'>����
							&emsp;
							<input type="radio" value="woman" name="gender" class='gender'>����
							</div>
							<br>
							<br>
							<p><h5>������</h5></p>
							<div>
							<input type="radio" value="10s" name="age">10��
							&emsp;
							<input type="radio" value="20s" name="age">20��
							&emsp;
							<input type="radio" value="30s" name="age">30��
							&emsp;
							<input type="radio" value="40s" name="age">40��
							&emsp;
							<input type="radio" value="over50s" name="age">50�� �̻�
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>������</h5></p>
							<div>
							<input type="radio" value="student" name="job">�л�
							&emsp;
							<input type="radio" value="seeker" name="job">����غ��
							&emsp;
							<input type="radio" value="worker" name="job">������
							&emsp;
							<input type="radio" value="free_lancer" name="job">��������
							&emsp;
							<input type="radio" value="none" name="job">����
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>��������Ŭ������ ���غ��̳���?<br>�׷��ٸ� �� ȸ �����غ��̳���?</h5></p>
							<div>
							<input type="radio" value="1" name="experience">1ȸ
							&emsp;
							<input type="radio" value="2" name="experience">2~3ȸ
							&emsp;
							<input type="radio" value="4" name="experience">4~5ȸ
							&emsp;
							<input type="radio" value="6" name="experience">6~7ȸ
							&emsp;
							<input type="radio" value="8" name="experience">8~9ȸ
							<br>
							<input type="radio" value="10" name="experience">10ȸ �̻�
							&emsp;
							<input type="radio" value="0" name="experience">����
							<input type="button" class="site-btn3" value="���� ����" onclick="deselect()">
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<%--<p><h4>��� ��� Ȱ���� ���Ͻó���?</h4></p> --%>

							<%-- 
							<p><h4>� ��� Ȱ���� ���Ͻó���?</h4></p>

							<div>
							<input type="radio" value="made" name="hobby_choice">����/����/���(���׸��� ��ǰ, ���ڱ�, ����, �ڼ�, ���, ĵ�� ��)
							<br>
							<input type="radio" value="sports" name="hobby_choice">������(�䰡, �ʶ��׽�, �߷�, �ｺ ��)
							<br>
							<input type="radio" value="fashion" name="hobby_choice">�м�/��Ƽ(�ڵ�, ����ũ��, ���)
							<br>
							<input type="radio" value="picture" name="hobby_choice">����/��������(�Կ�,����)
							<br>
							<input type="radio" value="cooking" name="hobby_choice">�丮/����/����(����ŷ, ���� ������)
							<br>
							<input type="radio" value="technology" name="hobby_choice">����ũ/���ڰ���(�ֽ� ��)
							<br>
							<input type="radio" value="music" name="hobby_choice">����(����,�Ǳ� ������ ��)
							<br>
							<input type="radio" value="collection" name="hobby_choice">����Ȱ��(�Ź�,�ð�,�峭��,��ǰ��)
							<br>
							<input type="radio" value="it" name="hobby_choice">IT(Ȩ������,SNS,�˻�,1�� �̵�� ����,��α� ����,�ڵ�*���α׷���)
							<br>
							<input type="radio" value="study" name="hobby_choice">�ڰ��� ���
							<br>
							<input type="button" class="site-btn3" value="���� ����" onclick="deselect()">
							</div>
							<br>
							--%>
							<br>
							</tr>
							<tr>
							<p><h5>���ð��� �Ѱܵ� ���� ���� �� �� ���� �оߴ�?</h5></p>
							<div>
							<input type="checkbox" value="sleep" name="non_give_up">����
							&emsp;
							<input type="checkbox" value="company_work" name="non_give_up">ȸ������� �ϼ���
							&emsp;
							<input type="checkbox" value="hobby" name="non_give_up">��̻�Ȱ
							&emsp;
							<input type="checkbox" value="healthcare" name="non_give_up">�ǰ�����
							<br>
							<input type="checkbox" value="entertainment" name="non_give_up">����
							&emsp;
							<input type="checkbox" value="meeting" name="non_give_up">���ΰ��� ����
							&emsp;
							<input type="checkbox" value="appearance" name="non_give_up">�ܸ����
							<input type="button" class="site-btn3" value="���� ����" onclick="deselect()">
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>����� Ȱ���� �󸶳� �ð��� ���̽ó���?</h5></p>
							<div>
							<input type="radio" value="1" name="hobby_time">1�ð� �̸�
							&emsp;
							<input type="radio" value="1.5" name="hobby_time">1�ð�~2�ð� �̸�
							&emsp;
							<input type="radio" value="2" name="hobby_time">2�ð�~3�ø� �̸�
							&emsp;
							<input type="radio" value="3" name="hobby_time">3�ð� �̻�
							<br>
							<input type="button" class="site-btn3" value="���� ����" onclick="deselect()">
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>������� ��̻�Ȱ/�ڱ��� �о߽� ��ȣ�ϴ� �ο���?</h5></p>
							<div>
							<input type="radio" value="1" name="Participants">ȥ��
							&emsp;
							<input type="radio" value="2" name="Participants">2��
							&emsp;
							<input type="radio" value="3" name="Participants">3~5��
							&emsp;
							<input type="radio" value="5" name="Participants">5~9��
							&emsp;
							<input type="radio" value="10" name="Participants">10�� �̻�
							&emsp;
							<input type="radio" value="0" name="Participants">�������
							<input type="button" class="site-btn3" value="���� ����" onclick="deselect()">
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>������ ���� ��̻�Ȱ�� �󸶳� ����� �� �� �ֳ���?</h5></p>
							<div>
							<input type="radio" value="10" name="hobby_money">10���� ����
							&emsp;
							<input type="radio" value="20" name="hobby_money">10~30���� �̸�
							&emsp;
							<input type="radio" value="30" name="hobby_money">30~50���� �̸�
							<br>
							<input type="radio" value="50" name="hobby_money">50~100���� �̸�
							&emsp;
							<input type="radio" value="100" name="hobby_money">100���� �̻�
							<input type="button" class="site-btn3" value="���� ����" onclick="deselect()">
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>����� Ȱ���� ���� �ɸ����� �Ǵ� ���� �����ΰ���?</h5></p>
							<div>
							<input type="radio" value="10" name="obstacle">���� ������ ���� �ð�����
							&emsp;
							<input type="radio" value="20" name="obstacle">������ �δ�
							&emsp;
							<input type="radio" value="100" name="obstacle">��������
							<br>
							<input type="radio" value="30" name="obstacle">������ �����ϰų� �� �� �ƴ� ���� ���
							&emsp;
							<input type="radio" value="50" name="obstacle">���� ���� �� ���α׷��� ����
							<br>
							<input type="radio" value="100" name="obstacle">������ �Բ� ��� ����� ���
							&emsp;
							<input type="radio" value="100" name="obstacle">���� �ü��� �����ؼ�
							<input type="button" class="site-btn3" value="���� ����" onclick="deselect()">
							</div>
							<br>
							<div>
							</div>
							</tr>
							<br>
							<div  style="text-align:center;">
							<p><h5>�� �Ʒ� ������ 1~5�� ô���� �������ּ���. ��</h5></p>
							<br>
							</div>
							</div>
							<tr>
							<p><h5>���ٸ�����鿡�� �ڽ��� �Ұ��ϴ� ���� ����� �ϳ���?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti1">
							&emsp;
							<input type="radio" value="2" name="mbti1">
							&emsp;
							<input type="radio" value="3" name="mbti1">
							&emsp;
							<input type="radio" value="4" name="mbti1">
							&emsp;
							<input type="radio" value="5" name="mbti1">
							&nbsp;�׷���
							</div>
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>����� �ǿ����̰� Ȱ�����ΰ���?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti2">
							&emsp;
							<input type="radio" value="2" name="mbti2">
							&emsp;
							<input type="radio" value="3" name="mbti2">
							&emsp;
							<input type="radio" value="4" name="mbti2">
							&emsp;
							<input type="radio" value="5" name="mbti2">
							&nbsp;�׷���
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>��ģ���� ���� ����� ���� ģ��������?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti3">
							&emsp;
							<input type="radio" value="2" name="mbti3">
							&emsp;
							<input type="radio" value="3" name="mbti3">
							&emsp;
							<input type="radio" value="4" name="mbti3">
							&emsp;
							<input type="radio" value="5" name="mbti3">
							&nbsp;�׷���
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>��ȣ����� �����ó���?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti4">
							&emsp;
							<input type="radio" value="2" name="mbti4">
							&emsp;
							<input type="radio" value="3" name="mbti4">
							&emsp;
							<input type="radio" value="4" name="mbti4">
							&emsp;
							<input type="radio" value="5" name="mbti4">
							&nbsp;�׷���
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>����ü�� ��󺸴ٴ� ���迡 �� �����ϴ� ���Դϱ�?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti5">
							&emsp;
							<input type="radio" value="2" name="mbti5">
							&emsp;
							<input type="radio" value="3" name="mbti5">
							&emsp;
							<input type="radio" value="4" name="mbti5">
							&emsp;
							<input type="radio" value="5" name="mbti5">
							&nbsp;�׷���
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>��å, ���� �Ǵ� ��ȭ �� ���ٸ��� �پ��� �ؼ��� <br> ������ �Ϳ� ������ �ֽ��ϱ�?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti6">
							&emsp;
							<input type="radio" value="2" name="mbti6">
							&emsp;
							<input type="radio" value="3" name="mbti6">
							&emsp;
							<input type="radio" value="4" name="mbti6">
							&emsp;
							<input type="radio" value="5" name="mbti6">
							&nbsp;�׷���
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>�������� �޽����� �绡�� ȸ������ ���� ���, <br> ������ ���Ǽ��� �ߴ��� �����ϳ���?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti7">
							&emsp;
							<input type="radio" value="2" name="mbti7">
							&emsp;
							<input type="radio" value="3" name="mbti7">
							&emsp;
							<input type="radio" value="4" name="mbti7">
							&emsp;
							<input type="radio" value="5" name="mbti7">
							&nbsp;�׷���
							</div>
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>��ģ���� � �Ϸ� ������ ���, �����ذ�å�� <br> �����ϱ⺸�� ���θ� ���ִ� ���̽Ű���?</h5></p>
							<div >
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti8">
							&emsp;
							<input type="radio" value="2" name="mbti8">
							&emsp;
							<input type="radio" value="3" name="mbti8">
							&emsp;
							<input type="radio" value="4" name="mbti8">
							&emsp;
							<input type="radio" value="5" name="mbti8">
							&nbsp;�׷���
							</div>
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>���ٸ������ ������ �Ⱦ��ϳ���?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti9">
							&emsp;
							<input type="radio" value="2" name="mbti9">
							&emsp;
							<input type="radio" value="3" name="mbti9">
							&emsp;
							<input type="radio" value="4" name="mbti9">
							&emsp;
							<input type="radio" value="5" name="mbti9">
							&nbsp;�׷���
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>����ü���� ��ȹ�� ���� �ð��� �����⺸�ٴ� <br> ���������� �����̳���?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti10">
							&emsp;
							<input type="radio" value="2" name="mbti10">
							&emsp;
							<input type="radio" value="3" name="mbti10">
							&emsp;
							<input type="radio" value="4" name="mbti10">
							&emsp;
							<input type="radio" value="5" name="mbti10">
							&nbsp;�׷���
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>�������� ���� ���ο� ���迡 ���� �������̽Ű���?</h5></p>
							<div>
							�׷��� �ʴ�&nbsp;
							<input type="radio" value="1" name="mbti11">
							&emsp;
							<input type="radio" value="2" name="mbti11">
							&emsp;
							<input type="radio" value="3" name="mbti11">
							&emsp;
							<input type="radio" value="4" name="mbti11">
							&emsp;
							<input type="radio" value="5" name="mbti11">
							&nbsp;�׷���
							</div>
							<br>
							<br>
							</tr>
							<tr>
							<p><h5>������ǥ�� ����� �� ��ŵ�ϴ�.</h5></p>
							<div>
							����&nbsp;
							<input type="radio" value="1" name="mbti12">
							&emsp;
							<input type="radio" value="2" name="mbti12">
							&emsp;
							<input type="radio" value="3" name="mbti12">
							&emsp;
							<input type="radio" value="4" name="mbti12">
							&emsp;
							<input type="radio" value="5" name="mbti12">
							&nbsp;�׷���
							</div>
							</tr>
							<br>
							</table>
							<div class="btn" style="margin: auto;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" class="site-btn4" id="main" value="�ڷ� ����" align="center" onClick="location.href='mypage_user.jsp'">
							<input type="submit" class="site-btn4" id="write" value="�ۼ� �Ϸ�" align="center">
							</div> 	 
							</form>
							 

					</div>
			 </div>
	</section>
	
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//let arr = ['gender', 'age', 'job', 'experience',  'non_give_up', 'hobby_time',
	//	'Participants', 'hobby_money', 'obstacle'];
		
</script>
	
</body>
</html>