<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Prefix sử dụng JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OBBM - banquet Booking Service</title>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />

<!-- favicon -->
<link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml" />

<!-- custom css link -->
<link rel="stylesheet" href="/assets/css/mainStyle.css" />
<link rel="stylesheet" href="/assets/css/customStyle.css" />

<!-- google font link -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Rubik:wght@400;500;600;700&family=Shadows+Into+Light&display=swap"
	rel="stylesheet" />

<!-- preload images -->
<link rel="preload" as="image" href="/assets/images/wedding-1.jpeg"
	media="min-width(768px)" />
<link rel="preload" as="image" href="/assets/images/wedding-1.jpeg"
	media="min-width(768px)" />
<link rel="preload" as="image" href="/assets/images/wedding-1.jpeg" />
</head>

<body id="top">
	<!-- #HEADER -->
	<jsp:include page="/WEB-INF/layout/header.jsp" />

	<main>
		<section
			style="background-image: url('/assets/images/wedding-1-small.jpg')"></section>

		<section class="section section-divider white account-section"
			id="blog">

			<div class="container pt-4">
				<p class="section-subtitle">Account</p>
				<div class="profile-container">
					<div class="profile-photo">
						<img
							src="https://pbs.twimg.com/profile_images/1674815862879178752/nTGMV1Eo_400x400.jpg"
							alt="">
					</div>
					<p class="profile-name">${loggedInUsername}</p>
					<p class="join-date section-title">
						Registration Date: <span class="span">26/05/2024</span>
					</p>
					
				</div>

				<div class="container w-75">
					<form id="userInfoForm" class="footer-form form-account">

						<div
							class="d-flex align-items-center  justify-content-between mb-3">
							<p class="footer-list-title account-form-title">Profile info</p>
							<button type="button"
								class="edit-profile-btn navbar-link bi bi-pencil-square"></button>
						</div>

						<div class="input-wrapper">

							<input type="text" name="fullname" id="fullname" name="fullname"
								placeholder="Your Name" aria-label="Full Name:"
								class="input-field" disabled /> 
								
							<input type="text" value="${loggedInUsername}"
								name="user_name" required placeholder="UserName"
								aria-label="UserName" class="input-field" disabled />

						</div>

						<div class="input-wrapper">

							<input type="email" name="email_address" value="${loggedInEmail}" required
								placeholder="Email" aria-label="Email" class="input-field"
								disabled /> <input type="text" name="phone" required
								placeholder="Phone Number" aria-label="Phone Number"
								class="input-field" disabled />

						</div>

						<div class="input-wrapper">

							<input type="text" id="address" name="address"
								placeholder="Address" aria-label="Adress" class="input-field"
								disabled /> <input type="date" name="birthdate" id="birthdate"
								placeholder="Birthdate" aria-label="Date of Birth"
								class="input-field" disabled />

						</div>

						<div class="input-wrapper">

							<select name="gender" aria-label="Total person" id="gender" style="height: 40px"
								class="input-field">
								<option value="" selected disabled>-- Choose your
									gender --</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Other">Other</option>
							</select>

							<div class="input-wrapper">
								<!-- Các trường input -->
								<div class="upload-wrapper">
									<!-- Nút upload ảnh -->
									<label for="avatar-upload"
										class="custom-file-upload btn btn-secondary">
										ID card image  </label> <input type="file" accept="image/*"
										id="avatar-upload" onchange="handleFile(event)"
										class="file-input" style="display: none">
								</div>
								<!-- Hiển thị tên file -->
								<div class="file-info">
									<div id="file-name" class="file-name"></div>
									<div id="file-size" class="file-size"></div>
								</div>
								<!-- Thẻ để hiển thị ảnh -->
								
							<!--  	<div style="text-align: center;">
									<img id="previewImage"
										style="display: none; max-width: 80%; max-height: 300px; margin: 10px auto;">
								</div>-->
								<canvas id="canvas" style="display: none;"></canvas>
								<div style="display: none" id="result" class="mt-3"></div>
							</div>


							<!-- Thẻ để hiển thị ảnh -->
							<div style="text-align: center; display: none;">
								<img id="previewImage"
									style="display: none; max-width: 80%; max-height: 300px; margin: 10px auto;">
							</div>

							<canvas id="canvas" style="display: none;"></canvas>
							<div style="display: none" id="result" class="mt-3"></div>


						</div>




						<div style="text-align: center;">
							<button type="submit" class="btn btn-save-form" 
								style="margin: 10px auto;" disabled>Save</button>
						</div>



					</form>
				</div>

				<div
					class="d-flex flex-wrap fw-bold fs-3 mt-4 pe-2 justify-content-center">
					<a href="/account/logout"
						class="d-flex align-items-center me-5 mb-2  btn btn-hover"> <i
						class="bi bi-door-open me-3"></i> Đăng xuất
					</a>
				</div>
			</div>

		</section>
	</main>

	<!-- 
    - #FOOTER
  -->

	<jsp:include page="/WEB-INF/layout/footer.jsp" />
	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<!-- 
    - custom js link
  -->
	<script src="/assets/js/script.js" defer></script>

	<!-- 
    - ionicon link
  -->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<!-- Thêm vào cuối thẻ body -->
	<script src="https://cdn.jsdelivr.net/npm/jsqr@1.4.0/dist/jsQR.min.js"></script>
	<script>
		function handleFile(event) {
			const file = event.target.files[0];
			const reader = new FileReader();
			reader.onload = function(event) {
				const img = new Image();
				img.onload = function() {
					// Hiển thị ảnh khi đã chọn
					const previewImage = document
							.getElementById('previewImage');
					previewImage.src = img.src;
					previewImage.style.display = 'block';

					const canvas = document.getElementById('canvas');
					const context = canvas.getContext('2d');
					canvas.width = img.width;
					canvas.height = img.height;
					context.drawImage(img, 0, 0, canvas.width, canvas.height);
					// Cắt ảnh để chỉ lấy phần chứa mã QR code (góc trên bên phải)
					const qrArea = context.getImageData(canvas.width * 0.5, 0,
							canvas.width * 0.5, canvas.height * 0.5);
					const code = jsQR(qrArea.data, qrArea.width, qrArea.height);
					if (code) {
						// Hiển thị nội dung mã QR
						document.getElementById('result').innerText = `Thông tin từ mã QR: ${code.data}`;
						// Phân tích thông tin từ mã QR và điền vào các trường input
						const userInfo = code.data.split("||")[1].split("|");
						document.getElementById('fullname').value = userInfo[0];

						// Chuyển đổi định dạng ngày
						const birthdate = userInfo[1];
						const formattedBirthdate = birthdate.substring(4, 8)
								+ '-' + birthdate.substring(2, 4) + '-'
								+ birthdate.substring(0, 2);
						document.getElementById('birthdate').value = formattedBirthdate;

						// Điền giá trị vào dropdown gender
						const gender = userInfo[2];
						const genderSelect = document.getElementById('gender');
						if (gender === "Nam") {
							genderSelect.value = "Male";
						} else if (gender === "Nữ") {
							genderSelect.value = "Female";
						} else {
							genderSelect.value = "Other";
						}
						document.getElementById('address').value = userInfo[3];
					} else {
						document.getElementById('result').innerText = 'Không tìm thấy mã QR.';
					}
				};
				img.src = event.target.result;
			};
			reader.readAsDataURL(file);

			// Hiển thị tên file
			document.getElementById('file-name').innerText = file.name;
		}
	</script>

</body>
</html>
