<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="Content-Language" content="en" />
<meta name="msapplication-TileColor" content="#2d89ef">
<meta name="theme-color" content="#4188c9">
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" type="image/x-icon" href="./favicon.ico" />
<!-- Generated: 2018-04-16 09:29:05 +0200 -->
<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/tabler.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/zTree.v3/3.5.42/js/jquery.ztree.all.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/ztree/metroStyle/metroStyle.css" />


<title></title>

<style>
.openC{
cursor: pointer;
}
.justify-content-between{
cursor: pointer;
}
.widget{
	margin-bottom: 10px;
}
.Mainicon{
color: #474748;
margin-right: 5px;
}
.div_sortable {
	cursor: pointer;
	border-bottom: 1px solid lightsteelblue;
	width: 100%;
	text-align: left;
}

.span_sortable {
	position: relative;
	font-size: medium;
}

#sortable {
	list-style-type: none;
	margin-top: 20px;
	padding: 0;
/* 	width: 100%; */
}

#sortable li {
	margin: 20px 10px 1px 1px;
	padding: 15px;
	float: left;
	width: 390px;
	height: 220px;
	text-align: center;
	background: white;
}

#gallery {
	float: left;
	width: 100%;
	min-height: 12em;
	margin-left: 40px;
}

.gallery.custom-state-active {
	background: #eee;
}

.gallery li {
	float: left;
	width: 90px;
	height: 96px;
	padding: 0.4em;
	margin: 0 0.4em 0.4em 0;
	text-align: center;
}

.gallery li h5 {
	margin: 0 0 0.4em;
	cursor: move;
}

.gallery li a {
	float: right;
}

.gallery li a.ui-icon-zoomin {
	float: left;
}

.gallery li img {
	width: 50px;
	height: 50px;
	cursor: move;
}

#trash {
	position: fixed;
	bottom: 0px;
	width: 98%;
	min-height: 18em;
	padding: 1%;
}

#trash h4 {
	line-height: 16px;
	margin: 0 0 0.4em;
}

#trash h4 .ui-icon {
	float: left;
}

.ui-widget {
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
	background: rgba(0, 0, 0, 0.6);
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
	background: rgba(0, 0, 0, 0.6);
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
	color: rgba(0, 0, 0, 0.9);
	font-weight: 700;
	text-transform: uppercase;
	font-size: 1.2rem;
	transition: all 300ms cubic-bezier(.9, 0, .33, 1);
}

.nav-links .link:hover {
	color: rgba(0, 0, 0, .5);
}

.inform {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: rgba(255, 255, 255, 0.8);
	font-size: 2rem;
	font-family: sans-serif;
	text-transform: uppercase;
	letter-spacing: 5px;
	text-shadow: 0 0 20px rgba(0, 0, 0, 0.6);
}

.support {
	position: absolute;
	right: 10px;
	bottom: 10px;
	padding: 10px;
	display: flex;
}

a {
	color: #222;
	transition: all 400ms ease;
}

a:hover {
	color: #222;
}

.navbar-expand-md .navbar-collapse {
	width: auto;
	flex: 0 1 auto;
}
</style>

</head>
<body class="antialiased">
	<script>
		inputkeyflag = false;
		inputSC = [];

		sumkeyflag = false;
		sumSC = [];
	</script>
	<div class="page">