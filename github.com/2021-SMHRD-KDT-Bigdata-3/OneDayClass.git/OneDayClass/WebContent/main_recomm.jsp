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
	<link href="img/favi con.ico" rel="shortcut icon"/>

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
	
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>

<body>
	<style>
		* {
			margin: 0;
			padding: 0;
		}

		ul,
		li {
			list-style: none;
		}

		#slide {
			height: 300px;
			position: relative;
			overflow: hidden;
		}

		#slide ul {
			width: 500%;
			height: 100%;

		}

		#slide ul:after {
			content: "";
			display: block;
			clear: both;
		}

		#slide li {
			float: left;
			width: 20%;
			height: 100%;
		}

		#slide li:nth-child(1) {
			background: #faa;
		}

		#slide li:nth-child(2) {
			background: #ffa;
		}

		#slide li:nth-child(3) {
			background: #9ee4da;
		}

		#slide li:nth-child(4) {
			background: #b8b8ff;
		}

		#slide li:nth-child(5) {
			background: #faa;
		}

		#slide input {
			display: none;
		}

		#slide label {
			display: inline-block;
			vertical-align: middle;
			width: 10px;
			height: 10px;
			border: 2px solid #666;
			background: #fff;
			transition: 0.3s;
			border-radius: 50%;
			cursor: pointer;
		}

		#slide .pos {
			text-align: center;
			position: absolute;
			bottom: 10px;
			left: 0;
			width: 100%;
			text-align: center;
		}


		#pos1:checked~ul {
			margin-left: 0%;
			transition: 1s;
		}

		#pos2:checked~ul {
			margin-left: -100%;
			transition: 1s;
		}

		#pos3:checked~ul {
			margin-left: -200%;
			transition: 1s;
		}

		#pos4:checked~ul {
			margin-left: -300%;
			transition: 1s;
		}

		#pos1:checked~ul {
			animation: toFirst 0.5s linear;
		}

		#pos1:checked~.pos>label:nth-child(1) {
			background: #666;
		}

		#pos2:checked~.pos>label:nth-child(2) {
			background: #666;
		}

		#pos3:checked~.pos>label:nth-child(3) {
			background: #666;
		}

		#pos4:checked~.pos>label:nth-child(4) {
			background: #666;
		}

		#pos5:checked~.pos>label:nth-child(1) {
			background: #666;
		}


		@keyframes toFirst {
			0% {
				margin-left: -300%;
			}

			50% {
				margin-left: -350%;
			}

			99% {
				margin-left: -400%;
			}

			100% {
				margin-left: 0%;
			}
		}
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
		ArrayList<CLASSDTO> arr2 = new ArrayList<CLASSDTO>();
		arr2 = null;
		
		// �˻� ��� ���� �Ѻκ�  (�� X)
				request.setCharacterEncoding("euc-kr");
				//join.jsp���� ���� ���� ������ ���
				String search1 = request.getParameter("search1");
				System.out.println(search1);
				String search2 = request.getParameter("search2");
				System.out.println(search2);
								
				String search1_ = "";
				if(search1 !=null)
					search1_ = search1;
				System.out.println(search1);
				String search2_ ="";
				if(search2 != null)
					search2_ = search2;
				System.out.println(search2_);
				
		if(search1_.equals("title")){			
			arr2 = c_dao.title_select(search2_);			
		}else if(search1_.equals("content")){
			arr2 = c_dao.content_select(search2_);			
		}else if(search1_.equals("teacher")){
			arr2 = c_dao.teacher_select(search2_);			
		}else if(search1_.equals("select")){
			response.sendRedirect("main.jsp");
			System.out.println("������������ �̵���");
		}
		//�˻� ��� ���� �� �κ�
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
						<a href="main.jsp"><img class = 'logo' src="img/Logo.png"></a> 
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
	<div id="slide">
		<input type="radio" name="pos" id="pos1" checked>
		<input type="radio" name="pos" id="pos2">
		<input type="radio" name="pos" id="pos3">
		<input type="radio" name="pos" id="pos4">

		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		
		<p class="pos">
			<label for="pos1"></label>
			<label for="pos2"></label>
			<label for="pos3"></label>
			<label for="pos4"></label>
		</p>
	</div>
</body></html>
	
		<!-- Page info end -->


	<!-- search section -->
	<br>
	<br>
	<br>
	<section class="search-section ss-other-page">
		<div class="container">
			<div class="search-warp">
				<div class="section-title text-white">
				</div>
				<div class="row">
					<div class="col-lg-10 offset-lg-1" style="text-align:center;">
						<!-- search form -->
						<h2><span>"${param.search2 }"(��)�� �Է��� ����Դϴ�</span></h2>
						<br><br>
						<table style = "margin:auto;">
						<tr><td>
						<form action="main_recomm.jsp" method="get" class="course-search-form">
							<select name="search1" style="width: 150px; height: 40px;">
								<option value="select">�׸� ����</option>
								<option value="title">����</option>
								<option value="content">����</option>
								<option value="teacher" >����</option>
							</select>
							<input type="text" placeholder="�˻��� ������ �Է��ϼ���" name="search2" style="width: 250px; height: 40px;" value="${param.search2 }" class = "search"/>
							<!-- <input type="text" class="last-m" placeholder="�з�"> -->
							<!-- <button class="site-btn btn-dark">���� ã�ƺ���</button> -->
							<input type="submit" class="site-btn3" id="search" value="���� ã�ƺ���" style="width: 150px; height: 40px;"> <!-- onClick="alert('0���� ������ �˻��Ǿ����ϴ�.')"--> 
						</form>
						</td></tr>
						</table>
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
				<li class="control" data-filter=".recomm">��õ</li>
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
			<%if(arr2 != null){ %>
				<%for(int i = 0; i < arr2.size(); i++){  %>
				
				
				<!-- course -->
				 
				<div class="mix col-lg-3 col-md-4 col-sm-6 <%=arr2.get(i).getCategory() %>">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg=<%=arr2.get(i).getImage() %>>
							<%--<div class="price" ></div> --%>
						</div>
						<div class="course-info">
							<div class="course-text">
							<%String url = "class_detail.jsp?class_id=" + Integer.toString(arr2.get(i).getId());%>
							<a href=<%=url %> ><h5> <%=arr2.get(i).getTitle() %></h5></a>
							
							
								
								<div class="students"><%=arr2.get(i).getPrice() %></div>
							</div>
							<div class="course-author">
								
								<div  class="ca-pic set-bg" data-setbg="img/authors/1.jpg"></div>
								
								
								<p><%=t_dao.who(arr2.get(i).getTeacher_id()) %><br> <span><%=arr2.get(i).getTime() %></span></p>
								
							</div>
						</div>
					</div>
				</div>
				<%} %>
				<%} %>

			
	
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