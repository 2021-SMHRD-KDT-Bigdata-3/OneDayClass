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

</head>
<body>
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
						<img src="img/LOGO.png" alt="">
					</div>
					<div class="nav-switch">
						<i class="fa fa-bars"></i>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<a href="login_main.html" class="site-btn header-btn">�α���</a>
					<a href="register_main.html" class="site-btn2 header-btn">ȸ������</a>
					<a href="mypage_main.html" class="site-btn2 header-btn">����������</a>
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


	<!-- Page info -->
	<div class="page-info-section set-bg">
		<!--data-setbg="img/page-bg/back_sample.jpg" ����̹���-->
		<div class="container">
			<!-- <div class="site-breadcrumb">
				<a href="#">����</a>
				<span>���� ����</span>
			</div> -->
		</div>
	</div>
	<!-- Page info end -->


	<!-- search section -->
	<br>
	<br>
	<br>
	<section class="search-section ss-other-page">
		<div class="container">
			<div class="search-warp">
				<div class="section-title text-white">
					<h2><span>�پ��� ���¸� ã�ƺ�����</span></h2>
				</div>
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<!-- search form -->
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
				<li class="control" data-filter=".category1">�</li>
				<li class="control" data-filter=".category2">����</li>
				<li class="control" data-filter=".category3">�м�/��Ƽ</li>
				<li class="control" data-filter=".category4">����/����</li>
				<li class="control" data-filter=".category5">��Ÿ</li>
			</ul>                                       
			<div class="row course-items-area">
				<!-- course -->
				<div class="mix col-lg-3 col-md-4 col-sm-6 category1">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/1.jpg">
							<div class="price">1�޶�</div>
						</div>
						<div class="course-info">
							<div class="course-text">
								<h5>��濵�� ���ߺξ� �ϱ�</h5>
								<p>�߷��� �Ž����� �׿� ������ ���� �º�!</p>
								<div class="students">120 Students</div>
							</div>
							<div class="course-author">
								<div class="ca-pic set-bg" data-setbg="img/authors/1.jpg"></div>
								<p>William Parker, <span>Developer</span></p>
							</div>
						</div>
					</div>
				</div>
				<!-- course -->
				<div class="mix col-lg-3 col-md-4 col-sm-6 category2">
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
				<div class="mix col-lg-3 col-md-4 col-sm-6 category3">
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
				<div class="mix col-lg-3 col-md-4 col-sm-6 category4">
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
				<div class="mix col-lg-3 col-md-4 col-sm-6 category5">
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
				<div class="mix col-lg-3 col-md-4 col-sm-6 category6">
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
				<div class="mix col-lg-3 col-md-4 col-sm-6 category7">
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
				<div class="mix col-lg-3 col-md-4 col-sm-6 category8">
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