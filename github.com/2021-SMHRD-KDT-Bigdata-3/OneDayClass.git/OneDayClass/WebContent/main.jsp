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

	<title>하루클래스-나를 위한 시간</title>
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

<!-- 메인 배경 -->
	
	<style>
	
	.header-section {
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    right: 0;
    padding-top: 20px;
    z-index: 5;
    background-color: white;
    height: 100px;
    box-shadow: inset 0 -1px 0 0 white;
	}
	.sticky{
		position: sticky;
		top: 100px;
		left: 0;
        right: 0;
		z-index: 5;
		background-color: white;
		box-shadow: inset 0 -1px 0 0 white;
	}
	
	
	
	 *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:400px;overflow:hidden;}
    .slide ul{position:relative;height:100%;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;}
    .slide li:nth-child(1){background-image:url("img/banner_image.jpg");}/*background: linear-gradient(#d3fbfb,#fbf7b8);*/
    .slide li:nth-child(2){background-image:url("img/banner_image.jpg");}/*background: linear-gradient(#fbf7b8,#facfd9);*/
    .slide li:nth-child(3){background-image:url("img/banner_image.jpg");}/*background: linear-gradient(#ffcfc5, #d3fbfb);*/
    .slide li:nth-child(4){background-image:url("img/banner_image.jpg");}/*background: linear-gradient(#fbfcdb, #e9defa);*/
    .slide li:nth-child(5){background-image:url("img/banner_image.jpg");}/*background: linear-gradient(#fbf7b8,#facfd9);*/

    span{
    	font-family:'NanumSquareRound';
    }

.course-item .course-info .course-author {
border-top:1px solid #FEA698;}


	.bg1{
		
		background-image: url("img/banner_arts3.png");
	}
	.bg2{
		
		background-image: url("img/banner_sports3.png");
	}
	.bg3{
		
		background-image: url("img/banner_food3.png");
	}
	.bg4{
		
		background-image: url("img/banner_music3.png");
	}

.course-item .course-info .course-author {
border-top:1px solid #FEA698;
}
.search-section.ss-other-page .search-warp {
	position: relative;
	padding: 20px 0;
	box-shadow: inset 0 -1px 0 0 white;
}
body{
	height: 600%;
}

.goServey{
	position:absolute;
	left:1200px;
	top: 30px;
	z-index: 1;
}
.goServey2{
	position:absolute;
	z-index: 1;
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
.content_img{
	border-radius: 1%;
	box-shadow: 0px 0px 20px #000;


}

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
  }, 4000)
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
	<header class="header-section" >
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="site-logo">
						<a href="main.jsp"><img src="img/Logo3.png" style="max-width: 150px;"></a>   
					</div>
					<div class="nav-switch">
						<i class="fa fa-bars"></i>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<%if (user == null && teacher == null) {%>
					<a href="login_main.html" class="site-btn header-btn" style="color:#323232;">로그인</a>
					<a href="register_main.html" class="site-btn2 header-btn" style="color:#323232;">회원가입</a>
	
					<% }else if(user != null && op.equals("user")){ %> 
						<% if(user.getId().equals("admin")){ %>
							<a href="logout" class="site-btn header-btn" style="color:#323232;">로그아웃</a>
							<a href="#" class="site-btn2 header-btn" style="color:#323232;">회원관리</a>
						<%} else { %>
							<a href="logout" class="site-btn header-btn" style="color:#323232;">로그아웃</a>
							<a href="mypage_user.jsp" class="site-btn2 header-btn" style="color:#323232;">마이페이지</a>
					
						<% } %>
					
					<%}else if(op.equals("teacher") && teacher != null){ %>
						<% if(teacher.getTeacher_id().equals("admin")){ %>
							<a href="logout" class="site-btn header-btn">로그아웃</a>
							<a href="#" class="site-btn2 header-btn">회원관리</a>
						<%} else { %>
							<a href="logout" class="site-btn header-btn">로그아웃</a>
							<a href="mypage_teacher.jsp" class="site-btn2 header-btn" style="color:#323232;">마이페이지</a>
						<% } %>
					<%} %>
					<!--<nav class="main-menu">
						<ul>
							<li><a href="index.html">메인</a></li>
							<li><a href="#">서비스 소개</a></li>
							<li><a href="courses.html">개설 강좌</a></li>
							<li><a href="blog.html">소식</a></li>
							<li><a href="contact.html">문의하기</a></li>
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
				<a href="#">메인</a>
				<span>개설 강좌</span>
			</div> -->
		</div>
	</div>
	<!-- Page info end -->
	
	<!-- Page info 2  배너 -->
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
      <table style="width:100%; background-image: url('img/banner_image.jpg');">
      <tr height="10px"></tr>
      	<tr height="380px">
      	<td width="15%"><!--1번 구역--> </td>
      	<td width="30%"><!--2번 구역--> 
      		<div width="100%" height="100%"> 
      			<h2>원데이클래스 맞춤형 추천 서비스!</h2>
      			<h4>개인별 성향 조사를 통해 맞춤형 강좌를 추천해드립니다.</h4>
      			<br>
      			<a class="goServey2" style="font-weight:bold; border-bottom :2px solid #0B2F3A; font-size:20px;  color:#323232;" href="hobby_survey.jsp"><I>성향 분석 및 추천 받기!</I></a>
      			<%-- 이걸 이용해서 class_id 전달하면 되겟다 --%>
      		</div> 
      	</td>
      	<td width="5%"><!--3번 구역--></td>
      	<td width="10%"><!--4번 구역--></td>
      	<td width="40%"><img class = "content_img" alt="" src=<%=src %> style = "height:340px;"></td>
      	</tr>
      	<tr height="10px"></tr>
      </table>
      </div></li>
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
      	<li><div class="img-blurred-edge">
		      <table style="max-width: 100%; height:400px;">
		      <tr height="10px"></tr>
		      	<tr height="380px">
		      	<td width="15%"><!--1번 구역--> </td>
		      	<td width="30%"><!--2번 구역--> 
		      		<div width="100%" height="100%"> 
		      			<div>
		      			<h4 style="color:#323232;">"<%=user.getName()%>" 님의 추천 강좌</h4> 
		      			</div>
		      			<br>
		      			<div>
		      			<a href="class_detail.jsp?class_id=<%= cateArr.get(i).getId()%> " class="goServey2"><I><h3 style="color:black;"><%=cateArr.get(i).getTitle() %></h3> </I></a>
		      			<br>
		      			<br>
		      			<h5 style="color:black;"><%=cateArr.get(i).getTime() %></h5> 
		      			</div>
		      			<br>

		      			<a style="font-weight:bold; border-bottom :2px solid #0B2F3A; font-size:20px;  color:black;"class="goServey" href="class_detail.jsp?class_id=<%= cateArr.get(i).getId()%>"><I>내용 보기</I></a> 

		      			<%-- 이걸 이용해서 class_id 전달하면 되겟다 --%>
		      		</div> 
		      	</td>
		      	<td width="1%"><!--3번 구역--></td>
		      	<td width="10%"><!--4번 구역--></td>
		      	<td width="50%"><a href="class_detail.jsp?class_id=<%= cateArr.get(i).getId()%>">
		      	
		      	<img style="max-width: 100%; height:340px;" class = "content_img goServey" alt="" src=<%=cateArr.get(i).getImage() %>></a></td>
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
	<h2 align="center" style="margin-top: 100px; color:black;"><span>다양한 강좌를 찾아보세요</span></h2>
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
						<select name="search1" style="width: 160px; height: 50px; text-align-last: center; color:#323232;">
								<option value="항목 선택">항목 선택</option>
								<option value="제목">제목</option>
								<option value="내용">내용</option>
								<option value="강사">강사</option> 
						</select>
						<input type="text" placeholder="검색할 내용을 입력하세요" name="search2" style="width: 300px; height: 50px; text-align:center; "class = "search" >

						<!-- <input type="text" class="last-m" placeholder="분류"> -->
						<!-- <button class="site-btn btn-dark">과정 찾아보기</button> -->
						<input type="submit" class="site-btn3" id="search" value="과정 찾아보기" style="width: 150px; height: 50px; color:#323232;"> <!-- onClick="alert('0건의 과정이 검색되었습니다.')"--> 
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
		<div><h3 align="center" style="color:black;">Category</h3></div>
		<div class="course-warp">
			<ul class="course-filter controls">
				<li class="control active" data-filter="all"  style="color:#323232;">All</li>
				<li class="control" data-filter=".arts"  style="color:#323232;">공예</li>
				<li class="control" data-filter=".medias"  style="color:#323232;">사진</li>
				<li class="control" data-filter=".sport"  style="color:#323232;">운동</li>
				<li class="control" data-filter=".food"  style="color:#323232;">요리</li>
				<li class="control" data-filter=".music"  style="color:#323232;">음악</li>
				<li class="control" data-filter=".certificate"  style="color:#323232;">자격증</li>
				<li class="control" data-filter=".finance"  style="color:#323232;">제테크</li>
				<li class="control" data-filter=".beautys"  style="color:#323232;">뷰티</li>
				<%if(user != null){ %>
					<%if(user.getRecomm() == null){ %>
					<li class="control" data-filter=".recomm" id="recomm" onclick='beforeRecomm()'>추천</li>
					<%}else{ %>
					<% String recomm = "." + user.getRecomm(); %>
					<li class="control" data-filter=<%=recomm %>>추천</li>
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
						<div class="course-info" style="background: white; border:3px solid #FEA698; border-top:1px solid white; ">
							<div class="course-text" style="height: 180px; color:black;">							
							<a href=<%=url %> ><h5 style="color:black;"> <%=arr.get(i).getTitle() %></h5></a>							
								<div class="students" style="color:#323232; font-size:15px;"><%=arr.get(i).getPrice() %></div>
							</div>							
							<div class="course-author"  style="height:85px;">								
								<div class="ca-pic set-bg" data-setbg= <%=arr.get(i).getIcon() %>></div>								
								<p><%=t_dao.who(arr.get(i).getTeacher_id()) %><br> <span style="color:black;"><%=arr.get(i).getTime() %></span></p>								
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
								<h5>허경영과 축지법 하기</h5>
								<p>북쪽에 장군님도 하신다는 셀럽 필수 능력!</p>
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
								<h5>이준석 당대표와 점심식사</h5>
								<p>자칭 워렌 버핏을 꿈꾸는 야망가와의 식사!</p>
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
								<h5>전광훈 목사와 태극기집회</h5>
								<p>방역 수칙과는 대척점에 있는 자가격리 직행 티켓!</p>
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
								<h5>빅데이터 과정 수강</h5>
								<p>스몰데이터는 왜 없을까? 그 궁금증을 해결해 준다!</p>
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
								<h5>인공지능 과정 수강</h5>
								<p>내 머리가 나쁜 이유를 기계를 통해 밝히다!</p>
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
								<h5>쿠팡맨 배송 교육</h5>
								<p>로켓 타고 배송한다는 쿠팡맨의 배송 현장을 가다!</p>
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
								<h5>맨투맨 판매 교육</h5>
								<p>생존 창업의 기본 중에 기본을 배우다!</p>
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
									<div class="fet-note" style="color:#323232;">인기 강좌</div>
									<h5 style="color:black;">하형이와 함께하는 즐거운 크롤링</h5>
									<p>크롤링~ 롤링~ 롤링~ 저절로 노래가 나올 정도의 여유 가득한 데이터 수집의 달인!</p>
									<div class="students">120 Students</div>
								</div>
								<div class="course-author">
									<div class="ca-pic set-bg" data-setbg="img/authors/1.jpg"></div>
									<p>강하형, <span>프로젝트 실무 총괄</span></p>
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
									<div class="fet-note" style="color:#323232;">인기 강좌</div>
									<h5 style="color:black;">현진이와 함께하는 하드 코딩</h5>
									<p>코딩이 먹는 거라고요? 먹고 살 수 있는 겁니다! 리얼 생존 코딩의 진수!</p>
									<div class="students">120 Students</div>
								</div>
								<div class="course-author">
									<div class="ca-pic set-bg" data-setbg="img/authors/2.jpg"></div>
									<p>안현진, <span>프로젝트 기획 총괄</span></p>
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
				<h2>회원가입 후 서비스를 즐겨주세요!</h2>
				<p>개인별 맞춤형 원데이클래스 추천 서비스를 위해서는 가입이 필요합니다!</p>
			</div>
			<div class="text-center pt-5">
				<a href="register_form.html" class="site-btn">회원가입</a>
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
						<h4 style="color:black;">문의하기</h4>
						<ul class="contact-list" style="color:#323232;">
							<li>광주광역시 남구<br>송암로 60 광주CGI센터 2층</li>
							<li>080-335-0020</li>
							<li>test@smhrd.com</li>
						</ul>
					</div>
					<div class="widget-item">
						<h4 style="color:black;">주요 서비스</h4>
						<ul class="contact-list" style="color:#323232;">
							<li>원데이클래스 개인 맞춤형 추천</li>
							<li>제목/내용/지역/강사 등 검색 기능</li>
							<li>카테고리별 강좌 조회 및 분류 기능</li>
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
						<h4 style="color:black;">소식지</h4>
						<form class="footer-newslatter">
							<input type="email" placeholder="이메일을 입력해주세요" style="background:white; border:3px solid #FEA698; border-radius: 12px; color:#0D3B66">
							<button class="site-btn">구독하기</button>
							<p style="color:darkgray;">메일이 수신되지 않을 경우 스팸 메일함을 확인해주세요</p>
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This webpage is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://www.smhrd.or.kr" target="_blank">하루살이</a>
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
			alert('마이페이지 > 성향분석 을 먼저 완료해주세요!')
		}
	</script>
</body>
</html>