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
							<div class="card">
								<div class="card-header border-0 pt-6">
									<div class="card-title justify-content-between w-100">
										<div class="d-flex align-items-center position-relative my-1">
											<span class="svg-icon svg-icon-1 position-absolute ms-6">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none">
														<rect opacity="0.5" x="17.0365" y="15.1223"
														width="8.15546" height="2" rx="1"
														transform="rotate(45 17.0365 15.1223)" fill="black" />
														<path
														d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
														fill="black" />
													</svg>
											</span>
											<form action="/admin/category" method="get">
												<input type="text" data-kt-user-table-filter="search"
													name="name" value="${name}"
													class="form-control form-control-solid w-250px ps-14"
													placeholder="Search category" />
											</form>
										</div>
										<a href="/admin/category-create"
											class="btn btn-primary align-middle">Create New</a>
									</div>
								</div>
								<div class="card-body pt-0">
									<table class="table align-middle table-row-dashed fs-6 gy-5"
										id="kt_table_users">
										<thead>
											<tr
												class="text-start text-muted fw-bolder fs-7 text-uppercase gs-0">
												<th class="min-w-125px">Category ID</th>
												<th class="min-w-125px">Name</th>
												<th class="min-w-125px">Description</th>
												<th class="text-end min-w-100px">Actions</th>
											</tr>
										</thead>
										<tbody class="text-gray-600 fw-bold">
											<c:forEach items="${categoryList}" var="c">
												<tr>
													<td class="d-flex align-items-center">
														<div class="d-flex flex-column">
															<a href="#" class="text-gray-800 text-hover-primary mb-1">${c.danhmucid}</a>
														</div>
													</td>
													<td>${c.tendanhmuc}</td>
													<td>${c.mota}</td>
													<td class="text-end"><a href="#"
														data-bs-toggle="modal" data-bs-target="#productModal"
														onclick="editProduct('${c.danhmucid}+${c.tendanhmuc}+${c.mota}')"
														class="btn btn-warning btn-active-light-primary btn-sm p-1">
															<i class="p-0 bi bi-pencil-square"></i>
													</a>
														<form action="/admin/category/delete/${c.danhmucid}"
															method="post" style="display: inline;"
															class="delete-form">
															<button type="button"
																class="btn btn-danger btn-active-light-primary btn-sm p-1"
																onclick="confirmDelete('${c.tendanhmuc}', this.form)">
																<i class="p-0 bi bi-trash3"></i>
															</button>
														</form></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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

	<!-- Modal product-->
	<div class="modal" id="productModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title ">Edit Category</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form action="/admin/category/edit" method="post"
						modelAttribute="categoryEdit">
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Category
								ID <span class="form-text text-danger">*</span>
							</label>
							<form:input id="danhmucid" path="danhmucid" readonly="true"
								type="number" class="form-control" required="required" />
						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Name <span
								class="form-text text-danger">*</span></label>
							<form:input id="tendanhmuc" path="tendanhmuc" type="text"
								class="form-control" required="required" />
						</div>
						<div class="mb-3">
							<label for="description" class="form-label">Description</label>
							<form:textarea id="mota" path="mota" class="form-control"
								rows="3" required="required" />
						</div>

						<button type="submit" class="btn btn-primary float-end">Submit</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function editProduct(pro) {
			const account = pro.split("+");
			document.getElementById("danhmucid").value = account[0];
			document.getElementById("tendanhmuc").value = account[1];
			document.getElementById("mota").value = account[2];
		}

		function alertUser(title, message, status) {
			swal(title, message, status)
		}
	</script>

	<script type="text/javascript">
	function confirmDelete(name, form) {
        Swal.fire({
            title: 'Are you sure?',
            text: 'You will not be able to recover the category "' + name + '"!',
            iconHtml: '<i class="bi bi-x-circle-fill" style="font-size: 68px;"></i>',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                form.submit();
            }
        });
        return false; // Ngăn chặn hành động mặc định của nút
    }
</script>

	<c:if test="${not empty error_category_delete}">
		<script type="text/javascript">
			alertUser('Error!', 'Delete fail!', 'error');
		</script>
	</c:if>
	<c:if test="${not empty warning_category_delete}">
		<script type="text/javascript">
			alertUser('Please delete dishes from this category first', 'Delete fail!', 'error');
		</script>
	</c:if>
	<c:if test="${not empty success_category_delete}">
		<script type="text/javascript">
			alertUser('Success!', 'Delete success!', 'success');
		</script>
	</c:if>
	<c:if test="${not empty error_category_update}">
		<script type="text/javascript">
			alertUser('Error!', 'Update fail!', 'error');
		</script>
	</c:if>
	<c:if test="${not empty success_category_update}">
		<script type="text/javascript">
			alertUser('Success!', 'Update success!', 'success');
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