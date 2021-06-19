<%@page import="DAO.TEACHERSDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CLASSDAO"%>
<%@page import="DTO.CLASSDTO"%>
<%@page import="DTO.TEACHERSDTO"%>
<%@page import="DTO.USERSDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<head>

	<title>�Ϸ�Ŭ����-���� ���� �ð�</title>
	<meta charset="UTF-8">
	<meta name="description" content="WebUni Education Template">
	<meta name="keywords" content="webuni, education, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->   
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Fonts -->
	<link href="googleapis.css" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>


	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<style>
	* {margin:0;padding:0;}
	.section input[id*="slide"] {display:none;}
	.section .slidewrap {max-width:100%;margin:0 auto;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a img {width:100%;}
	.section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slidelist .textbox {position:absolute;z-index:1;top:50%;left:50%;transform:translate(-50%,-50%);line-height:1.6;text-align:center;}
	.section .slidelist .textbox h3 {font-size:36px;color:#fff;;transform:translateY(30px);transition:all .5s;}
	.section .slidelist .textbox p {font-size:16px;color:#fff;opacity:0;transform:translateY(30px);transition:all .5s;}
	
	/* input�� üũ�Ǹ� �����̵� ȿ�� */
	.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}

	/* input�� üũ�Ǹ� �ؽ�Ʈ ȿ�� */
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}

	/* ��,�� �����̵� ��ư */
	.slide-control > div {display:none;}
	.section .left {left:30px;background:url('./img/left.png') center center / 100% no-repeat;}
	.section .right {right:30px;background:url('./img/right.png') center center / 100% no-repeat;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-control > div:nth-child(1) {display:block;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-control > div:nth-child(2) {display:block;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-control > div:nth-child(3) {display:block;}

	/* ����¡ */
	.slide-pagelist {text-align:center;padding:10px;}
	.slide-pagelist > li {display:inline-block;vertical-align:middle;}
	.slide-pagelist > li > label {display:block;padding:2px ;border-radius:30px;background:#FEA698;margin:5px 5px;cursor:pointer; width:20px;height:5px;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(1) > label {background:#F36652;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(2) > label {background:#F36652;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(3) > label {background:#F36652;}
	</style>

</head>
<body>

	<% 
		USERSDTO user = null;
		TEACHERSDTO teacher = null;
		String op = null;
		if(session.getAttribute("type") != null){
			op = (String)session.getAttribute("type");
			if(op.equals("user")){
				user = (USERSDTO)session.getAttribute("login");
			}else{
				teacher = (TEACHERSDTO) session.getAttribute("login");
			}
		}
		CLASSDAO c_dao = new CLASSDAO();
		TEACHERSDAO t_dao = new TEACHERSDAO();
		ArrayList<CLASSDTO> arr = new ArrayList<CLASSDTO>();
		arr = c_dao.alldata();
	    
		
		
	%>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<header class="header-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="site-logo">
						<img src="img/test2.png" alt="">
					</div>
					<div class="nav-switch">
						<i class="fa fa-bars"></i>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<%if (user == null && teacher == null) {%>
					<a href="login_main.html" class="site-btn header-btn">�α���</a>
					<a href="register_main.html" class="site-btn2 header-btn">ȸ������</a>
	
					<% }else if(user != null && op.equals("user")){ %> 
						<% if(user.getId().equals("admin")){ %>
							<a href="logout" class="site-btn header-btn">�α׾ƿ�</a>
							<a href="#" class="site-btn2 header-btn">ȸ������</a>
						<%} else { %>
							<a href="logout" class="site-btn header-btn">�α׾ƿ�</a>
							<a href="mypage_user.jsp" class="site-btn2 header-btn">����������</a>
						<% } %>
					
					<%}else if(op.equals("teacher") && teacher != null){ %>
						<% if(teacher.getTeacher_id().equals("admin")){ %>
							<a href="logout" class="site-btn header-btn">�α׾ƿ�</a>
							<a href="#" class="site-btn2 header-btn">ȸ������</a>
						<%} else { %>
							<a href="logout" class="site-btn header-btn">�α׾ƿ�</a>
							<a href="mypage_teacher.jsp" class="site-btn2 header-btn">����������</a>
						<% } %>
					<%} %>
					<!--<nav class="main-menu">
						<ul>
							<li><a href="index.html">����</a></li>
							<li><a href="#">���� �Ұ�</a></li>
							<li><a href="courses.html">���� ����</a></li>
							<li><a href="blog.html">�ҽ�</a></li>
							<li><a href="contact.html">�����ϱ�</a></li>
						</ul>
					</nav>-->
				</div>
			</div>
		</div>
	</header>
	<!-- Header section end --> 


	<!-- Page info 1 -->
	<div class="page-info-section set-bg" ><!-- data-setbg="img/sample_banner1.jpg"> -->
		<div class="container">
		
			<!-- <div class="site-breadcrumb">
				<a href="#">����</a>
				<span>���� ����</span>
			</div> -->
		</div>
	</div>
	<!-- Page info end -->
	
	<!-- Page info 2 -->
	 <div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<div class="slidewrap">
		
		<ul class="slidelist">
			<!-- �����̵� ���� -->
			<li class="slideitem">
				<a>
					<div class="textbox">
						<h3>ù��° �����̵�</h3>
						<p>����1</p>
					</div>
					<img src="./img/sample_banner1.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					
					<div class="textbox">
						<h3>�ι�° �����̵�</h3>
						<p>����2</p>
					</div>
					<img src="./img/sample_banner2.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					
					<div class="textbox">
						<h3>�ι�° �����̵�</h3>
						<p>����1</p>
					</div>
					<img src="./img/sample_banner1.jpg">
				</a>
			</li class="slideitem">

			<!-- ��,�� �����̵� ��ư -->
			<div class="slide-control">
				<div>
					<label for="slide03" class="left"></label>
					<label for="slide02" class="right"></label>
				</div>
				<div>
					<label for="slide01" class="left"></label>
					<label for="slide03" class="right"></label>
				</div>
				<div>
					<label for="slide02" class="left"></label>
					<label for="slide01" class="right"></label>
				</div>
			</div>

		</ul>
		<!-- ����¡ -->
		<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
		</ul>
	</div>

	
</div>
		<!-- Page info end -->


	<!-- search section -->
	<br>
	<br>
	<br>
	<section class="search-section ss-other-page">
		<div class="container"style="text-align: center;">
			<div class="search-warp">
				<div class="section-title text-white" style="text-align: center;">
				</div>
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<!-- search form -->
						<h2><span>�پ��� ���¸� ã�ƺ�����</span></h2>
						<br><br>
						<form class="course-search-form">
							<select name="search">
								<option value="select">�׸� ����</option>
								<option value="title">����</option>
								<option value="content">����</option>
								<option value="locate">����</option>
								<option value="teacher">����</option>
							</select>
							<input type="text" placeholder="�˻��� ������ �Է��ϼ���">
							<!-- <input type="text" class="last-m" placeholder="�з�"> -->
							<!-- <button class="site-btn btn-dark">���� ã�ƺ���</button> -->
							<input type="button" class="site-btn" id="search" value="���� ã�ƺ���" onClick="alert('0���� ������ �˻��Ǿ����ϴ�.')"> 
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- search section end -->


	<!-- course section -->
	<section class="course-section spad pb-0">
		<div class="course-warp">
			<ul class="course-filter controls">
				<li class="control active" data-filter="all">All</li>
				<li class="control" data-filter=".arts">����</li>
				<li class="control" data-filter=".medias">����</li>
				<li class="control" data-filter=".sport">�</li>
				<li class="control" data-filter=".food">�丮</li>
				<li class="control" data-filter=".music">����</li>
				<li class="control" data-filter=".certificate">�ڰ���</li>
				<li class="control" data-filter=".finance">����ũ</li>
				<li class="control" data-filter=".beautys">��Ƽ</li>
			</ul>                                       
			<div class="row course-items-area" >
				<%for(int i = 0; i < arr.size(); i++){  %>
				<!-- course -->
				 
				<div class="mix col-lg-3 col-md-4 col-sm-6 <%=arr.get(i).getCategory() %>">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg=<%=arr.get(i).getImage() %>>
							<%--<div class="price" ></div> --%>
						</div>
						<div class="course-info">
							<div class="course-text">
							<%String url = "class_detail.jsp?class_id=" + Integer.toString(arr.get(i).getId());%>
							<a href=<%=url %> ><h5> <%=arr.get(i).getTitle() %></h5></a>
							
							
								
								<div class="students"><%=arr.get(i).getPrice() %></div>
							</div>
							<div class="course-author">
								
								<div  class="ca-pic set-bg" data-setbg="img/authors/1.jpg"></div>
								
								
								<p><%=t_dao.who(arr.get(i).getTeacher_id()) %><br> <span><%=arr.get(i).getTime() %></span></p>
								
							</div>
						</div>
					</div>
				</div>
				<%} %>
				<!-- course -->
				<div class="mix col-lg-3 col-md-4 col-sm-6 sports">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/2.jpg">
							<div class="price">2�޶�</div>
						</div>
						<div class="course-info">
							<div class="course-text">
								<h5>��濵�� ������ �ϱ�</h5>
								<p>���ʿ� �屺�Ե� �ϽŴٴ� ���� �ʼ� �ɷ�!</p>
								<div class="students">120 Students</div>
							</div>
							<div class="course-author">
								<div class="ca-pic set-bg" data-setbg="img/authors/2.jpg"></div>
								<p>William Parker, <span>Developer</span></p>
							</div>
						</div>
					</div>
				</div>
				<!-- course -->
				<div class="mix col-lg-3 col-md-4 col-sm-6 arts">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/3.jpg">
							<div class="price">3�޶�</div>
						</div>
						<div class="course-info">
							<div class="course-text">
								<h5>���ؼ� ���ǥ�� ���ɽĻ�</h5>
								<p>��Ī ���� ������ �޲ٴ� �߸������� �Ļ�!</p>
								<div class="students">120 Students</div>
							</div>
							<div class="course-author">
								<div class="ca-pic set-bg" data-setbg="img/authors/3.jpg"></div>
								<p>William Parker, <span>Developer</span></p>
							</div>
						</div>
					</div>
				</div>
				<!-- course -->
				<div class="mix col-lg-3 col-md-4 col-sm-6 arts">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/4.jpg">
							<div class="price">4�޶�</div>
						</div>
						<div class="course-info">
							<div class="course-text">
								<h5>������ ���� �±ر���ȸ</h5>
								<p>�濪 ��Ģ���� ��ô���� �ִ� �ڰ��ݸ� ���� Ƽ��!</p>
								<div class="students">120 Students</div>
							</div>
							<div class="course-author">
								<div class="ca-pic set-bg" data-setbg="img/authors/4.jpg"></div>
								<p>William Parker, <span>Developer</span></p>
							</div>
						</div> 
					</div>
				</div>
				<!-- course -->
				<div class="mix col-lg-3 col-md-4 col-sm-6 beautys">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/5.jpg">
							<div class="price">5�޶�</div>
						</div>
						<div class="course-info">
							<div class="course-text">
								<h5>������ ���� ����</h5>
								<p>���������ʹ� �� ������? �� �ñ����� �ذ��� �ش�!</p>
								<div class="students">120 Students</div>
							</div>
							<div class="course-author">
								<div class="ca-pic set-bg" data-setbg="img/authors/5.jpg"></div>
								<p>William Parker, <span>Developer</span></p>
							</div>
						</div>
					</div>
				</div>
				<!-- course -->
				<div class="mix col-lg-3 col-md-4 col-sm-6 medias">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/6.jpg">
							<div class="price">6�޶�</div>
						</div>
						<div class="course-info">
							<div class="course-text">
								<h5>�ΰ����� ���� ����</h5>
								<p>�� �Ӹ��� ���� ������ ��踦 ���� ������!</p>
								<div class="students">120 Students</div>
							</div>
							<div class="course-author">
								<div class="ca-pic set-bg" data-setbg="img/authors/6.jpg"></div>
								<p>William Parker, <span>Developer</span></p>
							</div>
						</div>
					</div>
				</div>
				<!-- course -->
				<div class="mix col-lg-3 col-md-4 col-sm-6 etc">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/7.jpg">
							<div class="price">7�޶�</div>
						</div>
						<div class="course-info">
							<div class="course-text">
								<h5>���θ� ��� ����</h5>
								<p>���� Ÿ�� ����Ѵٴ� ���θ��� ��� ������ ����!</p>
								<div class="students">120 Students</div>
							</div>
							<div class="course-author">
								<div class="ca-pic set-bg" data-setbg="img/authors/7.jpg"></div>
								<p>William Parker, <span>Developer</span></p>
							</div>
						</div>
					</div>
				</div>
				<!-- course -->
				<div class="mix col-lg-3 col-md-4 col-sm-6 etc">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/8.jpg">
							<div class="price">8�޶�</div>
						</div>
						<div class="course-info">
							<div class="course-text">
								<h5>������ �Ǹ� ����</h5>
								<p>���� â���� �⺻ �߿� �⺻�� ����!</p>
								<div class="students">120 Students</div>
							</div>
							<div class="course-author">
								<div class="ca-pic set-bg" data-setbg="img/authors/8.jpg"></div>
								<p>William Parker, <span>Developer</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="featured-courses">
				<div class="featured-course course-item">
					<div class="course-thumb set-bg" data-setbg="img/courses/f-1.jpg">
						<div class="price">4����</div>
					</div>
					<div class="row">
						<div class="col-lg-6 offset-lg-6 pl-0">
							<div class="course-info">
								<div class="course-text">
									<div class="fet-note">��õ ����</div>
									<h5>�����̿� �Բ��ϴ� ��ſ� ũ�Ѹ�</h5>
									<p>ũ�Ѹ�~ �Ѹ�~ �Ѹ�~ ������ �뷡�� ���� ������ ���� ������ ������ ������ ����!</p>
									<div class="students">120 Students</div>
								</div>
								<div class="course-author">
									<div class="ca-pic set-bg" data-setbg="img/authors/1.jpg"></div>
									<p>������, <span>������Ʈ �ǹ� �Ѱ�</span></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="featured-course course-item">
					<div class="course-thumb set-bg" data-setbg="img/courses/f-2.jpg">
						<div class="price">4����</div>
					</div>
					<div class="row">
						<div class="col-lg-6 pr-0">
							<div class="course-info">
								<div class="course-text">
									<div class="fet-note">��õ ����</div>
									<h5>�����̿� �Բ��ϴ� �ϵ� �ڵ�</h5>
									<p>�ڵ��� �Դ� �Ŷ���? �԰� �� �� �ִ� �̴ϴ�! ���� ���� �ڵ��� ����!</p>
									<div class="students">120 Students</div>
								</div>
								<div class="course-author">
									<div class="ca-pic set-bg" data-setbg="img/authors/2.jpg"></div>
									<p>������, <span>������Ʈ ��ȹ �Ѱ�</span></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- course section end -->


	<!-- banner section -->
	<!-- <section class="banner-section spad">
		<div class="container">
			<div class="section-title mb-0 pb-2">
				<h2>ȸ������ �� ���񽺸� ����ּ���!</h2>
				<p>���κ� ������ ������Ŭ���� ��õ ���񽺸� ���ؼ��� ������ �ʿ��մϴ�!</p>
			</div>
			<div class="text-center pt-5">
				<a href="register_form.html" class="site-btn">ȸ������</a>
			</div>
		</div>
	</section> -->
	<!-- banner section end -->


	<!-- footer section -->
	<footer class="footer-section spad pb-0">
		<div class="footer-top">
			<div class="footer-warp">
				<div class="row">
					<div class="widget-item">
						<h4>�����ϱ�</h4>
						<ul class="contact-list">
							<li>���ֱ����� ����<br>�۾Ϸ� 60 ����CGI���� 2��</li>
							<li>080-335-0020</li>
							<li>test@smhrd.com</li>
						</ul>
					</div>
					<div class="widget-item">
						<h4>�ֿ� ����</h4>
						<ul class="contact-list">
							<li>������Ŭ���� ���� ������ ��õ</li>
							<li>����/����/����/���� �� �˻� ���</li>
							<li>ī�װ��� ���� ��ȸ �� �з� ���</li>
						</ul>
					</div>
					<!--<div class="widget-item">
						<h4>Graphic Design</h4>
						<ul>
							<li><a href="">Applied Studies</a></li>
							<li><a href="">Computer Engeneering</a></li>
							<li><a href="">Software Engeneering</a></li>
							<li><a href="">Informational Engeneering</a></li>
							<li><a href="">System Engeneering</a></li>
						</ul>
					</div>
					<div class="widget-item">
						<h4>Development</h4>
						<ul>
							<li><a href="">Applied Studies</a></li>
							<li><a href="">Computer Engeneering</a></li>
							<li><a href="">Software Engeneering</a></li>
							<li><a href="">Informational Engeneering</a></li>
							<li><a href="">System Engeneering</a></li>
						</ul>
					</div>-->
					<div class="widget-item">
						<h4>�ҽ���</h4>
						<form class="footer-newslatter">
							<input type="email" placeholder="�̸����� �Է����ּ���">
							<button class="site-btn">�����ϱ�</button>
							<p>������ ���ŵ��� ���� ��� ���� �������� Ȯ�����ּ���</p>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="footer-warp">
				<ul class="footer-menu">
					<li><a href="#">Terms & Conditions</a></li>
					<li><a href="#">Register</a></li>
					<li><a href="#">Privacy</a></li>
				</ul>
			    <div class="copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This webpage is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://www.smhrd.or.kr" target="_blank">���������(����)</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
			</div>
		</div>
	</footer> 
	<!-- footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/circle-progress.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>