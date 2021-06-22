<%@page import="DTO.USERSDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
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
	<section class="contact-page spad pb-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="contact-form-warp">
						<div class="section-title text-white text-left">
							<h2>개인정보 수정</h2>
							<p>맞춤형 원데이클래스 강좌 추천을 위해 정확한 정보를 입력해주세요</p>
						</div>
						<form action="USERS_update" class="contact-form"> 
							<h3>수강생 정보</h3>
							<br> <input disabled="disabled" type="text" class="id" value=<%=user.getId() %> name="id">
							<input type="password" class="pw" value=<%=user.getPw() %> name="pw">
							<input disabled="disabled" type="text" class="name" value=<%=user.getName() %> name="name"> 
							<input type="text" class="address" value=<%=user.getAddress() %> name="address"> 
							 <input type="submit" class="site-btn4" id="edit" value="수정 완료">
							 <input type="button" class="site-btn4" id="survey" value="성향 분석" onClick="location.href='hobby_survey.jsp'">
							 <br><br> 
							<h3>수강 중인 강좌</h3>
							<br>
					<div class="tableone">
					<table width="600px">
                   	<thead>
                    <tr align="center" bgcolor="white" style="font-size: 15px;">
                    <th>강사 이름</th>
                    <th>강의 제목</th>
                    <th>강의 내용</th>
                    <th>강의 날짜</th>
                    <th></th>
               		</tr>
           		    </thead>
		            <tbody>
       	   			<tr align="center" bgcolor="white" style=>
                    <td>smart</td>
                    <td>빅데이터 분석서비스 <br> 개발자과정</td>
                    <td>파이썬 활용한 데이터 <br> 크롤링 및 머신러닝</td>
                    <td>2021/06/22</td>
                    <td> <input type="button" class="site-btn3" id="cancel" value="수강 취소"></td>   
            		</tr>
               		<tr align="center" bgcolor="white">
                    <td>develop</td>
                    <td>인공지능 융합서비스 <br> 개발자과정</td>
                    <td>파이썬 활용한 데이터 <br> 크롤링 및 딥러닝 </td>
                    <td>2021/06/22</td>
                    <td><input type="button" class="site-btn3" id="cancel" value="수강 취소"></td>
                </tr>
                </tbody>
       			</table>
				</form>
				<br>
				<form action="delete_page.jsp" method="post">
				<input type="submit" class="site-btn4" value="회원탈퇴">
				</form>
				</section>
</body>
</html>
</html>