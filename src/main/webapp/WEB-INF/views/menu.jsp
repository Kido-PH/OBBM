<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="Menu">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu</title>
<!-- Bootstrap CSS -->

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/menu.css" />
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

</head>
<body id="top">

<jsp:include page="/WEB-INF/layout/header.jsp" />

	<div style="">
			<div class="">
		<div style="margin-left: 0">
			<p class="Subtitle">Menu</p>
			<h2 class="h2 section-title"
				style="margin-left: 680px; font-weight: 500px">
				Our <span class="span section-title"
					style="color: hsl(32, 100%, 59%); text-transform: none; font-weight: 500">Menu</span>
			</h2>
			<p class="section-text" style="text-align: center">Choose the menu according to your
				preferences.</p>
		</div>

		<div class="row">
			<div class="col-6">
				<form action="" class="menu-form" style="margin-left: 130px;">
					<div class="container menu-section">
						<h2>Menu</h2>

						
						<div class="category appetizer row">
							<h3>Appetizer</h3>
							<div class="col-10">
								<ul class="food-menu-list">
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img" style="width: 50%">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7" style="width: 50%">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="col-2">
								<button class="filter-btn">+</button>
							</div>
						</div>
						<div class="category main-dishes row">
							<h3>Main dishes</h3>
							<div class="col-10">
								<ul class="food-menu-list">
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="col-2">
								<button class="filter-btn">+</button>
							</div>
						</div>
						<div class="category desserts row">
							<h3>Dessert</h3>
							<div class="col-10">
								<ul class="food-menu-list">
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="col-2">
								<button class="filter-btn">+</button>
							</div>
						</div>
					</div>
					<div class="total-price" style="display: block;">
						<p style="margin-left: 35px">Total Price:</p>
					</div>
					<div class="modal-buttons" style="width: 600px">
						<button type="button" id="add-dish-btn" class="preview-menu-btn "
							style="margin-left: 0px">Preview the menu</button>
						<a class="create-menu-btn" type="button" href="${pageContext.request.contextPath}/contract">Go to Contract</a>
					</div>
				</form>
			</div>
			<div class="col-6 menu-suggest">
				<form action="" class="menu-form" style="height: 660px">
					<div class="container menu-section">
						<h2 style="margin-left: 150px">Menu Suggest</h2>
						<div class="category appetizer row" style="margin-left: 15px">
							<h3>Appetizer</h3>
							<div class="col-10">
								<ul class="food-menu-list">
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets//images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets//images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets//images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="category main-dishes row" style="margin-left: 15px">
							<h3>Main dishes</h3>
							<div class="col-10">
								<ul class="food-menu-list">
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets//images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="category desserts row" style="margin-left: 15px">
							<h3>Dessert</h3>
							<div class="col-10">
								<ul class="food-menu-list">
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
									<li class="food-menu-detail row">
										<div class="col-5 food-menu-detail-img">
											<img
												src="${pageContext.request.contextPath}/assets/images/food-menu-1.png"
												alt="" />
										</div>
										<div class="col-7">
											<div class="food-menu-detail-text-content">
												<p class="name-dishes">Glaric Bread</p>
												<p class="price-dishes">49.00$</p>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="total-price" style="display: block;">
						<p style="margin-left: 65px">Total Price:</p>
					</div>
					<div>
						<button class="preview-menu-btn" type="button"
							style="margin-left: 235px; margin-top: 0px" id="add-dish-btn">
							Choose menu</button>
					</div>
				</form>
			</div>
		</div>
		<!-- Modal -->
		<div id="myModal" class="modal" onclick="closeModal()">
			<div class="modal-content"
				style="background-image: url('${pageContext.request.contextPath}/assets/images/menu.jpg')">
				<h2>Menu</h2>
				<div class="category appetizer" style="margin-bottom: 10px">
					<h3 style="padding-left: 100px; color: rgb(59, 59, 59)">Appetizer</h3>
					<ul class="menu-items">
						<li>Glaric Bread</li>
						<li>Salmon Tartare</li>
						<li>Caprese Salad</li>
					</ul>
				</div>
				<div class="category main-dishes">
					<h3 style="padding-left: 100px; color: rgb(59, 59, 59)">Main
						Dishes</h3>
					<ul class="menu-items">
						<li>Grilled Chicken</li>
						<li>Beef Steak</li>
						<li>Pasta Carbonara</li>
					</ul>
				</div>
				<div class="category desserts">
					<h3 style="padding-left: 100px; color: rgb(59, 59, 59)">Desserts</h3>
					<ul class="menu-items">
						<li>Cheesecake</li>
						<li>Tiramisu</li>
						<li>Chocolate Brownie</li>
					</ul>
				</div>
				<p style="text-align: center">...</p>
				<p style="text-align: center">Enjoy the meal!!</p>
				<div class="modal-buttons">
					<button class="close-modal-btn modal-btn" onclick="closeModal()">Return</button>
					<button class="finalize-menu-btn modal-btn" type="button">Finalize
						the menu</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<jsp:include page="/WEB-INF/layout/footer.jsp" />
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var modal = document.getElementById("myModal");
			var btns = document.querySelectorAll("#add-dish-btn");
			var closeBtn = document.querySelector(".close");
			var closeModalBtn = document.querySelector(".close-modal-btn");

			btns.forEach(function(btn) {
				btn.onclick = function() {
					modal.style.display = "block";
				};
			});

			closeBtn.onclick = function() {
				modal.style.display = "none";
			};

			closeModalBtn.onclick = function() {
				modal.style.display = "none";
			};

			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			};
		});

		// Hàm để ẩn modal
		function closeModal() {
			var modal = document.getElementById("myModal");
			modal.style.display = "none";
		}
	</script>
	<!-- Bootstrap JS and dependencies (optional) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
