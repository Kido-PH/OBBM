<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/contract.css" />
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
<style>
/* Your custom CSS here */
.form-section-title {
	font-weight: bold;
	margin-top: 20px;
	border-bottom: 2px solid #ccc;
	padding-bottom: 5px;
}

.form-group label {
	font-weight: bold;
}

.container {
	max-width: 870px;
}

.form-group {
	width: 400px;
	margin: 20px;
	margin-right: 0px;
}

.form-group-small {
	width: 190px;
	margin-right: 0px;
}

.button-group {
	text-align: center;
	margin-top: 20px;
}

button {
	width: 236px;
}
</style>
</head>
<body style="height: 700px; margin-top: 150px; margin-bottom: 200px">

	<jsp:include page="/WEB-INF/layout/header.jsp" />

	<div class="container mt-5 form-contract">
		<form action="submit_contract.jsp" method="POST" id="contractForm">
			<div class="form-section">
				<div class="form-section-title">
					<h2 style="text-align: center;">Contract Information</h2>
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="contract_code">Contract Code:</label> <input
							type="text" class="form-control" id="contract_code"
							name="contract_code" readonly required>
					</div>
					<div class="form-group col-md-6">
						<label for="customer_id">Customer ID:</label> <input type="text"
							class="form-control" id="customer_id" name="customer_id" readonly
							required>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="customer_name">Customer Name:</label> <input
							type="text" class="form-control" id="customer_name"
							name="customer_name" readonly required>
					</div>
					<div class="form-group col-md-6">
						<label for="event_type">Event Type:</label> <select
							class="form-control" id="event_type" name="event_type" required>
							<option value="">Select Event Type</option>
							<option value="Wedding">Wedding</option>
							<option value="Birthday">Birthday</option>
							<option value="Anniversary">Anniversary</option>
							<!-- Add more event types here -->
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="event_date">Event Date:</label> <input type="date"
							class="form-control" id="event_date" name="event_date" required>
					</div>
					<div class="form-group form-group-small col-md-3">
						<label for="start_time">Start Time:</label> <input type="time"
							class="form-control" id="start_time" name="start_time" required>
					</div>
					<div class="form-group form-group-small col-md-3">
						<label for="end_time">End Time:</label> <input type="time"
							class="form-control" id="end_time" name="end_time" required>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="menu_id">Menu Code:</label> <select
							class="form-control" id="menu_id" name="menu_id" required>
							<option value="">Select Menu Code</option>
							<option value="M001">Menu 1</option>
							<option value="M002">Menu 2</option>
							<!-- Add more menu codes here -->
						</select>
					</div>
					<div class="form-group col-md-6">
						<label for="service_type">Service Type:</label> <select
							class="form-control" id="service_type" name="service_type"
							required>
							<option value="">Select Service Type</option>
							<option value="Decoration">Decoration</option>
							<option value="Catering">Catering</option>
							<!-- Add more service types here -->
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="table_number">Table Number:</label> <input
							type="number" class="form-control" id="table_number"
							name="table_number">
					</div>
					<div class="form-group col-md-6">
						<label for="host_name1">Host Name:</label> <input type="text"
							class="form-control" id="host_name1" name="host_name1">
					</div>
				</div>
				<div class="row">
					<div class="form-group form-group-small col-md-3">
						<label for="tax">Tax %:</label> <input type="number"
							class="form-control" id="tax" name="tax" value="10" readonly>
					</div>
					<div class="form-group form-group-small col-md-3"
						style="margin-right: 0px;">
						<label for="meal_cost">Meal Cost:</label> <input type="number"
							class="form-control" id="meal_cost" name="meal_cost" value="0"
							readonly>
					</div>
					<div class="form-group form-group-small col-md-3">
						<label for="additional_cost">Additional Cost:</label> <input
							type="number" class="form-control" id="additional_cost"
							name="additional_cost" value="0" readonly>
					</div>
					<div class="form-group form-group-small col-md-3">
						<label for="total_amount">Total Amount:</label> <input
							type="number" class="form-control" id="total_amount"
							name="total_amount" value="0" readonly>
					</div>
				</div>
			</div>
			<!-- Button Group -->
			<div class="button-group">
				<button type="submit" class="btn btn-success" id="submit_contract">Submit
					Contract</button>
			</div>
		</form>
	</div>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Proceed to contract button click event
			document.getElementById("backToCustomerInfo").addEventListener(
					"click", function() {
						// Redirect to contract page
						window.location.href = "customerinfor";
					});
		});
	</script>

</body>
</html>
