<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OBBM Management</title>
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
							<div class="card py-3 bg-body-secondary">
								<%-- <div class="card-header border-0 pt-6">
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
											<form action="/admin/contract?status=All" method="get">
												<input type="text" data-kt-user-table-filter="search"
													name="sdt" value="${sdt}"
													class="form-control form-control-solid w-250px ps-14"
													placeholder="Search phone number" />
											</form>
										</div>
										<a href="#" class="btn btn-primary align-middle">Create
											New</a>
									</div>
									<div class="mt-2">
										<a href="?status=All"
											class="btn btn-outline-primary ${selectedStatus == 'All' ? 'active' : ''}">All</a>
										<a href="?status=Pending"
											class="btn btn-outline-primary ${selectedStatus == 'Pending' ? 'active' : ''}">Pending</a>
										<a href="?status=In Progress"
											class="btn btn-outline-primary ${selectedStatus == 'In Progress' ? 'active' : ''}">In
											Progress</a> <a href="?status=Accepted"
											class="btn btn-outline-primary ${selectedStatus == 'Accepted' ? 'active' : ''}">Accepted</a>
										<a href="?status=Rejected"
											class="btn btn-outline-primary ${selectedStatus == 'Rejected' ? 'active' : ''}">Rejected</a>
									</div>
								</div> --%>
								<div class="card-body pt-5">
									<h1 class="text-center">Contract Information</h1>
									<div>
										<div class="row mb-3">
											<div class="col-md-8 ">
												<h4>Customer</h4>
												<div class="card p-5 border border-2">
													<div class="row row-cols-lg-2 row-cols-sm-1">
														<div class="col">
															<div class="mb-3">
																<label for="tenkhachhang" class="form-label">Name</label>
																<input value="${contract.makhachhang.tenkhachhang}"
																	type="text" class="form-control" id="tenkhachhang"
																	aria-describedby="emailHelp" readonly />

															</div>
															<div class="mb-3">
																<label for="cccd" class="form-label">CCCD</label> <input
																	value="${contract.makhachhang.cccd}" type="text"
																	class="form-control" id="cccd"
																	aria-describedby="emailHelp" readonly />
															</div>
														</div>
														<div class="col">
															<div class="mb-3">
																<label for="sdt" class="form-label">Phone Number</label>
																<input value="${contract.makhachhang.sodienthoai}"
																	type="text" class="form-control" id="sdt"
																	aria-describedby="emailHelp" readonly />

															</div>
															<div class="mb-3">
																<label for="sdt" class="form-label">Address</label> <input
																	value="${contract.makhachhang.diachi}" type="text"
																	class="form-control" id="sdt"
																	aria-describedby="emailHelp" readonly />
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<h4>Organization</h4>
												<div class="card p-5 border border-2">
													<form:form action="/admin/contract/detail" method="post"
														modelAttribute="contract">
														<div>
															<div class="mb-3">
																<label for="sdt" class="form-label">Company</label> <input
																	value="OBBM - Online Banquet Booking Management"
																	type="text" class="form-control" id="sdt"
																	aria-describedby="emailHelp" readonly />

															</div>
															<div class="mb-3">
																<label for="sdt" class="form-label">Representative</label>
																<form:input path="nguoixuly" type="text"
																	class="form-control" id="nguoixuly"
																	aria-describedby="emailHelp" readonly="true" />
															</div>
														</div>
													</form:form>

												</div>
											</div>

										</div>

										<div class="mb-3">
											<form:form
												action="/admin/contract/detail/${contract.mahopdong}"
												method="post" modelAttribute="contract">
												<div class="row mb-3">
													<div class="col-md-12 ">
														<h4>Contract Detail</h4>
														<div class="card p-5 border border-2">
															<div class="row ">
																<div class="col-lg-8">
																	<div class="row">
																		<div class="col-lg-6">
																			<div class="mb-3">
																				<label for="tenkhachhang" class="form-label">Contract
																					ID</label>
																				<form:input path="mahopdong" type="text"
																					class="form-control text-primary" id="tenkhachhang"
																					aria-describedby="emailHelp" readonly="true" />

																			</div>
																			<div class="mb-3">
																				<label for="diadiemid" class="form-label">Location:</label>
																				<form:select path="diadiemid" class="form-select">
																					<c:forEach items="${locationList}" var="location">
																						<form:option value="${location.diadiemid}"
																							selected="${location.diadiemid == contract.diadiemid.diadiemid}">
																	                    ${location.tendiadiem}
																	                </form:option>
																					</c:forEach>
																				</form:select>
																			</div>
																		</div>
																		<div class="col-lg-6">
																			<div class="mb-3">
																				<label for="date" class="form-label">Created
																					Date </label>
																				<form:input path="ngaylap" type="date"
																					class="form-control text-primary" id="tenkhachhang"
																					aria-describedby="emailHelp" readonly="true" />
																			</div>

																			<div class="mb-3">
																				<label for="ngaytochuc" class="form-label">Celebrate
																					Date </label>
																				<form:input path="ngaytochuc" type="date"
																					class="form-control" id="ngaytochuc"
																					aria-describedby="emailHelp" />
																			</div>
																		</div>

																	</div>
																	<div class="row">
																		<div class="col-lg-6">
																			<div class="row">
																				<div
																					class="d-flex justify-content-between align-items-center w-100">
																					<label class="form-label">Dishes</label> <label
																						class="form-label">Amount</label>
																				</div>
																			</div>
																			<c:forEach items="${chiTietHopDong}" var="x">
																				<div class="row mb-3">
																					<div class="col-9">
																						<input type="text"
																							class="form-control text-primary"
																							value="${x.mamonan.tenmonan}" readonly />
																					</div>
																					<div class="col-3">
																						<input type="text"
																							class="form-control text-primary"
																							value="${x.soluongmonan}" readonly />
																					</div>

																				</div>
																			</c:forEach>

																		</div>
																		<div class="col-lg-6">
																			<div class="row">
																				<div
																					class="d-flex justify-content-between align-items-center w-100">
																					<label class="form-label">Services</label> <label
																						class="form-label">Amount</label>
																				</div>
																			</div>
																			<c:forEach items="${chiTietHopDong}" var="x">
																				<div class="row mb-3">
																					<div class="col-9">
																						<input type="text"
																							class="form-control text-primary"
																							value="${x.madichvu.tendichvu}" readonly />
																					</div>
																					<div class="col-3">
																						<input type="text"
																							class="form-control text-primary"
																							value="${x.soluongdichvu}" readonly />
																					</div>

																				</div>
																			</c:forEach>

																		</div>
																	</div>
																</div>





																<div class="col-lg-4">

																	<div class="mb-3">
																		<label for="expectedCost" class="form-label">Expected
																			Cost</label>
																		<form:input path="chiphidukien" type="text"
																			class="form-control" id="expectedCost"
																			aria-describedby="expectedCost" />
																	</div>
																	<div class="mb-3">
																		<label for="costsIncurred" class="form-label">Costs
																			incurred</label>
																		<form:input path="chiphiphatsinh" type="text"
																			class="form-control" id="costsIncurred"
																			aria-describedby="costsIncurred" />
																	</div>
																	<div class="mb-3">
																		<label for="tiencoc" class="form-label">Deposits</label>
																		<form:input path="tiencoc" type="text"
																			class="form-control" id="tiencoc"
																			aria-describedby="tiencoc" />
																	</div>
																	<div class="mb-3">
																		<label for="total" class="form-label">Total
																			Cost </label>
																		<form:input path="tongtien" type="text"
																			class="form-control text-success" id="total"
																			aria-describedby="total" readonly="true" />
																	</div>
																	<label class="form-label">Status: <span
																		class="<c:choose>
													                    <c:when test="${contract.trangthai == 'Pending'}">text-body-secondary</c:when>
													                    <c:when test="${contract.trangthai == 'Accepted'}">text-success</c:when>
													                    <c:when test="${contract.trangthai == 'Rejected'}">text-danger</c:when>
													                    <c:when test="${contract.trangthai == 'In Progress'}">text-warning</c:when>
													                    <c:otherwise>text-muted</c:otherwise>
													                </c:choose>">
																			<c:out value="${contract.trangthai}" />
																	</span></label>
																</div>

															</div>
														</div>
													</div>
												</div>

												<div class="mb-3">
													<button type="submit" class="btn btn-primary btn-sm"
														>Save</button>
													<button type="button" class="btn btn-warning btn-sm"
														onclick="confirmAction('Progressing', this)"
														formaction="/admin/contract/detail/progress/${contract.mahopdong}">Progressing</button>
													<button type="button" class="btn btn-success btn-sm"
														onclick="confirmAction('Accept', this)"
														formaction="/admin/contract/detail/accept/${contract.mahopdong}">Accept</button>
													<button type="button" class="btn btn-danger btn-sm"
														onclick="confirmAction('Reject', this)"
														formaction="/admin/contract/detail/reject/${contract.mahopdong}">Reject</button>
													<button type="button" class="btn btn-light btn-sm"
														onclick="window.location.href='/admin/contract/detail/print/${contract.mahopdong}'">
														Print Contract</button>

												</div>
											</form:form>

										</div>



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
							<span class="text-muted fw-bold me-1">2024 ©</span> <a
								href="https://keenthemes.com" target="_blank"
								class="text-gray-800 text-hover-primary">OBBM</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- <!-- Modal product-->
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
	</div> --%>
	<script type="text/javascript">


		function alertUser(title, message, status) {
			swal(title, message, status)
		}
	</script>

	<script type="text/javascript">
	function confirmAction(actionName, button) {
        Swal.fire({
            title: 'Confirm Action',
            text: 'Are you sure to ' + actionName + ' this contract?',
            iconHtml: '<i class="bi bi-question-circle" style="font-size: 72px;"></i>',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, ' + actionName
        }).then((result) => {
            if (result.isConfirmed) {
                // Create a temporary form to submit
                var form = document.createElement('form');
                form.method = 'post';
                form.action = button.getAttribute('formaction');
                
                // Add CSRF token if needed (Django example, adjust for your framework)
                var csrfToken = document.querySelector('input[name="csrfmiddlewaretoken"]');
                if (csrfToken) {
                    var input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = csrfToken.name;
                    input.value = csrfToken.value;
                    form.appendChild(input);
                }

                document.body.appendChild(form);
                form.submit();
            }
        });
    }
	document.addEventListener('DOMContentLoaded', function() {
		var expectedCostInput = document.getElementById('expectedCost');
		var costsIncurredInput = document.getElementById('costsIncurred');
		var totalInput = document.getElementById('total');
		var tienCocInput = document.getElementById('tiencoc');
		
  		 function calculateTotal() {
        var expectedCost = parseFloat(expectedCostInput.value) || 0;
        var costsIncurred = parseFloat(costsIncurredInput.value) || 0;
        var tienCoc = parseFloat(tienCocInput.value) || 0;

        var maxTienCoc = expectedCost + costsIncurred;
        if (tienCoc > maxTienCoc) {
            tienCoc = maxTienCoc;
            tienCocInput.value = maxTienCoc.toFixed(2);
        }

        var total = expectedCost + costsIncurred - tienCoc;
        if (total < 0) {
            total = 0;
        }
        totalInput.value = total.toFixed(2); // Làm tròn đến 2 chữ số thập phân
    }

    expectedCostInput.addEventListener('input', calculateTotal);
    costsIncurredInput.addEventListener('input', calculateTotal);
    tienCocInput.addEventListener('input', calculateTotal);

    // Tính tổng lần đầu khi trang được tải
    calculateTotal();

    function validateInput(event) {
        var value = event.target.value;
        // Chỉ cho phép nhập số thực và số nguyên
        var newValue = value.replace(/[^0-9.]/g, '');
        // Đảm bảo chỉ có một dấu chấm
        if (newValue.split('.').length > 2) {
            newValue = newValue.replace(/\.+$/, "");
        }
        // Không cho phép dấu chấm ở đầu
        if (newValue.startsWith('.')) {
            newValue = '';
        }
        event.target.value = newValue;

        if (event.target.id === 'tiencoc') {
            var expectedCost = parseFloat(expectedCostInput.value) || 0;
            var costsIncurred = parseFloat(costsIncurredInput.value) || 0;
            var maxTienCoc = expectedCost + costsIncurred;
            var tiencoc = parseFloat(newValue) || 0;
            if (tiencoc > maxTienCoc) {
                event.target.value = maxTienCoc.toFixed(2);
            }
        }
    }

    var inputs = ['tiencoc', 'expectedCost', 'costsIncurred'];
    inputs.forEach(function(id) {
        var input = document.getElementById(id);
        input.addEventListener('input', validateInput);
    });
});
  
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
	<c:if test="${not empty success_alert}">
		<script type="text/javascript">
			alertUser('Success!', '', 'success');
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