<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Prefix sử dụng JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>OBBM - banquet Booking Service</title>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<!-- 
    - favicon
  -->
<link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml" />

<!-- 
    - custom css link
  -->
<link rel="stylesheet" href="/assets/css/mainStyle.css" />
<link rel="stylesheet" href="/assets/css/customStyle.css" />

<!-- 
    - google font link
  -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Rubik:wght@400;500;600;700&family=Shadows+Into+Light&display=swap"
	rel="stylesheet" />

<!-- 
    - preload images
  -->
<link rel="preload" as="image" href="/assets/images/wedding-1.jpeg"
	media="min-width(768px)" />
<link rel="preload" as="image" href="/assets/images/wedding-1.jpeg"
	media="min-width(768px)" />
<link rel="preload" as="image" href="/assets/images/wedding-1.jpeg" />
</head>

<body id="top">
	<!-- 
    - #HEADER
  -->

	<jsp:include page="/WEB-INF/layout/header.jsp" />


	<main>
		<section
			style="background-image: url('/assets/images/wedding-1-small.jpg')">
		</section>

		<section class="section food-menu" id="food-menu">
			<div class="container">
				<p class="section-subtitle">All Dishes</p>

				<h2 class="h2 section-title">
					Our Delicious <span class="span">Foods</span>
				</h2>

				<p class="section-text">Food is any substance consumed to
					provide nutritional support for an organism.</p>

				<ul class="fiter-list">
					<li><a href="?category=All"
						class="filter-btn ${selectedCategory == 'All' ? 'active' : ''}">All</a></li>
					<li><a href="?category=Khai vị"
						class="filter-btn ${selectedCategory == 'Khai vị' ? 'active' : ''}">Appetizer</a></li>
					<li><a href="?category=Món Chính"
						class="filter-btn ${selectedCategory == 'Món Chính' ? 'active' : ''}">Main
							dishes</a></li>
					<li><a href="?category=Tráng Miệng"
						class="filter-btn ${selectedCategory == 'Tráng Miệng' ? 'active' : ''}">Dessert</a></li>
					<li><a href="?category=Đồ Uống"
						class="filter-btn ${selectedCategory == 'Đồ Uống' ? 'active' : ''}">Drinks</a></li>
					<li><a href="?category=Others"
						class="filter-btn ${selectedCategory == 'Others' ? 'active' : ''}">Others</a></li>
				</ul>

				<ul class="food-menu-list">
					<c:forEach items="${listMonAn.getContent()}" var="x">
						<li>
							<div class="food-menu-card">
								<div class="card-banner">
									<img
										src="${pageContext.request.contextPath}/assets/images/${x.hinhanh}"
										width="300" height="300" loading="lazy"
										alt="Fried Chicken Unlimited" class="w-100" />

									<div class="badge">-15%</div>

									<form action="/dishes/addToMenu" method="post">
										<input type="hidden" name="mamonan" value="${x.mamonan}">
										<button type="submit" class="btn food-menu-btn">AddTo Menu</button>
									</form>
								</div>

								<div class="wrapper">
									<p class="category ">${x.danhmucid.tendanhmuc}</p>

									<div class="rating-wrapper">
										<ion-icon name="star"></ion-icon>
										<ion-icon name="star"></ion-icon>
										<ion-icon name="star"></ion-icon>
										<ion-icon name="star"></ion-icon>
										<ion-icon name="star"></ion-icon>

									</div>
								</div>

								<h3 class="h3 card-title">${x.tenmonan }</h3>

								<div class="price-wrapper">
									<p class="price-text">Price:</p>

									<div class="price">${x.gia} đ</data>

										<del class="del">${x.gia * 1.25} đ</del>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>

				<div class="row">
					<div class="col-12 d-flex justify-content-center mt-4">
						<div class="btn-group" role="group" aria-label="Pagination">
							<button type="button" class="btn " onclick="paging(0)">First</button>
							<button type="button" class="btn "
								onclick="paging(${ listMonAn.pageable.pageNumber - 1 > 0 ? listMonAn.pageable.pageNumber - 1 : 0 })">Previous</button>
							<button type="button" class="btn "
								onclick="paging(${ (listMonAn.pageable.pageNumber + 1) > (listMonAn.totalPages - 1) ? listMonAn.totalPages - 1 : listMonAn.pageable.pageNumber + 1 })">Next</button>
							<button type="button" class="btn "
								onclick="paging(${ listMonAn.totalPages - 1 })">Last</button>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-12 text-center">Page ${ listMonAn.pageable.pageNumber + 1 }
							/ ${ listMonAn.totalPages }</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- 
    - #FOOTER
  -->
	<jsp:include page="/WEB-INF/layout/footer.jsp" />
	<script>
	var url = new URL(window.location.href);
	function paging(page){
		url.searchParams.set('page', page);
		window.location.href = url;
	}
	</script>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<!-- 
    - custom js link
  -->
	<script src="/assets/js/mainScript.js" defer></script>

	<!-- 
    - ionicon link
  -->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
