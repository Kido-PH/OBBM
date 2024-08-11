<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<link href="/assets/css/plugins.bundle.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="d-flex flex-column flex-root">
		<div class="page d-flex flex-row flex-column-fluid">
			<jsp:include page="/WEB-INF/layout/admin/adminAside.jsp"></jsp:include>
			<div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
				<jsp:include page="/WEB-INF/layout/admin/adminHeader.jsp"></jsp:include>
				<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
					<div class="post d-flex flex-column-fluid" id="kt_post">
						<div id="kt_content_container" class="container">
							<div class="card pb-3">
								<div class="card-header border-0 pt-6">
									<div class="card-title w-100 d-block">
										<h3>Create new Category</h3>
										<form:form modelAttribute="categoryCreate" action="/admin/category-create" method="post">
											<div class="mb-3 mt-3">
												<label for="tendanhmuc" class="form-label">Name <span class="form-text text-danger">*</span></label>
												<form:input id="tendanhmuc" path="tendanhmuc" type="text" class="form-control" required="required" />
											</div>
											<div class="mb-3">
												<label for="mota" class="form-label">Description</label>
												<form:textarea id="mota" path="mota" class="form-control" rows="3" required="required" />
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
					<div class="container-fluid d-flex flex-column flex-md-row align-items-center justify-content-between">
						<div class="text-dark order-2 order-md-1">
							<span class="text-muted fw-bold me-1">2024©</span> <a href="https://keenthemes.com" target="_blank" class="text-gray-800 text-hover-primary">OBBM</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function alertUser(title, message, status){
			swal(title, message, status);
		}
	</script>
	<c:if test="${not empty error_category_create}">
		<script type="text/javascript">
			alertUser('Error!', 'Category creation failed!', 'error');
		</script>
	</c:if>
	<c:if test="${not empty success_category_create}">
		<script type="text/javascript">
			alertUser('Success!', 'Category created successfully!', 'success');
		</script>
	</c:if>
	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</body>
</html>
