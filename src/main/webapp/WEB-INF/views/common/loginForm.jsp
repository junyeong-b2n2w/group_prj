<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<html >
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>로그인</title>
    <link rel="preconnect" href="https://www.google-analytics.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com" crossorigin>
    <link rel="preconnect" href="https://www.googletagmanager.com" crossorigin>
    <meta name="msapplication-TileColor" content="#206bc4"/>
    <meta name="theme-color" content="#206bc4"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="mobile-web-app-capable" content="yes"/>
    <meta name="HandheldFriendly" content="True"/>
    <meta name="MobileOptimized" content="320"/>
    <meta name="description" content="Tabler comes with tons of well-designed components and features. Start your adventure with Tabler and make your dashboard great again. For free!"/>
    <meta name="twitter:image:src" content="https://preview.tabler.io/static/og.png">
    <meta name="twitter:site" content="@tabler_ui">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="Tabler: Premium and Open Source dashboard template with responsive and high quality UI.">
    <meta name="twitter:description" content="Tabler comes with tons of well-designed components and features. Start your adventure with Tabler and make your dashboard great again. For free!">
    <!-- CSS files -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tabler.css">
  </head>
  <body class="antialiased border-top-wide border-primary d-flex flex-column" >
    <div class="flex-fill d-flex flex-column justify-content-center py-4" style="background-image:url('<%=request.getContextPath()%>/resources/img/back3.jpg'); background-size:cover">
    <div style="width:40%;
    background:white;
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    z-index: 10;
    align-items: flex-start;
    transition: .3s transform;
    overflow-x: auto;"></div>
    
    <div class="d-flex justify-content-end">
      <div class=" px-6 d-flex flex-column" style="width:40%; z-index: 11;">
        <form class="" action="<%=request.getContextPath()%>/common/login.do" method="post" autocomplete="off" style="border:none;">
          <div class="card-body">
            <h2 class="card-title text-center mb-4"><img id="logo" class="" alt="logo" src="/cg/resources/img/logo.png" style="width: 200px;  height: 80px;"></h2>
            <div class="mb-3">
              <label class="form-label">회원 아이디</label>
              <input type="text" class="form-control"  placeholder="아이디를 입력해 주세요" value="test" name="emp_id">
            </div>
            <div class="mb-2">
              <label class="form-label">
                회원 비밀번호
              </label>
              <div class="input-group input-group-flat">
                <input type="password" name="emp_pass" value="test" class="form-control"  placeholder="비밀번호를 입력해 주세요"  autocomplete="off">
                <span class="input-group-text">
                  <a a="#" onclick="passToggle()" class="link-secondary" title="Show password" data-bs-toggle="tooltip"><svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="12" cy="12" r="2" /><path d="M22 12c-2.667 4.667 -6 7 -10 7s-7.333 -2.333 -10 -7c2.667 -4.667 6 -7 10 -7s7.333 2.333 10 7" /></svg>
                  </a>
                </span>
              </div>
            </div>
            <div class="mb-2">
              <label class="form-check">
                <input type="checkbox" class="form-check-input"/>
                <span class="form-check-label">로그인 정보 기억하기</span>
              </label>
            </div>
            <div class="form-footer">
              <button type="submit" class="btn btn-primary w-100" style="background:#3678D7">로그인</button>
            </div>
          </div>
        </form>
      </div>
      </div>
    </div>
    <script>
    	emp_pass = document.querySelector('input[name="emp_pass"]');
   		function passToggle(){
   			if(emp_pass.getAttribute('type') =="text"){
   				emp_pass.setAttribute('type','password');
   			}else{
   				emp_pass.setAttribute('type','text');
   			}
   			
   		}
    </script>
    
  </body>
</html>