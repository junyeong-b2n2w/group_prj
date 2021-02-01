<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<!Doctype html>
<html>
  <head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Language" content="en" />
    <meta name="msapplication-TileColor" content="#2d89ef">
    <meta name="theme-color" content="#4188c9">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <link rel="icon" href="favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" type="image/x-icon" href="./favicon.ico" />
    <!-- Generated: 2018-04-16 09:29:05 +0200 -->
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tabler.css">
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
     />
<title></title>

  <style>
  #sortable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
  #sortable li { margin: 20px 10px 1px 1px;
    padding: 15px;
    float: left;
    width: 390px;
    height: 220px;
    text-align: center;
    background: white;}
    
    
    
   #gallery { float: left; width: 100%; min-height: 12em; margin-left: 40px; }
  .gallery.custom-state-active { background: #eee; }
  .gallery li { float: left; width: 90px; height:96px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center; }
  .gallery li h5 { margin: 0 0 0.4em; cursor: move; }
  .gallery li a { float: right; }
  .gallery li a.ui-icon-zoomin { float: left; }
  .gallery li img { width: 50px; height:50px; cursor: move; }
  
  #trash { position:fixed; bottom:0px; width: 98%; min-height: 18em; padding: 1%;  }
  #trash h4 { line-height: 16px; margin: 0 0 0.4em; }
  #trash h4 .ui-icon { float: left; }
  .ui-widget{
  	width: 100%;
  }
 
 
nav {
	position: fixed;
    right: 0px;
    height: 100%;
    width: 20%;
    transition: all 800ms cubic-bezier(.8, 0, .33, 1);
    border-radius: 0% 0% 100% 50%;
    z-index: 1;
}

.nav-open {
    transform: translateX(0px);
    border-radius: 0% 0% 0% 0%;
	background: rgba(255, 255, 255, 0.6);
	z-index: 1;
}

 .menu-btn {
  position: absolute;
    top: 15%;
    right: 3%;
    padding: 0;
    width: 30px;
    cursor: pointer;
    z-index: 2;
}

 .menu-btn .line {
    padding: 0;
    width: 30px;
    background: #fff;
    height: 2px;
    margin: 5px 0;
    transition: all 700ms cubic-bezier(.9, 0, .33, 1);
}

 .menu-btn .line.line--1 {
    width: 30px;
    transform: rotate(0) translateY(0);
    background: black;
}

 .menu-btn .line.line--1.line-cross {
    width: 30px;
    transform: rotate(45deg) translateY(10px);
    
	 background: rgba(0,0,0,0.6);
}

 .menu-btn .line.line--2 {
    width: 28px;
    transform: translateX(0);
    background: black;
}

 .menu-btn .line.line--2.line-fade-out {
    width: 28px;
    transform: translate(30px);
    opacity: 0;
}

 .menu-btn .line.line--3 {
    width: 20px;
    transform: rotate(0) translateY(0);
    background: black;
}

 .menu-btn .line.line--3.line-cross {
    width: 30px;
    transform: rotate(-45deg) translateY(-10px);
	 background: rgba(0,0,0,0.6);
}

 .nav-links {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    transform: translateX(100px);
    opacity: 0;
    transition: all 900ms cubic-bezier(.9, 0, .33, 1);
}

.nav-links.fade-in {
    opacity: 1;
    transform: translateX(0px);
}

 .nav-links .link {
    margin: 20px 0;
    text-decoration: none;
    font-family: sans-serif;
    color: rgba(0,0,0,0.9);
    font-weight: 700;
    text-transform: uppercase;
    font-size: 1.2rem;
    transition: all 300ms cubic-bezier(.9, 0, .33, 1);
}

 .nav-links .link:hover {
    color: rgba(0, 0, 0, .5);
}


.inform{
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: rgba(255, 255, 255, 0.8);
	font-size: 2rem;
	font-family: sans-serif;
	text-transform: uppercase;
	letter-spacing: 5px;
	text-shadow: 0 0 20px rgba(0,0,0,0.6);
}

.support{
	position: absolute;
	right: 10px;
	bottom: 10px;
	padding: 10px;
	display: flex;
}
a{
	color: #222;
	transition: all 400ms ease;
}

a:hover{
	color: #222;
}


.navbar-expand-md .navbar-collapse {
    width: auto;
    flex: 0 1 auto;
}

.ztree li span{
	color:#fff;
}

#asidenonedelete{
	margin-top: -17px;
    margin-left: 20px;
    display:none;
    }

.navbar-nav{
margin-left: 30px;

}


/* .navbar-vertical.navbar-expand-lg{ */
/* width: 18.6rem; */
/* } */

.left_on{
	padding-left:13rem;
	transition:0.5s;
}

.left_on_btn{
	position:fixed;
	top:15px;
	left:-10px;
	width:20px;
	z-index:9999;
    color:dark;
    padding : 10px 30px;
    border:none;
    transition:0.5s;
    
}
.left_on_btn_active{
	left:140px;
	color:white;
	background-color:dark;
	transition:0.5s;
}


.left_to_left{
	left: -13rem !important;
}



  </style>

</head>
<body class="antialiased" id="showBoardListOnLoad">

	
	  	<i class="fas fa-bars left_on_btn left_on_btn_active"></i>
	  	
	  	
    <div class="page left_on" id="fullPage" style="transition:0.5s;" >
      <header class="navbar navbar-expand-md navbar-light d-print-none" style="transition:0.5s;">
        <div class="container-fluid">
           <div class="collapse navbar-collapse" id="navbar-menu">
            <div class="d-flex flex-column flex-md-row flex-fill align-items-stretch align-items-md-center">
             <a href="<%=request.getContextPath()%>/index.do">
               <img id="logo" class="ml-5" alt="logo" src="<%=request.getContextPath()%>/resources/img/logo.png" style="width: 100px;  height: 40px;">
               </a>
              <ul class="navbar-nav">
               <c:forEach items="${menuList }" var="menu">
               	<li class="nav-item">
                  <a class="nav-link" href="javascript:subMenu('${menu.menu_no }');goPage('${menu.menu_url }','${menu.menu_no}');" >
                    <span class="nav-link-title navbar-brand">
                      		${menu.menu_nm } 
                    </span>
                  </a>
                </li>
               </c:forEach>
	               <li class="nav-item">
	                  <a class="nav-link" href="javascript:subMenu('M990000');goPage('/role/main','M990000');" >
	                    <span class="nav-link-title navbar-brand">
	                      		관리메뉴
	                    </span>
	                  </a>
	                </li>
	                <sec:authorize access="hasRole('ROLE_ADMIN')">
	                <li class="nav-item">
	                  <a class="nav-link" href="javascript:subMenu('A000000');goPage('/admin/main','A000000');" >
	                    <span class="nav-link-title navbar-brand">
	                      		<button class="btn btn-outline-primary">관리자</button>
	                    </span>
	                  </a>
	                </li>
	                 </sec:authorize>
              </ul>
            </div><!-- d-flex -->
          </div><!-- collapse navbar -->
          <div class="navbar-nav flex-row order-md-last">
         
          <!-- 알림 -->
          <div class="nav-item dropdown d-none d-md-flex me-3 mr-5" style="left:auto;right:10px;">
              <a href="#" class="nav-link px-0" data-toggle="dropdown" tabindex="-1" aria-label="Show notifications" aria-expanded="false" onclick="goAlramPageNation();">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M10 5a2 2 0 0 1 4 0a7 7 0 0 1 4 6v3a4 4 0 0 0 2 3h-16a4 4 0 0 0 2 -3v-3a7 7 0 0 1 4 -6"></path><path d="M9 17v1a3 3 0 0 0 6 0v-1"></path></svg>
                <span class="badge bg-red"></span>
              </a>
              <div class="dropdown-menu dropdown-menu-center dropdown-menu-card" style="min-width: 250px;max-width: 300px;">
               <div class="card" style="height: 300px;">
                <div class="card-body card-body-scrollable card-body-scrollable-shadow lastdiv">
                  <div class="divide-y-4" id="alramList">
                   <!--  <div>
                      <div class="row">
                        <div class="col">
                          <div class="text-truncate">
                            <strong>Jeffie Lewzey</strong> commented on your <strong>"I'm not a witch."</strong> post.
                          </div>
                          <div class="text-muted">yesterday</div>
                        </div>
                        <div class="col-auto align-self-center">
                          <a href="#" class="text-muted" >
                          <i class="far fa-window-close" style="color: #1a569d;font-size: 25px;"></i>
                        </a>
                        </div>
                      </div>
                    </div> --> 
                  </div>
                </div>
                <div class="card-footer d-flex align-items-center" id="alrampaginationDiv">
                </div>
              </div>
              </div>
            </div>
       
        
            
          </div>
          <!-- !메인바 -->

     </header>
       <!-- 사이드 메뉴 --> 
   <!--    
				<div class="pages">
					<div class="menu-btn">
						<div class="line line--1"></div>
						<div class="line line--2"></div>
						<div class="line line--3"></div>
					</div>
					<nav class="navside d-none">
						<div class="nav-links">
							<div class="ui-widget ui-helper-clearfix">
								<ul id="gallery"
									class="gallery ui-helper-reset ui-helper-clearfix">
									<c:forEach items="${menuList }" var="menu">
										<li class="ui-widget-content ui-corner-tr"><i
											class="fa fa-scissors d-none ss" aria-hidden="true"></i>
											<h5 class="ui-widget-header">${menu.menu_nm }</h5> <img
											alt="${menu.menu_nm }"
											src="<%=request.getContextPath()%>/resources/img/${menu.menu_nm}.PNG">
											<a href="images/high_tatras.jpg" title="View larger image"
											class="ui-icon ui-icon-zoomin">View larger</a></li>
									</c:forEach>

								</ul>

								<div class="col-6 col-sm-4 col-md-2 col-xl mb-3"
									onclick="back();">
									<a href="#" class="btn btn-outline-secondary"
										style="border-radius: 45%; width: 0px; height: 25px; margin-left: 290px; margin-top: 50px;">
										<i class="fas fa-cog fa-1x"
										style="margin-left: 7px; margin-top: 5px;"></i>
									</a>
								</div>
								<div id="trash"
									class="ui-widget-content ui-state-default d-none">
									<h4 class="ui-widget-header">
										<span class="ui-icon ui-icon-trash">숨김</span> 숨김 <i
											class="fas fa-minus"
											style="position: absolute; right: 0; margin-right: 10px;"
											onclick="hiddenbar();"></i>
									</h4>
								</div>
							</div>
						</div>
					</nav>
				</div>
       -->
      
      
<!-- 좌측 사이드바  -->
    <aside class="navbar navbar-vertical navbar-expand-lg navbar-dark " id="left_bar" style="transition:0.5s;" >
        <div class="container-fluid">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu">
            <span class="navbar-toggler-icon"></span>
          </button>
          <h1 class="navbar-brand navbar-brand-autodark">
            <a href=".">
             
            </a>
         </h1>
        
        	 <!-- 회원정보 -->
         	 <div class="nav-item dropdown mx-2 mt-5  " >
         	  
            
              <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-toggle="dropdown" aria-label="Open user menu" aria-expanded="false">
                <img class="avatar avatar-sm" src="<%=request.getContextPath() %>/img/getImg?fileName=${empVO.emp_pic}"></img>
                &nbsp;&nbsp;
                <div class="d-none d-xl-block ps-2">
                  <div class="d-flex justify-content-end">${loginUser.emp_nm }&nbsp;${loginUser.emp_pos }  </div>
                  <div class="mt-1 small text-muted">${loginUser.comp_nm}&nbsp;${loginUser.dept_nm}</div>
                </div>
                
              </a>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <a href="#" class="dropdown-item">Set status</a>
                <a href="#" class="dropdown-item">Profile &amp; account</a>
                <a href="#" class="dropdown-item">Feedback</a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">Settings</a>
                <a href="<%=request.getContextPath() %>/common/logout.do" class="dropdown-item" id="logoutBtn">Logout</a>
              </div>
            </div>
          <div class="collapse navbar-collapse" id="navbar-menu">
            <ul class="navbar-nav pt-lg-3 subMenuList" style="flex-grow: 0;margin-top: 60px;">
            
            </ul>
            
         <div id="asidenonedelete" class="showTreeHide" >
            <ul id="treeDemo" class="navbar-nav pt-lg-3  ztree" >
            
            </ul>
         </div>
          
          </div>
          
         
        </div>
      </aside>  
<!-- End 좌측 사이드바  --> 
    
		

 
	<script>
	leftBtn = document.querySelector('.left_on_btn');
	fullPage =  document.querySelector('#fullPage');
	leftBar = document.querySelector('#left_bar');
	logo = document.querySelector('#logo');
	header = document.querySelector('header');
	
	leftBtn.addEventListener('click', function(){
	    if(fullPage.classList.contains('left_on')){
		    fullPage.classList.remove('left_on');
		    leftBar.classList.add('left_to_left');
		    leftBtn.classList.remove('left_on_btn_active');
        }else{
            fullPage.classList.add('left_on');
			leftBar.classList.remove('left_to_left');
            leftBtn.classList.add('left_on_btn_active');
        }
	})
	function leftColse(){
		fullPage.classList.remove('left_on');
 	    leftBar.classList.add('left_to_left');
	    leftBtn.classList.remove('left_on_btn_active');
	}
	function leftOpen(){
		fullPage.classList.add('left_on');
        leftBar.classList.remove('left_to_left');
        leftBtn.classList.add('left_on_btn_active');
	}
	
	
	
	
	</script>
      