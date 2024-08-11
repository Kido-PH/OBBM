<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/assets/css/mainStyle.css" />
<link rel="stylesheet" href="/assets/css/customStyle.css" />
</head>
<body>
	<header class="header" data-header>
		<div class="container">
			<h1>
				<a href="/home" class="logo">OBBM<span class="span">.</span></a>
			</h1>

			<nav class="navbar" data-navbar>
				<ul class="navbar-list">
					<li class="nav-item "><a href="/" class="navbar-link"
						data-nav-link>Home</a></li>

					<li class="nav-item"><a href="#about" class="navbar-link"
						data-nav-link>About Us</a></li>

					<li class="nav-item"><a href="/dishes" class="navbar-link"
						data-nav-link>Dishes</a></li>

					<li class="nav-item"><a href="#equiped" class="navbar-link"
						data-nav-link>Equipment</a></li>

					<li class="nav-item"><a href="#blog" class="navbar-link"
						data-nav-link>Blog</a></li>

					<li class="nav-item"><a href="#contact" class="navbar-link"
						data-nav-link>Contact Us</a></li>

					<c:if test="${user.role.vaitroid == 1}">
						<li><a href="/admin/category" class="navbar-link"
						data-nav-link>Admin</a></li>
					</c:if>

				</ul>
			</nav>

			<div class="header-btn-group">
				<button class="search-btn" aria-label="Search" data-search-btn>
					<ion-icon name="search-outline"></ion-icon>
				</button>
				<a href="/home/menu" class="navbar-link bi bi-receipt bill" data-nav-link></a>
				<c:if test="${not empty user}">
					<li><a href="/account" class="btn btn-hover align-middle">${user.tendangnhap}</a></li>
				</c:if>

				<c:if test="${empty user}">
					<a href="/login" class="btn btn-hover align-middle">Sign In</a>
				</c:if>

				<button class="nav-toggle-btn" aria-label="Toggle Menu"
					data-menu-toggle-btn>
					<span class="line top"></span> <span class="line middle"></span> <span
						class="line bottom"></span>
				</button>
			</div>
		</div>
	</header>

	<!-- 
    - #SEARCH BOX
  -->

	<div class="search-container" data-search-container>
		<div class="search-box">
			<input type="search" name="search" aria-label="Search here"
				placeholder="Type keywords here..." class="search-input" />

			<button class="search-submit" aria-label="Submit search"
				data-search-submit-btn>
				<ion-icon name="search-outline"></ion-icon>
			</button>
		</div>

		<button class="search-close-btn" aria-label="Cancel search"
			data-search-close-btn></button>
	</div>
</body>
</html>