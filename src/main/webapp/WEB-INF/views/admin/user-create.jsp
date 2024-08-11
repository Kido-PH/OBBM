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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<link href="/assets/css/plugins.bundle.css" rel="stylesheet"
	type="text/css" />
<link href="/assets/css/style.bundle.css" rel="stylesheet"
	type="text/css" />
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
										<h2>Create New User</h2>
										<form:form modelAttribute="userCreate"
											action="/admin/user/create" method="post"
											enctype="multipart/form-data">
											<div class="mb-3">
												<label for="tendangnhap" class="form-label">Username
													<span class="text-danger">*</span>
												</label>
												<form:input path="tendangnhap" type="text"
													class="form-control" required="required" />
											</div>
											<div class="mb-3">
												<label for="matkhau" class="form-label">Password <span
													class="text-danger">*</span></label>
												<form:input path="matkhau" type="password"
													class="form-control" required="required" />
											</div>
											<div class="mb-3">
												<label for="email" class="form-label">Email <span
													class="text-danger">*</span></label>
												<form:input path="email" type="email" class="form-control"
													required="required" />
											</div>
											<div class="d-flex mb-3">
												<label class="form-label me-3">Role  <span
													class="text-danger">*</span></label>
												<div class="me-3 mt-1">
													<form:select id="roleId" path="role.vaitroid">
														<form:options items="${roles}" itemValue="vaitroid"
															itemLabel="tenvaitro" />
													</form:select>
												</div>
											</div>
											<div class="mb-3">
												<label for="image" class="form-label">Profile Image</label>
												<input type="file" class="form-control" id="image"
													name="image" accept="image/*">
											</div>
											<button type="submit" class="btn btn-primary">Create</button>
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
		function alertUser(title, message, status) {
			swal(title, message, status)
		}

		<c:if test="${not empty error_user_create}">
		alertUser('Error!', 'Failed to create user!', 'error');
		</c:if>
		<c:if test="${not empty success_user_create}">
		alertUser('Success!', 'User created successfully!', 'success');
		</c:if>
	</script>
</body>
</html>
