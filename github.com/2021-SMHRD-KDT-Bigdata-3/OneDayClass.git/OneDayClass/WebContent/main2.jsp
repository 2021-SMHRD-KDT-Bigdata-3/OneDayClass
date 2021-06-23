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
	<!--<link href="googleapis.css" rel="stylesheet">  -->

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
	 *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:400px;overflow:hidden;}
    .slide ul{position:relative;height:100%;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;}
    .slide li:nth-child(1){background: linear-gradient(#d3fbfb,#fbf7b8);}
    .slide li:nth-child(2){background: linear-gradient(#fbf7b8,#facfd9);}
    .slide li:nth-child(3){background: linear-gradient(#ffcfc5, #d3fbfb);}
    .slide li:nth-child(4){background: linear-gradient(#fbfcdb, #e9defa);}

    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 20s infinite;}
    .slide li:nth-child(1){; animation-delay:0s} /*background: linear-gradient(#05FBFF, #1D62F0)*/
    .slide li:nth-child(2){background: linear-gradient(#E4FF14, #FF0000);animation-delay:5s}
    .slide li:nth-child(3){background: linear-gradient(#B9E609, #00D5FF);animation-delay:10s}
    .slide li:nth-child(4){background: linear-gradient(#E60909, #B000FF);animation-delay:15s}
    span{
    	font-family:'NanumSquareRound';
    }
     /* 100 / 8 = 12.5 */
    @keyframes fade {
      0% {opacity:0;}
      5% {opacity:1;}
      25% {opacity:1;}
      30% {opacity:0;}
      100% {opacity:0;}
    }


	.bg1{
		background-image: url("img/sample_banner1.jpg");
	}
	.bg2{
		background-image: url("img/sample_banner2.jpg");
	}
	.bg3{
		background-image: url("img/sample_banner1.jpg");
	}
	.bg4{
		background-image: url("img/sample_banner2.jpg");
	}



.course-item .course-info .course-author {
border-top:1px solid #FEA698;
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
						<a href="main.jsp"><img src="img/Logo.png"></a>   
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
	<div class="page-info-section set-bg" data-setbg="img/page-bg/banner.png">
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
      <li><div class = "bg1"><table style="max-width: 100%"><tr height="30px"></tr>
      	<tr height="340px"><td width="20%"></td>
      	<td width="30%"><h3>�źϸ� + �㸮����! �������� ������ ������? #�����ο #SNPE</h3></td>
      	<td width="10%"></td>
      	<td width="30%"><img width="400px" height="340px" src="http://img.taling.me/Content/Uploads/Cover/78053dddfbf6c5afa01bab9f7557bfe38e4362c2.jpg"></td>
      	<td width="20%"></td></tr>
      
      
      
      	<tr height="30px"></tr>
      </table></div></li>
      <li><div class = "bg2"><table><tr height="30px"></tr>
      	<tr height="340px"><td width="20%"></td>
      	<td width="30%"><h3>'��' �ٸ��İ� �ƴ϶� '���'�ٸ����� ����?!</h3></td>
      	<td width="10%"></td>
      	<td width="30%"><img width="500px" height="340px" src="http://img.taling.me/Content/Uploads/Cover/55fa208a18b09b2e3c02772346f439b0d4df8409.jpeg"></td>
      	<td width="20%"></td></tr>
      
      
      
      <tr height="30px"></tr>
      </table></div></li>
      <li><div class = "bg3"><table><tr height="30px"></tr>
       	<tr height="340px"><td width="20%"></td>
      	<td width="30%"><h3>�� û�㵿 ������ ����ũ�� ��Ƽ��Ʈ���� <br>���� ������ ������Ŭ����~</h3></td>
      	<td width="10%"></td>
      	<td width="30%"><img width="400px" height="340px" src="http://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/Cover/c84a49732713812e91ef9481db371338d9185937.jpg"></td>
      	<td width="20%"></td></tr>
      
      
      
      <tr height="30px"></tr>
      </table></div></li>
      <li><div class = "bg4"><table><tr height="30px"></tr>
      	<tr height="340px"><td width="20%"></td>
      	<td width="30%"><h3>3�ð� ���� ���� �ɿ� ���� ��� ��!</h3></td>
      	<td width="10%"></td>
      	<td width="30%"><img width="500px" height="340px" src="http://img.taling.me/Content/Uploads/Cover/77001f8bc6aeba3881d4ba52a285f79f3ba11b77.jpg"></td>
      	<td width="20%"></td></tr>
      
      
      
      <tr height="30px"></tr>
      </table></div></li>
    </ul>
  </div>
  </div>
</body>
</html>
		<!-- Page info end -->

	<!-- search section -->
	<section class="search-section ss-other-page">
		<div class="container">
			<div class="search-warp">
				<div class="section-title text-white">
				</div>
				<div class="row">
					<div class="col-lg-10 offset-lg-1" style="text-align:center;">
						<!-- search form -->
						<h2><span>�پ��� ���¸� ã�ƺ�����</span></h2>
						<br><br>
						<table style = "margin:auto;">
						<tr><td>
						<form action="main_recomm.jsp" method="get" class="course-search-form">
						<select name="search1" style="width: 160px; height: 50px;">
								<option value="�׸� ����">�׸� ����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option> 
						</select>
						<input type="text" placeholder="�˻��� ������ �Է��ϼ���" name="search2" style="width: 300px; height: 50px; "class = "search" >

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
				<%if(user != null){ %>
					<%if(user.getRecomm() == null){ %>
					<li class="control" data-filter=".recomm" id="recomm" onclick='beforeRecomm()'>��õ</li>
					<%}else{ %>
					<% String recomm = "." + user.getRecomm(); %>
					<li class="control" data-filter=<%=recomm %>>��õ</li>
				<%}} %>
			</ul>   
			                                   
			<div class="row course-items-area" >
				<%for(int i = 0; i < arr.size(); i++){  %>
				<%String url = "class_detail.jsp?class_id=" + Integer.toString(arr.get(i).getId());%> 
				<!-- course -->				 
				<div class="mix col-lg-3 col-md-4 col-sm-6 <%=arr.get(i).getCategory() %>">
					<div class="course-item">
						<a href=<%=url %> >
						<div class="course-thumb set-bg" data-setbg=<%=arr.get(i).getImage() %>>
							<%--<div class="price" ></div> --%>
						</div>
						</a>
						<div class="course-info" style="background: white; border:3px solid #FEA698; border-top:1px solid white">
							
							<!-- OneDay Class Card View -->
							<div class="course-text" >							
							<h5><a href="<%=url %>"> <%=arr.get(i).getTitle().substring(0, 20) %>������</a></h5>							
								<div class="students"><%=arr.get(i).getPrice() %></div>
							</div>							
							<div class="course-author"  style="border-top:1px solid solid #FEA698;">								
								<div class="ca-pic set-bg" data-setbg= <%=arr.get(i).getIcon() %>></div>								
								<p><%=t_dao.who(arr.get(i).getTeacher_id()) %><br> <span><%=arr.get(i).getTime() %></span></p>								
							</div>
							
						</div>
					</div>					
				</div>
				<%} %>
				</div>
				
				<!--  sample course 
				
				<div class="mix col-lg-3 col-md-4 col-sm-6 sports">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/2.jpg">
							<div class="price"></div>
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
				
				<div class="mix col-lg-3 col-md-4 col-sm-6 arts">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/3.jpg">
							<div class="price"></div>
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
				
				<div class="mix col-lg-3 col-md-4 col-sm-6 arts">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/4.jpg">
							<div class="price"></div>
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
				
				<div class="mix col-lg-3 col-md-4 col-sm-6 beautys">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/5.jpg">
							<div class="price"></div>
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
				
				<div class="mix col-lg-3 col-md-4 col-sm-6 medias">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/6.jpg">
							<div class="price"></div>
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
				
				<div class="mix col-lg-3 col-md-4 col-sm-6 etc">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/7.jpg">
							<div class="price"></div>
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
				
				<div class="mix col-lg-3 col-md-4 col-sm-6 etc">
					<div class="course-item">
						<div class="course-thumb set-bg" data-setbg="img/courses/8.jpg">
							<div class="price"></div>
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
				</div>-->
			

			<div class="featured-courses">
				<div class="featured-course course-item">
					<div class="course-thumb set-bg" data-setbg="img/courses/f-1.jpg">
						<div class="price"></div>
					</div>
					<div class="row">
						<div class="col-lg-6 offset-lg-6 pl-0" >
							<div class="course-info" style="background: white; border:3px solid #FEA698; border-left:1px solid white;">
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
						<div class="price"></div>
					</div>
					<div class="row">
						<div class="col-lg-6 pr-0">
							<div class="course-info" style="background: white; border:3px solid #FEA698; border-right:1px solid white;">
								<div class="course-text">
									<div class="fet-note">��õ ����</div>
									<h5>�����̿� �Բ��ϴ� �ϵ� �ڵ�</h5>
									<p>�ڵ��� �Դ� �Ŷ����? �԰� �� �� �ִ� �̴ϴ�! ���� ���� �ڵ��� ����!</p>
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
	<div style="height: 50px "></div>
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
							<li>ī�װ����� ���� ��ȸ �� �з� ���</li>
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
	<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		function beforeRecomm(){
			alert('���������� > ����м� �� ���� �Ϸ����ּ���!')
		}
	</script>
</body>
</html>