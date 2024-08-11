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
<style>
.confirm-icon {
	font-size: 24px; /* Kích thước icon tùy chỉnh */
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
							<div class="card">
								<div class="card-header border-0 pt-6 pe-5">
									<div class="card-title justify-content-between w-100">
										<div
											class="d-flex align-items-center position-relative my-1 ">
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
											<form action="/admin/user" method="get">
												<input type="text" data-kt-user-table-filter="search"
													name="name" value="${name}"
													class="form-control form-control-solid w-250px ps-14"
													placeholder="Search user" />
											</form>
										</div>
								<a href="/admin/user-create"
											class="btn btn-primary align-middle">Create New</a>
									</div>
									
								</div>

								<div class="card-body pt-0">
									<table class="table align-middle table-row-dashed fs-6 gy-5"
										id="kt_table_users">
										<thead>
											<tr
												class="text-start text-muted fw-bolder fs-7 text-uppercase gs-0">
												<th class="min-w-125px">User</th>
												<th class="min-w-125px">Role</th>
												<th class="min-w-125px">Created Date</th>
												<th class="text-end min-w-100px">Actions</th>
											</tr>
										</thead>
										<tbody class="text-gray-600 fw-bold">

											<c:forEach items="${accountList}" var="acc">
												<c:if test="${!acc.isdeleted}">
													<tr>
														<td class="d-flex align-items-center">
															<div
																class="symbol symbol-circle symbol-50px overflow-hidden me-3">
																<a href="#">
																	<div class="symbol-label">
																		<img src="/assets/images/${acc.hinhanh}"
																			class="w-100" />
																	</div>
																</a>
															</div>
															<div class="d-flex flex-column">
																<a href="#"
																	class="text-gray-800 text-hover-primary mb-1">${acc.tendangnhap}</a>
																<span>${acc.email}</span>
															</div>
														</td>
														<td>${acc.role.vaitroid == 1 ? 'Administrator' : 'User'}</td>
														<td><fmt:formatDate value="${acc.ngaytao}"
																pattern="dd/MM/yyyy" /></td>
														<td class="text-end"><a href="#"
															data-bs-toggle="modal" data-bs-target="#userModal"
															onclick="editUser('${acc.taikhoanid},${acc.tendangnhap},${acc.email},${acc.matkhau},${!acc.isdeleted},${acc.role.vaitroid}');"
															class="btn btn-warning btn-active-light-primary btn-sm p-1">
																<i class="p-0 bi bi-pencil-square"></i>
														</a> <a href="/admin/user/delete/${acc.taikhoanid}"
															class="btn btn-danger btn-active-light-primary btn-sm p-1"
															onclick="confirmDelete('${acc.taikhoanid}', '${acc.tendangnhap}', event)">
																<i class="p-0 bi bi-trash3"></i>
														</a></td>
													</tr>
												</c:if>
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
							<span class="text-muted fw-bold me-1">2023©</span> <a
								href="https://keenthemes.com" target="_blank"
								class="text-gray-800 text-hover-primary">OBBM</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal user-->
	<div class="modal" id="userModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title ">Edit User</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form action="/admin/user/edit" method="post"
						modelAttribute="userEdit" enctype="multipart/form-data">
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Account
								ID <span class="form-text text-danger">*</span>
							</label>
							<form:input id="taikhoanid" path="taikhoanid" readonly="true"
								type="text" class="form-control" required="required" />
						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
								<span class="form-text text-danger">*</span>
							</label>
							<form:input id="email" path="email" type="email"
								class="form-control" required="required" />
						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Username
							</label>
							<form:input id="tendangnhap" path="tendangnhap" type="text"
								class="form-control" />
						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Password
								<span class="form-text text-danger">*</span>
							</label>
							<form:input id="matkhau" path="matkhau" type="password"
								class="form-control" required="required" />
						</div>
						<div class="d-flex mb-3 mt-5">
							<label class="form-label me-3">Disable: </label>
							<div class="me-3 mt-1">
								<form:checkbox id="isdeleted" value="true" path="isdeleted" />
							</div>
						</div>
						<div class="d-flex mb-3">
							<label class="form-label me-3">Role: </label>
							<div class="me-3 mt-1">
								<form:select id="roleId" path="role.vaitroid">
									<form:options items="${roles}" itemValue="vaitroid"
										itemLabel="tenvaitro" />
								</form:select>
							</div>
						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Photo</label>
							<input id="photoFile" name="image" type="file"
								class="form-control" />
						</div>
						<button type="submit" class="btn btn-primary float-end">Submit</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function editUser(acc) {
			const account = acc.split(",");
			document.getElementById("taikhoanid").value = account[0];
			document.getElementById("tendangnhap").value = account[1];
			document.getElementById("email").value = account[2];
			document.getElementById("matkhau").value = account[3];		
			document.getElementById("isdeleted").checked = (account[4] == 'false') ? true
					: false;
			document.getElementById("roleId").value = account[5];
		}

		function alertUser(title, message, status) {
			swal(title, message, status)
		}
	
	</script>

	<script type="text/javascript">
	    function confirmDelete(userId, username, event) {
	        event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

	        Swal.fire({
	            title: 'Are you sure?',
	            text: 'You will not be able to recover the user "' + username + '"!',
	            iconHtml: '<i class="bi bi-x-circle-fill" style="font-size: 68px;"></i>',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: 'Yes, delete it!'
	        }).then((result) => {
	            if (result.isConfirmed) {
	                window.location.href = '/admin/user/delete/' + userId;
	            }
	        });
	    }
	</script>



	<c:if test="${not empty error_user_delete}">
		<script type="text/javascript">
			alertUser('Error!', 'Delete fail!', 'error');
		</script>
	</c:if>
	<c:if test="${not empty success_user_delete}">
		<script type="text/javascript">
			alertUser('Success!', 'Delete success!', 'success');
		</script>
	</c:if>
	<c:if test="${not empty error_user_update}">
		<script type="text/javascript">
			alertUser('Error!', 'Update fail!', 'error');
		</script>
	</c:if>
	<c:if test="${not empty success_user_update}">
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