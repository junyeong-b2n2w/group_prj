<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    


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
    <script src="assets/js/require.min.js"></script>
   
   
    <!-- Dashboard Core -->
    <link href="assets/css/dashboard.css" rel="stylesheet" />
    <script src="assets/js/dashboard.js"></script>
    <!-- c3.js Charts Plugin -->
    <link href="assets/plugins/charts-c3/plugin.css" rel="stylesheet" />
    <script src="assets/plugins/charts-c3/plugin.js"></script>
    <!-- Google Maps Plugin -->
    <link href="assets/plugins/maps-google/plugin.css" rel="stylesheet" />
    <script src="assets/plugins/maps-google/plugin.js"></script>
    <!-- Input Mask Plugin -->
    <script src="assets/plugins/input-mask/plugin.js"></script>
    
    
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
     <link rel="stylesheet" href="https://unpkg.com/@tabler/core@1.0.0-alpha.13/dist/css/tabler.min.css">
     
      <style>
  #sortable { list-style-type: none; margin: 0; padding: 0; width: 450px; }
  #sortable li { margin: 60px 47px 3px 3px;
    padding: 1px;
    float: left;
    width: 100px;
    height: 90px;
    text-align: center; }
    
   #gallery { float: left; width: 100%; min-height: 12em; }
  .gallery.custom-state-active { background: #eee; }
  .gallery li { float: left; width: 90px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center; }
  .gallery li h5 { margin: 0 0 0.4em; cursor: move; }
  .gallery li a { float: right; }
  .gallery li a.ui-icon-zoomin { float: left; }
  .gallery li img { width: 100%; cursor: move; }
 
  #trash { position:fixed; bottom:0px; width: 98%; min-height: 18em; padding: 1%; }
  #trash h4 { line-height: 16px; margin: 0 0 0.4em; }
  #trash h4 .ui-icon { float: left; }
  .ui-widget{
  	width: 100%;
  }
 
 
nav {
	position: fixed;
    right: 0px;
    height: 100%;
    width: 400px;
    transition: all 800ms cubic-bezier(.8, 0, .33, 1);
    border-radius: 0% 0% 100% 50%;
    z-index: 1;
    
}

nav.nav-open {
    transform: translateX(0px);
    border-radius: 0% 0% 0% 0%;
	 background: rgba(255, 255, 255, 0.6);
	 z-index: 1;
}

nav .menu-btn {
  position: absolute;
    top: 2%;
    right: 4%;
    padding: 0;
    width: 30px;
    cursor: pointer;
    z-index: 2;
}

nav .menu-btn .line {
    padding: 0;
    width: 30px;
    background: #fff;
    height: 2px;
    margin: 5px 0;
    transition: all 700ms cubic-bezier(.9, 0, .33, 1);
}

nav .menu-btn .line.line--1 {
    width: 30px;
    transform: rotate(0) translateY(0);
    background: black;
}

nav .menu-btn .line.line--1.line-cross {
    width: 30px;
    transform: rotate(45deg) translateY(10px);
    
	 background: rgba(0,0,0,0.6);
}

nav .menu-btn .line.line--2 {
    width: 28px;
    transform: translateX(0);
    background: black;
}

nav .menu-btn .line.line--2.line-fade-out {
    width: 28px;
    transform: translate(30px);
    opacity: 0;
}

nav .menu-btn .line.line--3 {
    width: 20px;
    transform: rotate(0) translateY(0);
    background: black;
}

nav .menu-btn .line.line--3.line-cross {
    width: 30px;
    transform: rotate(-45deg) translateY(-10px);
	 background: rgba(0,0,0,0.6);
}

nav .nav-links {
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

nav .nav-links.fade-in {
    opacity: 1;
    transform: translateX(0px);
}

nav .nav-links .link {
    margin: 20px 0;
    text-decoration: none;
    font-family: sans-serif;
    color: rgba(0,0,0,0.9);
    font-weight: 700;
    text-transform: uppercase;
    font-size: 1.2rem;
    transition: all 300ms cubic-bezier(.9, 0, .33, 1);
}

nav .nav-links .link:hover {
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
	margin: 0 20px;
	color: #fff;
	transition: all 400ms ease;
}

a:hover{
	color: #222;
}
  </style>
  </head>
 <body class="antialiased">
    <div class="page" >
      <header class="navbar navbar-expand-md navbar-light d-print-none">
        <div class="container-xl">
         
          <div class="navbar-nav flex-row order-md-last">
          
            <div class="nav-item dropdown">
              <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu">
                <span class="avatar avatar-sm" style="background-image: url(./static/avatars/000m.jpg)"></span>
                <div class="d-none d-xl-block ps-2">
                  <div>User Img</div>
                  <div class="mt-1 small text-muted">User Name</div>
                </div>
              </a>
              
              <div>
              <i class="fa fa-envelope-o" data-toggle="tooltip" title="" data-original-title="fa fa-envelope-o"></i>
              </div>
              
              
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <a href="#" class="dropdown-item">Set status</a>
                <a href="#" class="dropdown-item">Profile & account</a>
                <a href="#" class="dropdown-item">Feedback</a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">Settings</a>
                <a href="#" class="dropdown-item">Logout</a>
              </div>
            </div>
          </div>
          <div class="collapse navbar-collapse" id="navbar-menu">
            <div class="d-flex flex-column flex-md-row flex-fill align-items-stretch align-items-md-center">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="./index.html" >
                    <span class="nav-link-icon d-md-none d-lg-inline-block"><svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="5 12 3 12 12 3 21 12 19 12" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>
                    </span>
                    <span class="nav-link-title">
                      Home
                    </span>
                  </a>
                </li>
               
                <li class="nav-item">
                  <a class="nav-link" href="./form-elements.html" >
                    <span class="nav-link-icon d-md-none d-lg-inline-block"><svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="9 11 12 14 20 6" /><path d="M20 12v6a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h9" /></svg>
                    </span>
                    <span class="nav-link-title">
                      Forms
                    </span>
                  </a>
                </li>
                
               
                <li class="nav-item">
                  <a class="nav-link" href="./docs/index.html" >
                    <span class="nav-link-icon d-md-none d-lg-inline-block"><svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M14 3v4a1 1 0 0 0 1 1h4" /><path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" /><line x1="9" y1="9" x2="10" y2="9" /><line x1="9" y1="13" x2="15" y2="13" /><line x1="9" y1="17" x2="15" y2="17" /></svg>
                    </span>
                    <span class="nav-link-title">
                      Documentation
                    </span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        

      <!-- 사이드 메뉴 -->
      <div class="pages" style="overflow: hidden;">
     	<nav>
      <div class="menu-btn">
		<div class="line line--1"></div>
		<div class="line line--2"></div>
		<div class="line line--3"></div>
	 </div>
		<div class="nav-links">
	
  <div class="ui-widget ui-helper-clearfix">
 
<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">전자 결제</h5>
     <a href="images/high_tatras.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
  </li>
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">문서 관리함</h5>
     <a href="images/high_tatras.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
  </li>
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">근/태관리</h5>
     <a href="images/high_tatras.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
  </li>
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">일정관리</h5>
     <a href="images/high_tatras.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
  </li>
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">게시판</h5>
     <a href="images/high_tatras.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
  </li>
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">전자메일</h5>
     <a href="images/high_tatras.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
  </li>
 

</ul>
<div id="trash" class="ui-widget-content ui-state-default">
  <h4 class="ui-widget-header"><span class="ui-icon ui-icon-trash">숨김</span> 숨김</h4>
</div>
</div>
	</div>
      </nav>
      </div>
      </header>
      
      
      
      <section>
      
         <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Standard Buttons</h3>
                </div>
                <div class="card-body">
                  <div class="row g-2 align-items-center mb-n3">
                    <div class="col-12 col-xl-2 mb-3 font-weight-semibold">기본</div>
                    
                    <div class="col-6 col-sm-4 col-md-2 col-xl mb-3">
                      <a href="#" class="btn btn-primary w-100">
                        	등록
                      </a>
                    </div>
                    
                    <div class="col-6 col-sm-4 col-md-2 col-xl mb-3">
                      <a href="#" class="btn btn-warning w-100">
						수정
                      </a>
                    </div>
                    
                    <div class="col-6 col-sm-4 col-md-2 col-xl mb-3">
                      <a href="#" class="btn btn-danger w-100">
						삭제
                      </a>
                    </div>
                    <div class="col-6 col-sm-4 col-md-2 col-xl mb-3">
                      <a href="#" class="btn btn-secondary w-100">
                        Secondary
                      </a>
                    </div>
                   
                  </div>
                  
               <div class="row g-2 align-items-center mb-n3">
                    <div class="col-12 col-xl-2 mb-3 font-weight-semibold">배경 x</div>
                    <div class="col-6 col-sm-4 col-md-2 col-xl mb-3">
                      <a href="#" class="btn btn-outline-primary w-100">
                        	등록
                      </a>
                    </div>
                    
                    <div class="col-6 col-sm-4 col-md-2 col-xl mb-3">
                      <a href="#" class="btn btn-outline-warning w-100">
                       	 수정
                      </a>
                    </div>
                    <div class="col-6 col-sm-4 col-md-2 col-xl mb-3">
                      <a href="#" class="btn btn-outline-danger w-100">
                        	삭제
                      </a>
                    </div>
                    <div class="col-6 col-sm-4 col-md-2 col-xl mb-3">
                      <a href="#" class="btn btn-outline-secondary w-100">
                        Secondary
                      </a>
                    </div>
                   
                  </div>
                  
                  
                
                  
                    <div class="row g-2 align-items-center mb-n3">
                     <div class="col-12 col-xl-2 mb-3 font-weight-semibold">다운로드 등 버튼</div>
                    <div class="col-6 col-sm-4 col-md-2 col-xl-auto mb-3">
                        <div class="btn-list">
                          <button type="button" class="btn">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2"></path><polyline points="7 9 12 4 17 9"></polyline><line x1="12" y1="4" x2="12" y2="16"></line></svg>
                            Upload
                          </button>
		   
                    <div class="mb-3">
                          <div class="form-label">Custom File Input</div>
                          <input type="file" class="form-control">
                        </div>
                          <button type="button" class="btn btn-warning">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M19.5 13.572l-7.5 7.428l-7.5 -7.428m0 0a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572"></path></svg>
                            I like
                          </button>
                          <button type="button" class="btn btn-success">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 12l5 5l10 -10"></path></svg>
                            I agree
                          </button>
                          <button type="button" class="btn btn-primary">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
                            More
                          </button>
                          <button type="button" class="btn btn-danger">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path><path d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg>
                            Link
                          </button>
                          <button type="button" class="btn btn-info">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M3 20l1.3 -3.9a9 8 0 1 1 3.4 2.9l-4.7 1"></path><line x1="12" y1="12" x2="12" y2="12.01"></line><line x1="8" y1="12" x2="8" y2="12.01"></line><line x1="16" y1="12" x2="16" y2="12.01"></line></svg>
                            Comment
                          </button>
                        </div>
                      </div>
                    </div>
            
          	<div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Form elements</h3>
                </div>
                <div class="card-body">
                  <div class="row g-2 align-items-center mb-n3">
                    <div class="col-12 col-xl-2 mb-3 font-weight-semibold"></div>
                    
                    
                <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="mb-3">
                          <label class="form-label">Text</label>
                          <input type="text" class="form-control" name="example-text-input" placeholder="Input placeholder" _mstplaceholder="318487">
                        </div>
                        <div class="mb-3">
                          <label class="form-label">Password</label>
                          <input type="text" class="form-control" name="example-password-input" placeholder="Input placeholder" _mstplaceholder="318487">
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
					                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
					  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Text<span class="nt">&lt;/label&gt;</span>
					  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">name=</span><span class="s">"example-text-input"</span> <span class="na">placeholder=</span><span class="s">"Input placeholder"</span><span class="nt">&gt;</span>
					<span class="nt">&lt;/div&gt;</span>
					<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
					  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Password<span class="nt">&lt;/label&gt;</span>
					  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">name=</span><span class="s">"example-password-input"</span> <span class="na">placeholder=</span><span class="s">"Input placeholder"</span><span class="nt">&gt;</span>
					<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    
                    
                  <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="mb-3">
                          <label class="form-label">Textarea</label>
                          <textarea class="form-control" name="example-textarea" placeholder="Textarea placeholder"></textarea>
                        </div>
                        <div class="mb-3">
                          <div class="form-label">Select</div>
                          <select class="form-select">
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                          </select>
                        </div>
                        <div class="mb-3">
                          <div class="form-label">Select multiple</div>
                          <select class="form-select" multiple="">
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Textarea<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;textarea</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">name=</span><span class="s">"example-textarea"</span> <span class="na">placeholder=</span><span class="s">"Textarea placeholder"</span><span class="nt">&gt;&lt;/textarea&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Select<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;select</span> <span class="na">class=</span><span class="s">"form-select"</span> <span class="nt">&gt;</span>
    <span class="nt">&lt;option</span> <span class="na">value=</span><span class="s">"1"</span><span class="nt">&gt;</span>One<span class="nt">&lt;/option&gt;</span>
    <span class="nt">&lt;option</span> <span class="na">value=</span><span class="s">"2"</span><span class="nt">&gt;</span>Two<span class="nt">&lt;/option&gt;</span>
    <span class="nt">&lt;option</span> <span class="na">value=</span><span class="s">"3"</span><span class="nt">&gt;</span>Three<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;/select&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Select multiple<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;select</span> <span class="na">class=</span><span class="s">"form-select"</span>  <span class="na">multiple</span><span class="nt">&gt;</span>
    <span class="nt">&lt;option</span> <span class="na">value=</span><span class="s">"1"</span><span class="nt">&gt;</span>One<span class="nt">&lt;/option&gt;</span>
    <span class="nt">&lt;option</span> <span class="na">value=</span><span class="s">"2"</span><span class="nt">&gt;</span>Two<span class="nt">&lt;/option&gt;</span>
    <span class="nt">&lt;option</span> <span class="na">value=</span><span class="s">"3"</span><span class="nt">&gt;</span>Three<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;/select&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    
                    
                    
                    
                   
                    	유효성검사
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="mb-3">
                          <label class="form-label">Validation States</label>
                          <input type="text" class="form-control is-valid mb-2" placeholder="Valid State.." _mstplaceholder="54851784">
                          <input type="text" class="form-control is-invalid" placeholder="Invalid State.." _mstplaceholder="29083834">
                          <div class="invalid-feedback">Invalid feedback</div>
                        </div>
                      </div>
                    </div>
                    <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
						  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Validation States<span class="nt">&lt;/label&gt;</span>
						  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control is-valid mb-2"</span> <span class="na">placeholder=</span><span class="s">"Valid State.."</span><span class="nt">&gt;</span>
						  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control is-invalid"</span> <span class="na">placeholder=</span><span class="s">"Invalid State.."</span><span class="nt">&gt;</span>
						  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"invalid-feedback"</span><span class="nt">&gt;</span>Invalid feedback<span class="nt">&lt;/div&gt;</span>
						<span class="nt">&lt;/div&gt;</span></code></pre>
                    
                    
                    
                   <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="mb-3">
                          <label class="form-label">Input sizing</label>
                          <input class="form-control form-control-lg mb-2" type="text" placeholder=".form-control-lg" _mstplaceholder="296205">
                          <input class="form-control mb-2" type="text" placeholder="Default input" _mstplaceholder="211276">
                          <input class="form-control form-control-sm" type="text" placeholder=".form-control-sm" _mstplaceholder="299832">
                        </div>
                      </div>
                    </div>
                    <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
						  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Input sizing<span class="nt">&lt;/label&gt;</span>
						  <span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control form-control-lg mb-2"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">placeholder=</span><span class="s">".form-control-lg"</span><span class="nt">&gt;</span>
						  <span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control mb-2"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">placeholder=</span><span class="s">"Default input"</span><span class="nt">&gt;</span>
						  <span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control form-control-sm"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">placeholder=</span><span class="s">".form-control-sm"</span><span class="nt">&gt;</span>
						<span class="nt">&lt;/div&gt;</span></code></pre>
                    
                    
                    
                 


                    
                   <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="mb-3">
                          <label class="form-label">Color Input</label>
                          <div class="row g-2">
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="dark" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-dark"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput form-colorinput-light">
                                <input name="color" type="radio" value="white" class="form-colorinput-input" checked="">
                                <span class="form-colorinput-color bg-white"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="blue" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-blue"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="azure" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-azure"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="indigo" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-indigo"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="purple" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-purple"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="pink" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-pink"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="red" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-red"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="orange" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-orange"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="yellow" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-yellow"></span>
                              </label>
                            </div>
                            <div class="col-auto">
                              <label class="form-colorinput">
                                <input name="color" type="radio" value="lime" class="form-colorinput-input">
                                <span class="form-colorinput-color bg-lime"></span>
                              </label>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Color Input<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row g-2"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"dark"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-dark"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput form-colorinput-light"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"white"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span>  <span class="na">checked</span><span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-white"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"blue"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-blue"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"azure"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-azure"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"indigo"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-indigo"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"purple"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-purple"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"pink"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-pink"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"red"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-red"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"orange"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-orange"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"yellow"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-yellow"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-colorinput"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">name=</span><span class="s">"color"</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">value=</span><span class="s">"lime"</span> <span class="na">class=</span><span class="s">"form-colorinput-input"</span> <span class="nt">/&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-colorinput-color bg-lime"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                    
                    
           
           
           
           
           <div class="col-lg-9">
              <div class="card card-lg">
                <div class="card-body">
                  <div class="markdown">
                    <div>
                      <div class="d-flex mb-4">
                        <h1 class="mt-0">Modals</h1>
                      </div>
                      <p>Use Bootstrap’s JavaScript modal plugin to add dialogs to your site for lightboxes, user notifications, or completely custom content.</p>
                    </div>
                    <h2 id="default-markup">Default markup</h2>
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="example-modal-backdrop"></div>
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">Modal title</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" _mstaria-label="14621412"></button>
                            </div>
                            <div class="modal-body">
                              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci animi beatae delectus deleniti dolorem eveniet facere fuga iste nemo nesciunt nihil odio perspiciatis, quia quis reprehenderit sit tempora totam unde.
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn me-auto" data-bs-dismiss="modal">Close</button>
                              <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Save changes</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-dialog"</span> <span class="na">role=</span><span class="s">"document"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-content"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-header"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;h5</span> <span class="na">class=</span><span class="s">"modal-title"</span><span class="nt">&gt;</span>Modal title<span class="nt">&lt;/h5&gt;</span>
      <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn-close"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span> <span class="na">aria-label=</span><span class="s">"Close"</span><span class="nt">&gt;&lt;/button&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-body"</span><span class="nt">&gt;</span>
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci animi beatae delectus deleniti dolorem eveniet facere fuga iste nemo nesciunt nihil odio perspiciatis, quia quis reprehenderit sit tempora totam unde.
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-footer"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn me-auto"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span><span class="nt">&gt;</span>Close<span class="nt">&lt;/button&gt;</span>
      <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-primary"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span><span class="nt">&gt;</span>Save changes<span class="nt">&lt;/button&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    <h2 id="prompt-and-alert">Prompt and alert</h2>
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="example-modal-backdrop"></div>
                        <div class="modal-dialog modal-sm" role="document">
                          <div class="modal-content">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" _mstaria-label="14621412"></button>
                            <div class="modal-status bg-danger"></div>
                            <div class="modal-body text-center py-4">
                              <svg xmlns="http://www.w3.org/2000/svg" class="icon mb-2 text-danger icon-lg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 9v2m0 4v.01"></path><path d="M5 19h14a2 2 0 0 0 1.84 -2.75l-7.1 -12.25a2 2 0 0 0 -3.5 0l-7.1 12.25a2 2 0 0 0 1.75 2.75"></path></svg>
                              <h3>Are you sure?</h3>
                              <div class="text-muted">Do you really want to remove 84 files? What you've done cannot be undone.</div>
                            </div>
                            <div class="modal-footer">
                              <div class="w-100">
                                <div class="row">
                                  <div class="col"><a href="javascript:void(0)" class="btn btn-white w-100" data-bs-dismiss="modal">
                                      Cancel
                                    </a></div>
                                  <div class="col"><a href="javascript:void(0)" class="btn btn-danger w-100" data-bs-dismiss="modal">
                                      Delete 84 items
                                    </a></div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-dialog modal-sm"</span> <span class="na">role=</span><span class="s">"document"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-content"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn-close"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span> <span class="na">aria-label=</span><span class="s">"Close"</span><span class="nt">&gt;&lt;/button&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-status bg-danger"</span><span class="nt">&gt;&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-body text-center py-4"</span><span class="nt">&gt;</span>
      <span class="c">&lt;!-- SVG icon code with class="mb-2 text-danger icon-lg" --&gt;</span>
      <span class="nt">&lt;h3&gt;</span>Are you sure?<span class="nt">&lt;/h3&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"text-muted"</span><span class="nt">&gt;</span>Do you really want to remove 84 files? What you've done cannot be undone.<span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-footer"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"w-100"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col"</span><span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-white w-100"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span><span class="nt">&gt;</span>
              Cancel
            <span class="nt">&lt;/a&gt;&lt;/div&gt;</span>
          <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col"</span><span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-danger w-100"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span><span class="nt">&gt;</span>
              Delete 84 items
            <span class="nt">&lt;/a&gt;&lt;/div&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="example-modal-backdrop"></div>
                        <div class="modal-dialog modal-sm" role="document">
                          <div class="modal-content">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" _mstaria-label="14621412"></button>
                            <div class="modal-status bg-success"></div>
                            <div class="modal-body text-center py-4">
                              <svg xmlns="http://www.w3.org/2000/svg" class="icon mb-2 text-green icon-lg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="12" cy="12" r="9"></circle><path d="M9 12l2 2l4 -4"></path></svg>
                              <h3>Payment succedeed</h3>
                              <div class="text-muted">Your payment of $290 has been successfully submitted. Your invoice has been sent to support@tabler.io.</div>
                            </div>
                            <div class="modal-footer">
                              <div class="w-100">
                                <div class="row">
                                  <div class="col"><a href="javascript:void(0)" class="btn btn-white w-100" data-bs-dismiss="modal">
                                      Go to dashboard
                                    </a></div>
                                  <div class="col"><a href="javascript:void(0)" class="btn btn-success w-100" data-bs-dismiss="modal">
                                      View invoice
                                    </a></div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-dialog modal-sm"</span> <span class="na">role=</span><span class="s">"document"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-content"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn-close"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span> <span class="na">aria-label=</span><span class="s">"Close"</span><span class="nt">&gt;&lt;/button&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-status bg-success"</span><span class="nt">&gt;&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-body text-center py-4"</span><span class="nt">&gt;</span>
      <span class="c">&lt;!-- SVG icon code with class="mb-2 text-green icon-lg" --&gt;</span>
      <span class="nt">&lt;h3&gt;</span>Payment succedeed<span class="nt">&lt;/h3&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"text-muted"</span><span class="nt">&gt;</span>Your payment of $290 has been successfully submitted. Your invoice has been sent to support@tabler.io.<span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-footer"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"w-100"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col"</span><span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-white w-100"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span><span class="nt">&gt;</span>
              Go to dashboard
            <span class="nt">&lt;/a&gt;&lt;/div&gt;</span>
          <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col"</span><span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-success w-100"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span><span class="nt">&gt;</span>
              View invoice
            <span class="nt">&lt;/a&gt;&lt;/div&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    <h2 id="modal-with-form">Modal with form</h2>
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="example-modal-backdrop"></div>
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">New report</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" _mstaria-label="14621412"></button>
                            </div>
                            <div class="modal-body">
                              <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Your report name" _mstplaceholder="28217644">
                              </div>
                              <label class="form-label">Report type</label>
                              <div class="form-selectgroup-boxes row mb-3">
                                <div class="col-lg-6">
                                  <label class="form-selectgroup-item">
                                    <input type="radio" name="report-type" value="1" class="form-selectgroup-input" checked="">
                                    <span class="form-selectgroup-label d-flex align-items-center p-3">
                                      <span class="me-3">
                                        <span class="form-selectgroup-check"></span>
                                      </span>
                                      <span class="form-selectgroup-label-content">
                                        <span class="form-selectgroup-title strong mb-1">Simple</span>
                                        <span class="d-block text-muted">Provide only basic data needed for the report</span>
                                      </span>
                                    </span>
                                  </label>
                                </div>
                                <div class="col-lg-6">
                                  <label class="form-selectgroup-item">
                                    <input type="radio" name="report-type" value="1" class="form-selectgroup-input">
                                    <span class="form-selectgroup-label d-flex align-items-center p-3">
                                      <span class="me-3">
                                        <span class="form-selectgroup-check"></span>
                                      </span>
                                      <span class="form-selectgroup-label-content">
                                        <span class="form-selectgroup-title strong mb-1">Advanced</span>
                                        <span class="d-block text-muted">Insert charts and additional advanced analyses to be inserted in the report</span>
                                      </span>
                                    </span>
                                  </label>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-8">
                                  <div class="mb-3">
                                    <label class="form-label">Report url</label>
                                    <div class="input-group input-group-flat">
                                      <span class="input-group-text">
                                        https://tabler.io/reports/
                                      </span>
                                      <input type="text" class="form-control ps-0" value="report-01" autocomplete="off" _mstvalue="14808846">
                                    </div>
                                  </div>
                                </div>
                                <div class="col-lg-4">
                                  <div class="mb-3">
                                    <label class="form-label">Visibility</label>
                                    <select class="form-select">
                                      <option value="1" selected="">Private</option>
                                      <option value="2">Public</option>
                                      <option value="3">Hidden</option>
                                    </select>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <div class="col-lg-6">
                                  <div class="mb-3">
                                    <label class="form-label">Client name</label>
                                    <input type="text" class="form-control">
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                  <div class="mb-3">
                                    <label class="form-label">Reporting period</label>
                                    <input type="date" class="form-control">
                                  </div>
                                </div>
                                <div class="col-lg-12">
                                  <div>
                                    <label class="form-label">Additional information</label>
                                    <textarea class="form-control" rows="3"></textarea>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <a href="javascript:void(0)" class="btn btn-link link-secondary" data-bs-dismiss="modal">
                                Cancel
                              </a>
                              <a href="javascript:void(0)" class="btn btn-primary ms-auto" data-bs-dismiss="modal">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg><font _mstmutation="1">
                                Create new report
                              </font></a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-dialog modal-lg"</span> <span class="na">role=</span><span class="s">"document"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-content"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-header"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;h5</span> <span class="na">class=</span><span class="s">"modal-title"</span><span class="nt">&gt;</span>New report<span class="nt">&lt;/h5&gt;</span>
      <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn-close"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span> <span class="na">aria-label=</span><span class="s">"Close"</span><span class="nt">&gt;&lt;/button&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-body"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Name<span class="nt">&lt;/label&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">name=</span><span class="s">"example-text-input"</span> <span class="na">placeholder=</span><span class="s">"Your report name"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Report type<span class="nt">&lt;/label&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-selectgroup-boxes row mb-3"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-lg-6"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-selectgroup-item"</span><span class="nt">&gt;</span>
            <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">name=</span><span class="s">"report-type"</span> <span class="na">value=</span><span class="s">"1"</span> <span class="na">class=</span><span class="s">"form-selectgroup-input"</span> <span class="na">checked</span><span class="nt">&gt;</span>
            <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-selectgroup-label d-flex align-items-center p-3"</span><span class="nt">&gt;</span>
              <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"me-3"</span><span class="nt">&gt;</span>
                <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-selectgroup-check"</span><span class="nt">&gt;&lt;/span&gt;</span>
              <span class="nt">&lt;/span&gt;</span>
              <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-selectgroup-label-content"</span><span class="nt">&gt;</span>
                <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-selectgroup-title strong mb-1"</span><span class="nt">&gt;</span>Simple<span class="nt">&lt;/span&gt;</span>
                <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"d-block text-muted"</span><span class="nt">&gt;</span>Provide only basic data needed for the report<span class="nt">&lt;/span&gt;</span>
              <span class="nt">&lt;/span&gt;</span>
            <span class="nt">&lt;/span&gt;</span>
          <span class="nt">&lt;/label&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-lg-6"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-selectgroup-item"</span><span class="nt">&gt;</span>
            <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">name=</span><span class="s">"report-type"</span> <span class="na">value=</span><span class="s">"1"</span> <span class="na">class=</span><span class="s">"form-selectgroup-input"</span><span class="nt">&gt;</span>
            <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-selectgroup-label d-flex align-items-center p-3"</span><span class="nt">&gt;</span>
              <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"me-3"</span><span class="nt">&gt;</span>
                <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-selectgroup-check"</span><span class="nt">&gt;&lt;/span&gt;</span>
              <span class="nt">&lt;/span&gt;</span>
              <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-selectgroup-label-content"</span><span class="nt">&gt;</span>
                <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"form-selectgroup-title strong mb-1"</span><span class="nt">&gt;</span>Advanced<span class="nt">&lt;/span&gt;</span>
                <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"d-block text-muted"</span><span class="nt">&gt;</span>Insert charts and additional advanced analyses to be inserted in the report<span class="nt">&lt;/span&gt;</span>
              <span class="nt">&lt;/span&gt;</span>
            <span class="nt">&lt;/span&gt;</span>
          <span class="nt">&lt;/label&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-lg-8"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
            <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Report url<span class="nt">&lt;/label&gt;</span>
            <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group input-group-flat"</span><span class="nt">&gt;</span>
              <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"input-group-text"</span><span class="nt">&gt;</span>
                https://tabler.io/reports/
              <span class="nt">&lt;/span&gt;</span>
              <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control ps-0"</span>  <span class="na">value=</span><span class="s">"report-01"</span> <span class="na">autocomplete=</span><span class="s">"off"</span><span class="nt">&gt;</span>
            <span class="nt">&lt;/div&gt;</span>
          <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-lg-4"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
            <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Visibility<span class="nt">&lt;/label&gt;</span>
            <span class="nt">&lt;select</span> <span class="na">class=</span><span class="s">"form-select"</span><span class="nt">&gt;</span>
              <span class="nt">&lt;option</span> <span class="na">value=</span><span class="s">"1"</span> <span class="na">selected</span><span class="nt">&gt;</span>Private<span class="nt">&lt;/option&gt;</span>
              <span class="nt">&lt;option</span> <span class="na">value=</span><span class="s">"2"</span><span class="nt">&gt;</span>Public<span class="nt">&lt;/option&gt;</span>
              <span class="nt">&lt;option</span> <span class="na">value=</span><span class="s">"3"</span><span class="nt">&gt;</span>Hidden<span class="nt">&lt;/option&gt;</span>
            <span class="nt">&lt;/select&gt;</span>
          <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-body"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-lg-6"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
            <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Client name<span class="nt">&lt;/label&gt;</span>
            <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-lg-6"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"mb-3"</span><span class="nt">&gt;</span>
            <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Reporting period<span class="nt">&lt;/label&gt;</span>
            <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"date"</span> <span class="na">class=</span><span class="s">"form-control"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-lg-12"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;div&gt;</span>
            <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"form-label"</span><span class="nt">&gt;</span>Additional information<span class="nt">&lt;/label&gt;</span>
            <span class="nt">&lt;textarea</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">rows=</span><span class="s">"3"</span><span class="nt">&gt;&lt;/textarea&gt;</span>
          <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal-footer"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-link link-secondary"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span><span class="nt">&gt;</span>
        Cancel
      <span class="nt">&lt;/a&gt;</span>
      <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-primary ms-auto"</span> <span class="na">data-bs-dismiss=</span><span class="s">"modal"</span><span class="nt">&gt;</span>
        <span class="c">&lt;!-- SVG icon code --&gt;</span>
        Create new report
      <span class="nt">&lt;/a&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            <div class="col-lg-9">
              <div class="card card-lg">
                <div class="card-body">
                  <div class="markdown">
                    <div>
                      <div class="d-flex mb-4">
                        <h1 class="mt-0">Progress bars</h1>
                      </div>
                    </div>
                    <h2 id="indeterminate-progress">Indeterminate progress</h2>
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="progress progress-sm">
                          <div class="progress-bar progress-bar-indeterminate"></div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"progress progress-sm"</span><span class="nt">&gt;</span>
					  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"progress-bar progress-bar-indeterminate"</span><span class="nt">&gt;&lt;/div&gt;</span>
					<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                 </div>
                </div>
              </div>
            </div>
            
            
            
            
            
            
            <div class="col-lg-9">
              <div class="card card-lg">
                <div class="card-body">
                  <div class="markdown">
                    <div>
                      <div class="d-flex mb-4">
                        <h1 class="mt-0">Tables</h1>
                      </div>
                    </div>
                    
                   <div class="card-header">
                  <h3 class="card-title">Invoices</h3>
                </div>
                   <div class="card-body border-bottom py-3">
                  <div class="d-flex">
                    <div class="text-muted">
                      Show
                      <div class="mx-2 d-inline-block">
                        <input type="text" class="form-control form-control-sm" value="8" size="3" aria-label="Invoices count">
                      </div>
                      entries
                    </div>
                    <div class="ms-auto text-muted">
                      Search:
                      <div class="ms-2 d-inline-block">
                        <input type="text" class="form-control form-control-sm" aria-label="Search invoice">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="table-responsive">
                  <table class="table card-table table-vcenter text-nowrap datatable">
                    <thead>
                      <tr>
                        <th class="w-1"><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select all invoices"></th>
                        <th class="w-1">No. <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-sm text-dark icon-thick" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="6 15 12 9 18 15"></polyline></svg>
                        </th>
                        <th>Invoice Subject</th>
                        <th>Client</th>
                        <th>VAT No.</th>
                        <th>Created</th>
                        <th>Status</th>
                        <th>Price</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001401</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Design Works</a></td>
                        <td>
                          <span class="flag flag-country-us"></span>
                          Carlson Limited
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          15 Dec 2017
                        </td>
                        <td>
                          <span class="badge bg-success me-1"></span> Paid
                        </td>
                        <td>$887</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001402</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">UX Wireframes</a></td>
                        <td>
                          <span class="flag flag-country-gb"></span>
                          Adobe
                        </td>
                        <td>
                          87956421
                        </td>
                        <td>
                          12 Apr 2017
                        </td>
                        <td>
                          <span class="badge bg-warning me-1"></span> Pending
                        </td>
                        <td>$1200</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001403</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">New Dashboard</a></td>
                        <td>
                          <span class="flag flag-country-de"></span>
                          Bluewolf
                        </td>
                        <td>
                          87952621
                        </td>
                        <td>
                          23 Oct 2017
                        </td>
                        <td>
                          <span class="badge bg-warning me-1"></span> Pending
                        </td>
                        <td>$534</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001404</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Landing Page</a></td>
                        <td>
                          <span class="flag flag-country-br"></span>
                          Salesforce
                        </td>
                        <td>
                          87953421
                        </td>
                        <td>
                          2 Sep 2017
                        </td>
                        <td>
                          <span class="badge bg-secondary me-1"></span> Due in 2 Weeks
                        </td>
                        <td>$1500</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001405</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Marketing Templates</a></td>
                        <td>
                          <span class="flag flag-country-pl"></span>
                          Printic
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          29 Jan 2018
                        </td>
                        <td>
                          <span class="badge bg-danger me-1"></span> Paid Today
                        </td>
                        <td>$648</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001406</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Sales Presentation</a></td>
                        <td>
                          <span class="flag flag-country-br"></span>
                          Tabdaq
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          4 Feb 2018
                        </td>
                        <td>
                          <span class="badge bg-secondary me-1"></span> Due in 3 Weeks
                        </td>
                        <td>$300</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001407</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Logo &amp; Print</a></td>
                        <td>
                          <span class="flag flag-country-us"></span>
                          Apple
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          22 Mar 2018
                        </td>
                        <td>
                          <span class="badge bg-success me-1"></span> Paid Today
                        </td>
                        <td>$2500</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001408</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Icons</a></td>
                        <td>
                          <span class="flag flag-country-pl"></span>
                          Tookapic
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          13 May 2018
                        </td>
                        <td>
                          <span class="badge bg-success me-1"></span> Paid Today
                        </td>
                        <td>$940</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                  <div class="card-footer d-flex align-items-center">
                  <p class="m-0 text-muted">Showing <span>1</span> to <span>8</span> of <span>16</span> entries</p>
                  <ul class="pagination m-0 ms-auto">
                    <li class="page-item disabled">
                      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="15 6 9 12 15 18"></polyline></svg>
                        prev
                      </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#">
                        next <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="9 6 15 12 9 18"></polyline></svg>
                      </a>
                    </li>
                  </ul>
                </div>
                
                
                
                <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="table-responsive">
                          <table class="table table-vcenter">
                            <thead>
                              <tr>
                                <th>Name</th>
                                <th>Title</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th class="w-1"></th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>Paweł Kuna</td>
                                <td class="text-muted">
                                  UI Designer, Training
                                </td>
                                <td class="text-muted"><a href="javascript:void(0)" class="text-reset">paweluna@howstuffworks.com</a></td>
                                <td class="text-muted">
                                  User
                                </td>
                                <td>
                                  <a href="javascript:void(0)">Edit</a>
                                </td>
                              </tr>
                              <tr>
                                <td>Jeffie Lewzey</td>
                                <td class="text-muted">
                                  Chemical Engineer, Support
                                </td>
                                <td class="text-muted"><a href="javascript:void(0)" class="text-reset">jlewzey1@seesaa.net</a></td>
                                <td class="text-muted">
                                  Admin
                                </td>
                                <td>
                                  <a href="javascript:void(0)">Edit</a>
                                </td>
                              </tr>
                              <tr>
                                <td>Mallory Hulme</td>
                                <td class="text-muted">
                                  Geologist IV, Support
                                </td>
                                <td class="text-muted"><a href="javascript:void(0)" class="text-reset">mhulme2@domainmarket.com</a></td>
                                <td class="text-muted">
                                  User
                                </td>
                                <td>
                                  <a href="javascript:void(0)">Edit</a>
                                </td>
                              </tr>
                              <tr>
                                <td>Dunn Slane</td>
                                <td class="text-muted">
                                  Research Nurse, Sales
                                </td>
                                <td class="text-muted"><a href="javascript:void(0)" class="text-reset">dslane3@epa.gov</a></td>
                                <td class="text-muted">
                                  Owner
                                </td>
                                <td>
                                  <a href="javascript:void(0)">Edit</a>
                                </td>
                              </tr>
                              <tr>
                                <td>Emmy Levet</td>
                                <td class="text-muted">
                                  VP Product Management, Accounting
                                </td>
                                <td class="text-muted"><a href="javascript:void(0)" class="text-reset">elevet4@senate.gov</a></td>
                                <td class="text-muted">
                                  Admin
                                </td>
                                <td>
                                  <a href="javascript:void(0)">Edit</a>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                    
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"table-responsive"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;table</span>
		<span class="na">class=</span><span class="s">"table table-vcenter"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;thead&gt;</span>
      <span class="nt">&lt;tr&gt;</span>
        <span class="nt">&lt;th&gt;</span>Name<span class="nt">&lt;/th&gt;</span>
        <span class="nt">&lt;th&gt;</span>Title<span class="nt">&lt;/th&gt;</span>
        <span class="nt">&lt;th&gt;</span>Email<span class="nt">&lt;/th&gt;</span>
        <span class="nt">&lt;th&gt;</span>Role<span class="nt">&lt;/th&gt;</span>
        <span class="nt">&lt;th</span> <span class="na">class=</span><span class="s">"w-1"</span><span class="nt">&gt;&lt;/th&gt;</span>
      <span class="nt">&lt;/tr&gt;</span>
    <span class="nt">&lt;/thead&gt;</span>
    <span class="nt">&lt;tbody&gt;</span>
      <span class="nt">&lt;tr&gt;</span>
        <span class="nt">&lt;td</span> <span class="nt">&gt;</span>Paweł Kuna<span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          UI Designer, Training
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"text-reset"</span><span class="nt">&gt;</span>paweluna@howstuffworks.com<span class="nt">&lt;/a&gt;&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          User
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td&gt;</span>
          <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>Edit<span class="nt">&lt;/a&gt;</span>
        <span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;/tr&gt;</span>
      <span class="nt">&lt;tr&gt;</span>
        <span class="nt">&lt;td</span> <span class="nt">&gt;</span>Jeffie Lewzey<span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          Chemical Engineer, Support
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"text-reset"</span><span class="nt">&gt;</span>jlewzey1@seesaa.net<span class="nt">&lt;/a&gt;&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          Admin
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td&gt;</span>
          <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>Edit<span class="nt">&lt;/a&gt;</span>
        <span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;/tr&gt;</span>
      <span class="nt">&lt;tr&gt;</span>
        <span class="nt">&lt;td</span> <span class="nt">&gt;</span>Mallory Hulme<span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          Geologist IV, Support
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"text-reset"</span><span class="nt">&gt;</span>mhulme2@domainmarket.com<span class="nt">&lt;/a&gt;&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          User
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td&gt;</span>
          <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>Edit<span class="nt">&lt;/a&gt;</span>
        <span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;/tr&gt;</span>
      <span class="nt">&lt;tr&gt;</span>
        <span class="nt">&lt;td</span> <span class="nt">&gt;</span>Dunn Slane<span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          Research Nurse, Sales
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"text-reset"</span><span class="nt">&gt;</span>dslane3@epa.gov<span class="nt">&lt;/a&gt;&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          Owner
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td&gt;</span>
          <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>Edit<span class="nt">&lt;/a&gt;</span>
        <span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;/tr&gt;</span>
      <span class="nt">&lt;tr&gt;</span>
        <span class="nt">&lt;td</span> <span class="nt">&gt;</span>Emmy Levet<span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          VP Product Management, Accounting
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"text-reset"</span><span class="nt">&gt;</span>elevet4@senate.gov<span class="nt">&lt;/a&gt;&lt;/td&gt;</span>
        <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"text-muted"</span> <span class="nt">&gt;</span>
          Admin
        <span class="nt">&lt;/td&gt;</span>
        <span class="nt">&lt;td&gt;</span>
          <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>Edit<span class="nt">&lt;/a&gt;</span>
        <span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;/tr&gt;</span>
    <span class="nt">&lt;/tbody&gt;</span>
  <span class="nt">&lt;/table&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-lg-9">
              <div class="card card-lg">
                <div class="card-body">
                  <div class="markdown">
                    <div>
                      <div class="d-flex mb-4">
                        <h1 class="mt-0">Toasts</h1>
                      </div>
                    </div>
                    <h2 id="default-markup">Default markup</h2>
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false" data-bs-toggle="toast">
                          <div class="toast-header">
                            <span class="avatar avatar-xs me-2" style="background-image: url(../static/avatars/002m.jpg)"></span>
                            <strong class="me-auto">Mallory Hulme</strong>
                            <small>11 mins ago</small>
                            <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                          </div>
                          <div class="toast-body">
                            	알림뜨게하면 좋을듯?
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast show"</span> <span class="na">role=</span><span class="s">"alert"</span> <span class="na">aria-live=</span><span class="s">"assertive"</span> <span class="na">aria-atomic=</span><span class="s">"true"</span> <span class="na">data-autohide=</span><span class="s">"false"</span> <span class="na">data-bs-toggle=</span><span class="s">"toast"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast-header"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"avatar avatar-xs me-2"</span> <span class="na">style=</span><span class="s">"background-image: url(...)"</span><span class="nt">&gt;&lt;/span&gt;</span>
    <span class="nt">&lt;strong</span> <span class="na">class=</span><span class="s">"me-auto"</span><span class="nt">&gt;</span>Mallory Hulme<span class="nt">&lt;/strong&gt;</span>
    <span class="nt">&lt;small&gt;</span>11 mins ago<span class="nt">&lt;/small&gt;</span>
    <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"ms-2 btn-close"</span> <span class="na">data-bs-dismiss=</span><span class="s">"toast"</span> <span class="na">aria-label=</span><span class="s">"Close"</span><span class="nt">&gt;&lt;/button&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast-body"</span><span class="nt">&gt;</span>
    Hello, world! This is a toast message.
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    <h2 id="translucent">Translucent</h2>
                    <p>Toasts blend over the elements they appear over. If a browser supports the <code class="language-plaintext highlighter-rouge">backdrop-filter</code> CSS property, the elements under a toast will be blurred.</p>
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false" data-bs-toggle="toast">
                          <div class="toast-header">
                            <span class="avatar avatar-xs me-2" style="background-image: url(../static/avatars/002m.jpg)"></span>
                            <strong class="me-auto">Mallory Hulme</strong>
                            <small>11 mins ago</small>
                            <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                          </div>
                          <div class="toast-body">
                            Hello, world! This is a toast message.
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast show"</span> <span class="na">role=</span><span class="s">"alert"</span> <span class="na">aria-live=</span><span class="s">"assertive"</span> <span class="na">aria-atomic=</span><span class="s">"true"</span> <span class="na">data-autohide=</span><span class="s">"false"</span> <span class="na">data-bs-toggle=</span><span class="s">"toast"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast-header"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"avatar avatar-xs me-2"</span> <span class="na">style=</span><span class="s">"background-image: url(...)"</span><span class="nt">&gt;&lt;/span&gt;</span>
    <span class="nt">&lt;strong</span> <span class="na">class=</span><span class="s">"me-auto"</span><span class="nt">&gt;</span>Mallory Hulme<span class="nt">&lt;/strong&gt;</span>
    <span class="nt">&lt;small&gt;</span>11 mins ago<span class="nt">&lt;/small&gt;</span>
    <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"ms-2 btn-close"</span> <span class="na">data-bs-dismiss=</span><span class="s">"toast"</span> <span class="na">aria-label=</span><span class="s">"Close"</span><span class="nt">&gt;&lt;/button&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast-body"</span><span class="nt">&gt;</span>
    Hello, world! This is a toast message.
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    <h2 id="stacking-toasts">Stacking toasts</h2>
                    <p>Stack multiple toasts together by putting them within one <code class="language-plaintext highlighter-rouge">.toast-container</code>.</p>
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="toast-container">
                          <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false" data-bs-toggle="toast">
                            <div class="toast-header">
                              <span class="avatar avatar-xs me-2" style="background-image: url(../static/avatars/003m.jpg)"></span>
                              <strong class="me-auto">Dunn Slane</strong>
                              <small>11 mins ago</small>
                              <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                            </div>
                            <div class="toast-body">
                              Hello, world! This is a toast message.
                            </div>
                          </div>
                          <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false" data-bs-toggle="toast">
                            <div class="toast-header">
                              <span class="avatar avatar-xs me-2" style="background-image: url(../static/avatars/002m.jpg)"></span>
                              <strong class="me-auto">Mallory Hulme</strong>
                              <small>7 mins ago</small>
                              <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                            </div>
                            <div class="toast-body">
                              This is another toast message.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast-container"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast show"</span> <span class="na">role=</span><span class="s">"alert"</span> <span class="na">aria-live=</span><span class="s">"assertive"</span> <span class="na">aria-atomic=</span><span class="s">"true"</span> <span class="na">data-autohide=</span><span class="s">"false"</span> <span class="na">data-bs-toggle=</span><span class="s">"toast"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast-header"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"avatar avatar-xs me-2"</span> <span class="na">style=</span><span class="s">"background-image: url(...)"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;strong</span> <span class="na">class=</span><span class="s">"me-auto"</span><span class="nt">&gt;</span>Dunn Slane<span class="nt">&lt;/strong&gt;</span>
      <span class="nt">&lt;small&gt;</span>11 mins ago<span class="nt">&lt;/small&gt;</span>
      <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"ms-2 btn-close"</span> <span class="na">data-bs-dismiss=</span><span class="s">"toast"</span> <span class="na">aria-label=</span><span class="s">"Close"</span><span class="nt">&gt;&lt;/button&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast-body"</span><span class="nt">&gt;</span>
      Hello, world! This is a toast message.
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast show"</span> <span class="na">role=</span><span class="s">"alert"</span> <span class="na">aria-live=</span><span class="s">"assertive"</span> <span class="na">aria-atomic=</span><span class="s">"true"</span> <span class="na">data-autohide=</span><span class="s">"false"</span> <span class="na">data-bs-toggle=</span><span class="s">"toast"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast-header"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"avatar avatar-xs me-2"</span> <span class="na">style=</span><span class="s">"background-image: url(...)"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;strong</span> <span class="na">class=</span><span class="s">"me-auto"</span><span class="nt">&gt;</span>Mallory Hulme<span class="nt">&lt;/strong&gt;</span>
      <span class="nt">&lt;small&gt;</span>7 mins ago<span class="nt">&lt;/small&gt;</span>
      <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"ms-2 btn-close"</span> <span class="na">data-bs-dismiss=</span><span class="s">"toast"</span> <span class="na">aria-label=</span><span class="s">"Close"</span><span class="nt">&gt;&lt;/button&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"toast-body"</span><span class="nt">&gt;</span>
      This is another toast message.
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            
            <div class="col-lg-9">
              <div class="card card-lg">
                <div class="card-body">
                  <div class="markdown">
                    <div>
                      <div class="d-flex mb-4">
                        <h1 class="mt-0">Cursors</h1>
                      </div>
                    </div>
                    <h2 id="cursor-utilities">Cursor utilities</h2>
                    <p>Use one of the available cursor utilities depending on the action you want to indicate.</p>
                    <ul>
                      <li><code class="language-plaintext highlighter-rouge">.cursor-auto</code>- the cursor style depends on what’s inside a given element</li>
                      <li><code class="language-plaintext highlighter-rouge">.cursor-pointer</code> - a pointing cursor, used to show that an element is clickable</li>
                      <li><code class="language-plaintext highlighter-rouge">.cursor-move</code> - a cursor which shows that a given element can be moved</li>
                      <li><code class="language-plaintext highlighter-rouge">.cursor-not-allowed</code> - a cursor which shows that a user is not allowed to perform an action on an element</li>
                      <li><code class="language-plaintext highlighter-rouge">.cursor-zoom-in</code> - a cursor which shows that a user can zoom in</li>
                      <li><code class="language-plaintext highlighter-rouge">.cursor-zoom-out</code> - a cursor which shows that a user can zoom out</li>
                    </ul>
                    <div class="example no_toc_section">
                      <div class="example-content">
                        <div class="row text-center">
                          <div class="col-4 mb-3">
                            <div class="cursor-auto bg-light py-3">Cursor auto</div>
                          </div>
                          <div class="col-4 mb-3">
                            <div class="cursor-pointer bg-light py-3">Cursor pointer</div>
                          </div>
                          <div class="col-4 mb-3">
                            <div class="cursor-move bg-light py-3">Cursor move</div>
                          </div>
                          <div class="col-4">
                            <div class="cursor-not-allowed bg-light py-3">Cursor not allowed</div>
                          </div>
                          <div class="col-4">
                            <div class="cursor-zoom-in bg-light py-3">Cursor zoom in</div>
                          </div>
                          <div class="col-4">
                            <div class="cursor-zoom-out bg-light py-3">Cursor zoom out</div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row text-center"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-4 mb-3"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"cursor-auto bg-light py-3"</span><span class="nt">&gt;</span>Cursor auto<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-4 mb-3"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"cursor-pointer bg-light py-3"</span><span class="nt">&gt;</span>Cursor pointer<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-4 mb-3"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"cursor-move bg-light py-3"</span><span class="nt">&gt;</span>Cursor move<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-4"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"cursor-not-allowed bg-light py-3"</span><span class="nt">&gt;</span>Cursor not allowed<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-4"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"cursor-zoom-in bg-light py-3"</span><span class="nt">&gt;</span>Cursor zoom in<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-4"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"cursor-zoom-out bg-light py-3"</span><span class="nt">&gt;</span>Cursor zoom out<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    
                    
                    
                    
                    <div class="example no_toc_section example-bg">
                      <div class="example-content">
                        <div class="example-column example-column-2">
                          <!-- Cards with tabs component -->
                          <div class="card-tabs ">
                            <!-- Cards navigation -->
                            <ul class="nav nav-tabs">
                              <li class="nav-item"><a href="#tab-top-1" class="nav-link active" data-bs-toggle="tab">Tab 1</a></li>
                              <li class="nav-item"><a href="#tab-top-2" class="nav-link" data-bs-toggle="tab">Tab 2</a></li>
                              <li class="nav-item"><a href="#tab-top-3" class="nav-link" data-bs-toggle="tab">Tab 3</a></li>
                              <li class="nav-item"><a href="#tab-top-4" class="nav-link" data-bs-toggle="tab">Tab 4</a></li>
                            </ul>
                            <div class="tab-content">
                              <!-- Content of card #1 -->
                              <div id="tab-top-1" class="card tab-pane active show">
                                <div class="card-body">
                                  <div class="card-title">Content of tab #1</div>
                                  <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, alias aliquid distinctio dolorem expedita, fugiat hic magni molestiae molestias odit.
                                  </p>
                                </div>
                              </div>
                              <!-- Content of card #2 -->
                              <div id="tab-top-2" class="card tab-pane">
                                <div class="card-body">
                                  <div class="card-title">Content of tab #2</div>
                                  <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, alias aliquid distinctio dolorem expedita, fugiat hic magni molestiae molestias odit.
                                  </p>
                                </div>
                              </div>
                              <!-- Content of card #3 -->
                              <div id="tab-top-3" class="card tab-pane">
                                <div class="card-body">
                                  <div class="card-title">Content of tab #3</div>
                                  <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, alias aliquid distinctio dolorem expedita, fugiat hic magni molestiae molestias odit.
                                  </p>
                                </div>
                              </div>
                              <!-- Content of card #4 -->
                              <div id="tab-top-4" class="card tab-pane">
                                <div class="card-body">
                                  <div class="card-title">Content of tab #4</div>
                                  <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, alias aliquid distinctio dolorem expedita, fugiat hic magni molestiae molestias odit.
                                  </p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="c">&lt;!-- Cards with tabs component --&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-tabs "</span><span class="nt">&gt;</span>
  <span class="c">&lt;!-- Cards navigation --&gt;</span>
  <span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">"nav nav-tabs"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"nav-item"</span><span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#tab-top-1"</span> <span class="na">class=</span><span class="s">"nav-link active"</span> <span class="na">data-bs-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span>Tab 1<span class="nt">&lt;/a&gt;&lt;/li&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"nav-item"</span><span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#tab-top-2"</span> <span class="na">class=</span><span class="s">"nav-link"</span> <span class="na">data-bs-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span>Tab 2<span class="nt">&lt;/a&gt;&lt;/li&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"nav-item"</span><span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#tab-top-3"</span> <span class="na">class=</span><span class="s">"nav-link"</span> <span class="na">data-bs-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span>Tab 3<span class="nt">&lt;/a&gt;&lt;/li&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"nav-item"</span><span class="nt">&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#tab-top-4"</span> <span class="na">class=</span><span class="s">"nav-link"</span> <span class="na">data-bs-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span>Tab 4<span class="nt">&lt;/a&gt;&lt;/li&gt;</span>
  <span class="nt">&lt;/ul&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"tab-content"</span><span class="nt">&gt;</span>
    <span class="c">&lt;!-- Content of card #1 --&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">id=</span><span class="s">"tab-top-1"</span> <span class="na">class=</span><span class="s">"card tab-pane active show"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-body"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-title"</span><span class="nt">&gt;</span>Content of tab #1<span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;p&gt;</span>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, alias aliquid distinctio dolorem expedita, fugiat hic magni molestiae molestias odit.
        <span class="nt">&lt;/p&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="c">&lt;!-- Content of card #2 --&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">id=</span><span class="s">"tab-top-2"</span> <span class="na">class=</span><span class="s">"card tab-pane"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-body"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-title"</span><span class="nt">&gt;</span>Content of tab #2<span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;p&gt;</span>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, alias aliquid distinctio dolorem expedita, fugiat hic magni molestiae molestias odit.
        <span class="nt">&lt;/p&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="c">&lt;!-- Content of card #3 --&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">id=</span><span class="s">"tab-top-3"</span> <span class="na">class=</span><span class="s">"card tab-pane"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-body"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-title"</span><span class="nt">&gt;</span>Content of tab #3<span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;p&gt;</span>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, alias aliquid distinctio dolorem expedita, fugiat hic magni molestiae molestias odit.
        <span class="nt">&lt;/p&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="c">&lt;!-- Content of card #4 --&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">id=</span><span class="s">"tab-top-4"</span> <span class="na">class=</span><span class="s">"card tab-pane"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-body"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-title"</span><span class="nt">&gt;</span>Content of tab #4<span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;p&gt;</span>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, alias aliquid distinctio dolorem expedita, fugiat hic magni molestiae molestias odit.
        <span class="nt">&lt;/p&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    
                    <div class="example no_toc_section example-bg">
                      <div class="example-content">
                        <div class="example-column example-column-1">
                          <div class="card card-stacked">
                            <div class="card-body">
                              <h3 class="card-title">Stacked card</h3>
                              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deleniti fugit incidunt, iste, itaque minima
                                neque pariatur perferendis sed suscipit velit vitae voluptatem.</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card card-stacked"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-body"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;h3</span> <span class="na">class=</span><span class="s">"card-title"</span><span class="nt">&gt;</span>Stacked card<span class="nt">&lt;/h3&gt;</span>
    <span class="nt">&lt;p&gt;</span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deleniti fugit incidunt, iste, itaque minima
      neque pariatur perferendis sed suscipit velit vitae voluptatem.<span class="nt">&lt;/p&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    
                    <h2>Default dropdown</h2>
               <div class="example no_toc_section example-centered">
                      <div class="example-content">
                        <div class="dropdown-menu dropdown-menu-demo">
                          <a class="dropdown-item" href="javascript:void(0)">
                            Action
                          </a>
                          <a class="dropdown-item" href="javascript:void(0)">
                            Another action
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"dropdown-menu dropdown-menu-demo"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"dropdown-item"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>
    Action
  <span class="nt">&lt;/a&gt;</span>
  <span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"dropdown-item"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>
    Another action
  <span class="nt">&lt;/a&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    
                    
                    <div class="example no_toc_section example-bg">
                      <div class="example-content">
                        <div class="example-column example-column-1">
                          <div class="card">
                            <ul class="nav nav-tabs nav-tabs-alt" data-bs-toggle="tabs">
                              <li class="nav-item">
                                <a href="#tabs-home-ex6" class="nav-link active" data-bs-toggle="tab"><svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="5 12 3 12 12 3 21 12 19 12"></polyline><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"></path></svg>
                                  Home</a>
                              </li>
                              <li class="nav-item">
                                <a href="#tabs-profile-ex6" class="nav-link" data-bs-toggle="tab"><svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="12" cy="7" r="4"></circle><path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path></svg>
                                  Profile</a>
                              </li>
                              <li class="nav-item ms-auto">
                                <a href="#tabs-settings-ex6" class="nav-link" title="Settings" data-bs-toggle="tab"><svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                </a>
                              </li>
                            </ul>
                            <div class="card-body">
                              <div class="tab-content">
                                <div class="tab-pane active show" id="tabs-home-ex6">
                                  <div>Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh</div>
                                </div>
                                <div class="tab-pane" id="tabs-profile-ex6">
                                  <div>Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed</div>
                                </div>
                                <div class="tab-pane" id="tabs-settings-ex6">
                                  <div>Donec ac vitae diam amet vel leo egestas consequat rhoncus in luctus amet, facilisi sit mauris accumsan nibh habitant senectus</div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="example-code">
                      <figure class="highlight">
                        <pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">"nav nav-tabs nav-tabs-alt"</span> <span class="na">data-bs-toggle=</span><span class="s">"tabs"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"nav-item"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#tabs-home-ex6"</span> <span class="na">class=</span><span class="s">"nav-link active"</span> <span class="na">data-bs-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span><span class="c">&lt;!-- SVG icon code with class="me-2" --&gt;</span>
        Home<span class="nt">&lt;/a&gt;</span>
    <span class="nt">&lt;/li&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"nav-item"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#tabs-profile-ex6"</span> <span class="na">class=</span><span class="s">"nav-link"</span> <span class="na">data-bs-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span><span class="c">&lt;!-- SVG icon code with class="me-2" --&gt;</span>
        Profile<span class="nt">&lt;/a&gt;</span>
    <span class="nt">&lt;/li&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"nav-item ms-auto"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#tabs-settings-ex6"</span> <span class="na">class=</span><span class="s">"nav-link"</span> <span class="na">title=</span><span class="s">"Settings"</span> <span class="na">data-bs-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span><span class="c">&lt;!-- SVG icon code --&gt;</span>
      <span class="nt">&lt;/a&gt;</span>
    <span class="nt">&lt;/li&gt;</span>
  <span class="nt">&lt;/ul&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"card-body"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"tab-content"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"tab-pane active show"</span> <span class="na">id=</span><span class="s">"tabs-home-ex6"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div&gt;</span>Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh<span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"tab-pane"</span> <span class="na">id=</span><span class="s">"tabs-profile-ex6"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div&gt;</span>Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed<span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"tab-pane"</span> <span class="na">id=</span><span class="s">"tabs-settings-ex6"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div&gt;</span>Donec ac vitae diam amet vel leo egestas consequat rhoncus in luctus amet, facilisi sit mauris accumsan nibh habitant senectus<span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre>
                      </figure>
                    </div>
                    
                    
                    
                    
                    <div class="card-header">
                  <h3 class="card-title">Top users</h3>
                </div>
                <div class="card-body">
                  <div class="row g-3">
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar" style="background-image: url(./static/avatars/000m.jpg)">
                            <span class="badge bg-red"></span></span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Paweł Kuna</a>
                          <small class="text-muted text-truncate mt-n1">2 days ago</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar">
                            <span class="badge bg-x"></span>JL</span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Jeffie Lewzey</a>
                          <small class="text-muted text-truncate mt-n1">3 days ago</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar" style="background-image: url(./static/avatars/002m.jpg)"></span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Mallory Hulme</a>
                          <small class="text-muted text-truncate mt-n1">today</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar" style="background-image: url(./static/avatars/003m.jpg)">
                            <span class="badge bg-green"></span></span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Dunn Slane</a>
                          <small class="text-muted text-truncate mt-n1">6 days ago</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar" style="background-image: url(./static/avatars/000f.jpg)">
                            <span class="badge bg-red"></span></span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Emmy Levet</a>
                          <small class="text-muted text-truncate mt-n1">3 days ago</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar" style="background-image: url(./static/avatars/001f.jpg)">
                            <span class="badge bg-yellow"></span></span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Maryjo Lebarree</a>
                          <small class="text-muted text-truncate mt-n1">2 days ago</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar">
                            <span class="badge bg-x"></span>EP</span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Egan Poetz</a>
                          <small class="text-muted text-truncate mt-n1">4 days ago</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar" style="background-image: url(./static/avatars/002f.jpg)">
                            <span class="badge bg-yellow"></span></span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Kellie Skingley</a>
                          <small class="text-muted text-truncate mt-n1">6 days ago</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar" style="background-image: url(./static/avatars/003f.jpg)">
                            <span class="badge bg-x"></span></span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Christabel Charlwood</a>
                          <small class="text-muted text-truncate mt-n1">today</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="row g-3 align-items-center">
                        <a href="#" class="col-auto">
                          <span class="avatar">
                            <span class="badge bg-x"></span>HS</span>
                        </a>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block text-truncate">Haskel Shelper</a>
                          <small class="text-muted text-truncate mt-n1">yesterday</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-header">
                  <h3 class="card-title">Invoices</h3>
                </div>
                <div class="card-body border-bottom py-3">
                  <div class="d-flex">
                    <div class="text-muted">
                      Show
                      <div class="mx-2 d-inline-block">
                        <input type="text" class="form-control form-control-sm" value="8" size="3" aria-label="Invoices count">
                      </div>
                      entries
                    </div>
                    <div class="ms-auto text-muted">
                      Search:
                      <div class="ms-2 d-inline-block">
                        <input type="text" class="form-control form-control-sm" aria-label="Search invoice">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="table-responsive">
                  <table class="table card-table table-vcenter text-nowrap datatable">
                    <thead>
                      <tr>
                        <th class="w-1"><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select all invoices"></th>
                        <th class="w-1">No. <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-sm text-dark icon-thick" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="6 15 12 9 18 15"></polyline></svg>
                        </th>
                        <th>Invoice Subject</th>
                        <th>Client</th>
                        <th>VAT No.</th>
                        <th>Created</th>
                        <th>Status</th>
                        <th>Price</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001401</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Design Works</a></td>
                        <td>
                          <span class="flag flag-country-us"></span>
                          Carlson Limited
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          15 Dec 2017
                        </td>
                        <td>
                          <span class="badge bg-success me-1"></span> Paid
                        </td>
                        <td>$887</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001402</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">UX Wireframes</a></td>
                        <td>
                          <span class="flag flag-country-gb"></span>
                          Adobe
                        </td>
                        <td>
                          87956421
                        </td>
                        <td>
                          12 Apr 2017
                        </td>
                        <td>
                          <span class="badge bg-warning me-1"></span> Pending
                        </td>
                        <td>$1200</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001403</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">New Dashboard</a></td>
                        <td>
                          <span class="flag flag-country-de"></span>
                          Bluewolf
                        </td>
                        <td>
                          87952621
                        </td>
                        <td>
                          23 Oct 2017
                        </td>
                        <td>
                          <span class="badge bg-warning me-1"></span> Pending
                        </td>
                        <td>$534</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001404</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Landing Page</a></td>
                        <td>
                          <span class="flag flag-country-br"></span>
                          Salesforce
                        </td>
                        <td>
                          87953421
                        </td>
                        <td>
                          2 Sep 2017
                        </td>
                        <td>
                          <span class="badge bg-secondary me-1"></span> Due in 2 Weeks
                        </td>
                        <td>$1500</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001405</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Marketing Templates</a></td>
                        <td>
                          <span class="flag flag-country-pl"></span>
                          Printic
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          29 Jan 2018
                        </td>
                        <td>
                          <span class="badge bg-danger me-1"></span> Paid Today
                        </td>
                        <td>$648</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001406</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Sales Presentation</a></td>
                        <td>
                          <span class="flag flag-country-br"></span>
                          Tabdaq
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          4 Feb 2018
                        </td>
                        <td>
                          <span class="badge bg-secondary me-1"></span> Due in 3 Weeks
                        </td>
                        <td>$300</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001407</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Logo &amp; Print</a></td>
                        <td>
                          <span class="flag flag-country-us"></span>
                          Apple
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          22 Mar 2018
                        </td>
                        <td>
                          <span class="badge bg-success me-1"></span> Paid Today
                        </td>
                        <td>$2500</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
                        <td><span class="text-muted">001408</span></td>
                        <td><a href="invoice.html" class="text-reset" tabindex="-1">Icons</a></td>
                        <td>
                          <span class="flag flag-country-pl"></span>
                          Tookapic
                        </td>
                        <td>
                          87956621
                        </td>
                        <td>
                          13 May 2018
                        </td>
                        <td>
                          <span class="badge bg-success me-1"></span> Paid Today
                        </td>
                        <td>$940</td>
                        <td class="text-end">
                          <span class="dropdown">
                            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">
                                Action
                              </a>
                              <a class="dropdown-item" href="#">
                                Another action
                              </a>
                            </div>
                          </span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <div class="card-footer d-flex align-items-center">
                  <p class="m-0 text-muted">Showing <span>1</span> to <span>8</span> of <span>16</span> entries</p>
                  <ul class="pagination m-0 ms-auto">
                    <li class="page-item disabled">
                      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="15 6 9 12 15 18"></polyline></svg>
                        prev
                      </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#">
                        next <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="9 6 15 12 9 18"></polyline></svg>
                      </a>
                    </li>
                  </ul>
                </div>
                
                <h2>pagination</h2>
                <ul class="pagination ">
                    <li class="page-item disabled">
                      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="15 6 9 12 15 18"></polyline></svg>
                        prev
                      </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#">
                        next <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="9 6 15 12 9 18"></polyline></svg>
                      </a>
                    </li>
                  </ul>
                  </div>
                </div>
              </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
      
      
     <div style="text-align: -webkit-center;">
     <ul id="sortable">
	  <li class="ui-state-default">전자결제  </li>
	  <li class="ui-state-default">문서관리함</li>
	  <li class="ui-state-default">근/태관리</li>
	  <li class="ui-state-default">일정관리</li>
	  <li class="ui-state-default">게시판</li>
	  <li class="ui-state-default">전자메일</li>
	</ul>
     </div>
     </section>
    </div>
	
   
   
   
    <script>
    window.onload=function(){
   	 
    	   var menuBtn = document.querySelector('.menu-btn');
    	   var nav = document.querySelector('nav');
    	   var lineOne = document.querySelector('nav .menu-btn .line--1');
    	   var lineTwo = document.querySelector('nav .menu-btn .line--2');
    	   var lineThree = document.querySelector('nav .menu-btn .line--3');
    	   var link = document.querySelector('nav .nav-links');
    	   menuBtn.addEventListener('click', () => {
    	       nav.classList.toggle('nav-open');
    	       lineOne.classList.toggle('line-cross');
    	       lineTwo.classList.toggle('line-fade-out');
    	       lineThree.classList.toggle('line-cross');
    	       link.classList.toggle('fade-in');
    	   });
    	   
    	  
    	         }
 
    
    
  $( function() {
	 
	  
	    var $gallery = $( "#gallery" ),
	      $trash = $( "#trash" );
           
            
	    $( "li", $gallery ).draggable({
	      connectToSortable: '#gallery',
	      cancel: "a.ui-icon", 
	      revert: "invalid", 
	      cursor: "move",
	    });
	 
	    $trash.droppable({
	      accept: "#gallery > li",
	      classes: {
	        "ui-droppable-active": "ui-state-highlight"
	      },
	      drop: function( event, ui ) {
	        deleteImage( ui.draggable );
	      }
	    });
	 
	    $gallery.droppable({
	      accept: "#trash li",
	      classes: {
	        "ui-droppable-active": "custom-state-active"
	      },
	      drop: function( event, ui ) {
	        recycleImage( ui.draggable );
	      }
	    });
	 
	    var recycle_icon = "<a href='link/to/recycle/script/when/we/have/js/off' title='Recycle this image' class='ui-icon ui-icon-refresh'>Recycle image</a>";
	    function deleteImage( $item ) {
	      $item.fadeOut(function() {
	        var $list = $( "ul", $trash ).length ?
	          $( "ul", $trash ) :
	          $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( $trash );
	 
	        $item.find( "a.ui-icon-trash" ).remove();
	        $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
	          $item
	            .animate({ width: "48px" })
	            .find( "img" )
	              .animate({ height: "36px" });
	        });
	      });
	    }
	 
	    var trash_icon = "<a href='link/to/trash/script/when/we/have/js/off' title='Delete this image' class='ui-icon ui-icon-trash'>Delete image</a>";
	    function recycleImage( $item ) {
	      $item.fadeOut(function() {
	        $item
	          .find( "a.ui-icon-refresh" )
	            .remove()
	          .end()
	          .css( "width", "96px")
	          .find( "img" )
	            .css( "height", "72px" )
	          .end()
	          .appendTo( $gallery )
	          .fadeIn();
	      });
	    }
	 
	    function viewLargerImage( $link ) {
	      var src = $link.attr( "href" ),
	        title = $link.siblings( "img" ).attr( "alt" ),
	        $modal = $( "img[src$='" + src + "']" );
	 
	      if ( $modal.length ) {
	        $modal.dialog( "open" );
	      } else {
	        var img = $( "<img alt='" + title + "' width='384' height='288' style='display: none; padding: 8px;' />" )
	          .attr( "src", src ).appendTo( "body" );
	        setTimeout(function() {
	          img.dialog({
	            title: title,
	            width: 400,
	            modal: true
	          });
	        }, 1 );
	      }
	    }
	 
	    $( "ul.gallery > li" ).on( "click", function( event ) {
	      var $item = $( this ),
	        $target = $( event.target );
	 
	      if ( $target.is( "a.ui-icon-trash" ) ) {
	        deleteImage( $item );
	      } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
	        viewLargerImage( $target );
	      } else if ( $target.is( "a.ui-icon-refresh" ) ) {
	        recycleImage( $item );
	      }
	 
	      return false;
	    });
	  } );
  
  
  $( function() {
    $( "#gallery" ).sortable();
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  });
  </script>
  </body>
</html>