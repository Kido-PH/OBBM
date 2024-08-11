<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!--begin::Fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<!--end::Fonts-->
<!--begin::Global Stylesheets Bundle(used by all pages)-->
<link href="/assets/css/plugins.bundle.css" rel="stylesheet"
	type="text/css" />
<link href="/assets/css/style.bundle.css" rel="stylesheet"
	type="text/css" />
<!--end::Global Stylesheets Bundle-->

<style type="text/css">
.img_up {
	position: relative;
	border: 2px dashed #aaa;
	text-align: center;
	-webkit-transition: all .6s;
	transition: all .6s;
	width: 100%;
	min-height: 100px;
}

.input_upload_file {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 10;
	opacity: 0;
	cursor: pointer;
}

.img_upload_button {
	border: 1px solid transparent;
	margin: 0 !important;
	min-width: 156px;
}

.img_upload_button .file-preview {
	width: 156px;
}

.img_upload_button .file-preview svg {
	fill: #aaa;
	height: 36%;
}
</style>
</head>
<body>
	<div class="d-flex flex-column flex-root">
		<div class="page d-flex flex-row flex-column-fluid">

			<jsp:include page="/WEB-INF/layout/admin/adminAside.jsp"></jsp:include>

			<div class="wrapper d-flex flex-column flex-row-fluid"
				id="kt_wrapper">

				<jsp:include page="/WEB-INF/layout/admin/adminHeader.jsp"></jsp:include>

				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<div class="post d-flex flex-column-fluid" id="kt_post">
						<div id="kt_content_container" class="container">
							<div class="card pb-3">
								<div class="card-header border-0 pt-6">
									<div class="card-title w-100 d-block">
										<h3>Create new Dishes</h3>
										<div id="preview_img_upload" class="w-100 mb-2"></div>
										<form:form modelAttribute="dishesCreate"
											action="/admin/dishes/create" method="post"
											enctype="multipart/form-data">
											<div class="mb-3">
												<label for="createMamonan" class="form-label">Dish
													ID <span class="form-text text-danger">*</span>
												</label>
												<form:input id="createMamonan" path="mamonan" type="text"
													class="form-control" required="required" />
											</div>
											<div class="mb-3">
												<label for="createTenmonan" class="form-label">Dish
													Name <span class="form-text text-danger">*</span>
												</label>
												<form:input id="createTenmonan" path="tenmonan" type="text"
													class="form-control" required="required" />
											</div>
											<div class="mb-3">
												<label for="createGia" class="form-label">Price</label>
												<form:input id="createGia" path="gia" type="number"
													class="form-control" />
											</div>
											<div class="mb-3">
												<label for="createMota" class="form-label">Description
													<span class="form-text text-danger">*</span>
												</label>
												<form:input id="createMota" path="mota" type="text"
													class="form-control" required="required" />
											</div>
											<div class="d-flex mb-3 mt-5">
												<label class="form-label me-3">Disable: </label>
												<div class="me-3 mt-1">
													<form:checkbox id="createIsdeleted" value="true"
														path="isdeleted" />
												</div>
											</div>
											<div class="d-flex mb-3">
												<label class="form-label me-3">Category ID: </label>
												<div class="me-3 mt-1">
													<form:select id="createCategoryId"
														path="danhmucid.danhmucid">
														<form:options items="${categories}" itemValue="danhmucid"
															itemLabel="tendanhmuc" />
													</form:select>
												</div>
											</div>
											<div class="mb-3">
												<label for="createHinhanh" class="form-label">Photo</label>
												<input id="createHinhanh" name="image" type="file"
													class="form-control" />
											</div>
											<button type="submit" class="btn btn-primary float-end mb-3">Create</button>
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
					<div
						class="container-fluid d-flex flex-column flex-md-row align-items-center justify-content-between">
						<div class="text-dark order-2 order-md-1">
							<span class="text-muted fw-bold me-1">2024©</span> <a
								href="https://keenthemes.com" target="_blank"
								class="text-gray-800 text-hover-primary">OBBM</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$('#createDishModal').on('show.bs.modal', function () {
	    $('#createMamonan').val('');
	    $('#createTenmonan').val('');
	    $('#createGia').val('');
	    $('#createMota').val('');
	    $('#createIsdeleted').prop('checked', false);
	    $('#createCategoryId').val('');
	    $('#createHinhanh').val('');
	});
		function alertUser(title, message, status){
			swal(
			  title,
			  message,
			  status
	        )
		}

		function changeFile(input){
			document.getElementById("preview_img_upload").innerHTML = "";
			const file = input.files;
			for(const fi of file){
				preFile(fi);
			}
		}
		function preFile(file){
			const preview = document.getElementById('preview_img_upload');
			const reader = new FileReader();
			reader.onload = e => {
				const img = document.createElement('img');
				img.src = e.target.result;
				img.height = 200;
				img.style.width = '25%';
				img.style.borderRadius = '10px';
				img.alt = 'file';
				preview.appendChild(img);
			}
			reader.readAsDataURL(file);
		}
	</script>
	<c:if test="${not empty error_product_add}">
		<script type="text/javascript">
			alertUser('Error!', 'Add fail!', 'error');
		</script>
	</c:if>
	<c:if test="${not empty success_product_add}">
		<script type="text/javascript">
			alertUser('Success!', 'Add success!', 'success');
		</script>
	</c:if>

	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
		integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
		crossorigin="anonymous"></script>
</body>
</html>