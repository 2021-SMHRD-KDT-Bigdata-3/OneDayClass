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
	<link rel="stylesheet" href="css/font.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/style3.css"/>

 
	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	

<head>
	<meta charset="UTF-8">
	<title>Document</title>
<!-- ���� ��� -->
	
	<style>
	
	.header-section {
    position: fixed;
    max-width: 100%;
    top: 0;
    left: 0;
    right: 0;
    padding-top: 20px;
    z-index: 5;
    background-color: white;
    height: 100px;
    box-shadow: inset 0 -1px 0 0 #eaeaea;
	}
	.sticky{
		position: sticky;
		top: 100px;
		left: 0;
        right: 0;
		z-index: 5;
		background-color: white;
		box-shadow: inset 0 -1px 0 0 #eaeaea;
	}
	
	
	
	 *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:400px;overflow:hidden;}
    .slide ul{position:relative;height:100%;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;}
    .slide li:nth-child(1){background: linear-gradient(#d3fbfb,#fbf7b8);}
    .slide li:nth-child(2){background: linear-gradient(#fbf7b8,#facfd9);}
    .slide li:nth-child(3){background: linear-gradient(#ffcfc5, #d3fbfb);}
    .slide li:nth-child(4){background: linear-gradient(#fbfcdb, #e9defa);}
    .slide li:nth-child(5){background: linear-gradient(#fbf7b8,#facfd9);}
 
    span{
    	font-family:'NanumSquareRound';
    }

.course-item .course-info .course-author {
border-top:1px solid #FEA698;}

	.bg1{
		background-image: url("img/banner_arts2.png");
	}
	.bg2{
		background-image: url("img/banner_sports2.png");
	}
	.bg3{
		background-image: url("img/banner_food2.png");
	}
	.bg4{
		background-image: url("img/banner_music2.png");
	}
	
.course-item .course-info .course-author {
border-top:1px solid #FEA698;
}
.search-section.ss-other-page .search-warp {
	position: relative;
	padding: 20px 0;
	box-shadow: inset 0 -1px 0 0 #eaeaea;
}
body{
	height: 600%;

}
.footer-bottom{
	background:white;
}
.footer-menu li a{
	color:darkgray;

}
.copyright {
	color:darkgray;
}
	</style>
<script>
const all = ele => document.querySelectorAll(ele)
const one = ele => document.querySelector(ele)
const slide = _ => {
  const wrap = one('.slide')
  const target = wrap.children[0]
  const len = target.children.length
  const liStyle = `
    position:absolute;
    left:0;right:0;top:0;bottom:0;transition:1s;opacity:0
  `
  target.style.cssText = `position:relative;`
  Array.from(target.children)
  .forEach(ele => ele.style.cssText = liStyle)
  target.children[0].style.opacity = 1
  let pos = 0
  setInterval(_ => {
    target.children[pos].style.opacity = 0
    pos = (pos + 1) % len 
    target.children[pos].style.opacity = 1
  }, 1500)
}
window.onload = function () {
  slide()
}
</script>

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
				
		if(search1_.equals("����")){			
			arr2 = c_dao.title_select(search2_);			
		}else if(search1_.equals("����")){
			arr2 = c_dao.content_select(search2_);			
		}else if(search1_.equals("����")){
			arr2 = c_dao.teacher_select(search2_);			
		}else if(search1_.equals("�׸� ����")){
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
						<a href="main.jsp"><img class = 'logo' src="img/Logo3.png" style="max-width: 150px;"></a> 
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
	
	<!-- Page info 2  ��� -->
	<div id="slide">
	<div class="slide">
    <ul>
     
      <%if(user == null){ %>
      <li><div class = "bg1"><table><tr height="30px"></tr>
      	<tr height="340px"><td width="20%"></td>
      	<td width="30%"><h3></h3></td>
      	<td width="10%"></td>
      	<td width="30%"><!--<img width="500px" height="340px" src="http://img.taling.me/Content/Uploads/Cover/55fa208a18b09b2e3c02772346f439b0d4df8409.jpeg">--></td>
      	<td width="20%"></td></tr>
      <tr height="30px"></tr>
      </table></div></li>
      <li><div class = "bg2"><table><tr height="30px"></tr>
      	<tr height="340px"><td width="20%"></td>
      	<td width="30%"><h3></h3></td>
      	<td width="10%"></td>
      	<td width="30%"><!--<img width="500px" height="340px" src="http://img.taling.me/Content/Uploads/Cover/55fa208a18b09b2e3c02772346f439b0d4df8409.jpeg">--></td>
      	<td width="20%"></td></tr>
      <tr height="30px"></tr>
      </table></div></li>
      <li><div class = "bg3"><table><tr height="30px"></tr>
       	<tr height="340px"><td width="20%"></td>
      	<td width="30%"><h3></h3></td>
      	<td width="10%"></td>
      	<td width="30%"><!--<img width="400px" height="340px" src="http://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/Cover/c84a49732713812e91ef9481db371338d9185937.jpg">--></td>
      	<td width="20%"></td></tr>
      
      <tr height="30px"></tr>
      </table></div></li>
      <li><div class = "bg4"><table><tr height="30px"></tr>
      	<tr height="340px"><td width="20%"></td>
      	<td width="30%"><h3></h3></td>
      	<td width="10%"></td>
      	<td width="30%"><!--<img width="500px" height="340px" src="http://img.taling.me/Content/Uploads/Cover/77001f8bc6aeba3881d4ba52a285f79f3ba11b77.jpg">--></td>
      	<td width="20%"></td></tr>
      
      <tr height="30px"></tr>
      </table></div></li>
      <%} else if(user.getRecomm()==null){ %>
      <%-- <li><div class="bg1"> --%>
      <% String src = "img/page-bg/banner.png"; %>
      <li><div>
      <table style="max-width: 100%">
      <tr height="10px"></tr>
      	<tr height="380px">
      	<td width="15%"><!--1�� ����--> </td>
      	<td width="30%"><!--2�� ����--> 
      		<div width="100%" height="100%"> 
      			<h2>���� ���� ��õ����!</h2> 
      			<a class="goServey" href="hobby_survey.jsp"><img src="img/icon.jpg"></a> 
      			<%-- �̰� �̿��ؼ� class_id �����ϸ� �ǰٴ� --%>
      		</div> 
      	</td>
      	<td width="5%"><!--3�� ����--></td>
      	<td width="10%"><!--4�� ����--></td>
      	<td width="40%"><img alt="" src=<%=src %>></td>
      	</tr>
      	<tr height="10px"></tr>
      </table>
      </div></li>
      <%}else{ %>
      	<%
      		ArrayList<CLASSDTO> cateArr = new ArrayList<CLASSDTO>();
      		for(int i = 0; i < arr.size(); i++){
      			if(user.getRecomm().equals(arr.get(i).getCategory())){
      				cateArr.add(arr.get(i));
      			}
      		}
      	%>
      	<%for(int i = 0; i < cateArr.size() ;i ++){ %>
      	<li><div>
		      <table style="max-width: 100%; height:400px;">
		      <tr height="10px"></tr>
		      	<tr height="380px">
		      	<td width="15%"><!--1�� ����--> </td>
		      	<td width="30%"><!--2�� ����--> 
		      		<div width="100%" height="100%"> 
		      			<div>
		      			<h3>"<%=user.getName()%>" ���� ��õ ����</h3> 
		      			</div>
		      			<br>
		      			<div>
		      			<h3><%=cateArr.get(i).getTitle() %></h3> 
		      			<br>
		      			<h4><%=cateArr.get(i).getTime() %></h4> 
		      			</div>
		      			<br>
		      			<a style="font-weight:bold; border-bottom :2px solid #0B2F3A; font-size:20px;  color:#0B2F3A;"class="goServey" href="class_detail.jsp?class_id=<%= cateArr.get(i).getId()%>"><I>���� ����</I></a> 
		      			<%-- �̰� �̿��ؼ� class_id �����ϸ� �ǰٴ� --%>
		      		</div> 
		      	</td>
		      	<td width="1%"><!--3�� ����--></td>
		      	<td width="10%"><!--4�� ����--></td>
		      	<td width="50%"><img style="max-width: 100%; height:380px;" alt="" src=<%=cateArr.get(i).getImage() %>></td>
		      	</tr>
		      	<tr height="10px"></tr>
		      </table>
	      </div></li>
      	<%} %>
      <%} %>
    </ul>
  </div>
  </div>

		<!-- Page info end -->


	<!-- search section -->

	<h3 align="center" style="margin-top: 100px"><span>"${param.search1 }" / "${param.search2 }"(��)�� �Է��� ����Դϴ�</span></h3>
	<section class="search-section ss-other-page sticky">
		<div class="container">
			<div class="search-warp">
				<div class="section-title text-white">
				</div>
				<div class="row">
					<div class="col-lg-10 offset-lg-1" style="text-align:center;">
						<!-- search form -->
						
						
						<table style = "margin:auto;">
						<tr><td>
						<form action="main_recomm.jsp" method="get" class="course-search-form">
							<select name="search1" style="width: 160px; height: 50px; padding: 0px 20px;">
								<option value="�׸� ����">�׸� ����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����" >����</option>
							</select>
							<input type="text" placeholder="�˻��� ������ �Է��ϼ���" name="search2" style="width: 250px; height: 50px;" value="${param.search2 }" class = "search"/>
							<!-- <input type="text" class="last-m" placeholder="�з�"> -->
							<!-- <button class="site-btn btn-dark">���� ã�ƺ���</button> -->
							<input type="submit" class="site-btn3" id="search" value="���� ã�ƺ���" style="width: 150px; height: 50px;"> <!-- onClick="alert('0���� ������ �˻��Ǿ����ϴ�.')"--> 
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
		<div><h3 align="center">Category</h3></div>
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
				<li class="control" data-filter=".recomm">��õ</li>
			</ul>                                       
			<div class="row course-items-area" >
			<%if(arr2 != null){ %>
				<%for(int i = 0; i < arr2.size(); i++){  %>
				<!-- course -->
				 <%String url = "class_detail.jsp?class_id=" + Integer.toString(arr2.get(i).getId());%>
				<div class="mix col-lg-3 col-md-4 col-sm-6 <%=arr2.get(i).getCategory() %>">
					<div class="course-item">
						<a href=<%=url %> ><div class="course-thumb set-bg" data-setbg=<%=arr2.get(i).getImage() %>>
							<%--<div class="price" ></div> --%>
						</div></a>
						<div class="course-info" style="background: white; border:3px solid #FEA698; border-top:1px solid white;">
							<div class="course-text" style="height: 180px;">
							
							<a href=<%=url %> ><h5> <%=arr2.get(i).getTitle() %></h5></a>
								<div class="students"><%=arr2.get(i).getPrice() %></div>
							</div>
							<div class="course-author" style="border-top:1px solid #FEA698; height: 85px;">
								
								<div class="ca-pic set-bg" data-setbg= <%=arr2.get(i).getIcon() %>></div>
								
								<p><%=t_dao.who(arr2.get(i).getTeacher_id()) %><br> <span><%=arr2.get(i).getTime() %></span></p>
								
							</div>
						</div>
					</div>
				</div>
				<%} %>
				<%} %>
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

	<div style="height: 50px"></div>
	<!-- footer section -->
	
	<footer class="footer-section spad pb-0" style="border-top:1px solid #FEA698;">
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
							<input type="email" placeholder="�̸����� �Է����ּ���" style="background:white; border:3px solid #FEA698; border-radius: 12px; color:#0D3B66">
							<button class="site-btn">�����ϱ�</button>
							<p style="color:darkgray;">������ ���ŵ��� ���� ��� ���� �������� Ȯ�����ּ���</p>
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