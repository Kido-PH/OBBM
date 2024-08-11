<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        // Function to parse year and quarter from string and return a Date object
        function parseYearQuarter(str) {
            var parts = str.split('-');
            var year = parseInt(parts[0]);
            var quarter = parts[1];
            var month = (quarter === 'Q1') ? 0 : (quarter === 'Q2') ? 3 : (quarter === 'Q3') ? 6 : 9;
            return new Date(year, month);
        }

        var rawData = [
            ['Quarter', 'Revenue'],
            <c:forEach var="e" items="${data}">
                ['${e[0]}', ${e[1]}],
            </c:forEach>
        ];

        function drawChart(filteredData = rawData) {
            var dataTable = new google.visualization.DataTable();
            dataTable.addColumn('date', 'Quarter');
            dataTable.addColumn('number', 'Revenue');

            for (var i = 1; i < filteredData.length; i++) {
                dataTable.addRow([parseYearQuarter(filteredData[i][0]), filteredData[i][1]]);
            }

            var options = {
                title: 'Quarter Revenue',
                curveType: 'function',
                legend: { position: 'bottom' },
                hAxis: {
                    format: 'yyyy-Q',
                    gridlines: { count: 15 }
                }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
            chart.draw(dataTable, options);
        }

        function filterData() {
            var startYear = parseInt(document.getElementById('start-year').value);
            var endYear = parseInt(document.getElementById('end-year').value);
            var startQuarter = document.getElementById('start-quarter').value;
            var endQuarter = document.getElementById('end-quarter').value;

            if (isNaN(startYear) || isNaN(endYear)) {
                alert("Vui lòng chọn năm hợp lệ.");
                return;
            }

            var filteredData = rawData.filter(function(row) {
                if (row[0] === 'Quý') return true; // Keep header row
                var parsed = parseYearQuarter(row[0]);
                var startDate = parseYearQuarter(startYear + '-' + startQuarter);
                var endDate = parseYearQuarter(endYear + '-' + endQuarter);
                return parsed >= startDate && parsed <= endDate;
            });

            drawChart(filteredData);
            updateTable(filteredData);
        }

        function updateTable(filteredData) {
            var tableBody = document.getElementById('data-table-body');
            tableBody.innerHTML = '';

            filteredData.forEach(function(row, index) {
                if (index === 0) return; // Skip header row
                var newRow = tableBody.insertRow();
                var cellYearQuarter = newRow.insertCell(0);
                var cellRevenue = newRow.insertCell(1);
                cellYearQuarter.textContent = row[0];
                cellRevenue.textContent = new Intl.NumberFormat().format(row[1]) + ' VNĐ';
            });
        }
    </script>
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
                                       <div class="d-flex justify-content-between w-100">
                                      <h1 class="page-header">Revenue By Quarter</h1>
                                      <div>
                                       <a class="btn btn-primary" href="/admin/revenue/year">Year</a>
                                       <a class="btn btn-primary" href="/admin/revenue/month">Month</a>
                                      </div>                               
                                    </div>
                                        <div class="w-75">
                                            <label for="start-year">Year</label>
                                            <input type="number"   id="start-year" min="2000" max="2100">
                                            <label for="start-quarter">Quarter</label>
                                            <select id="start-quarter" >
                                                <option value="Q1">Q1</option>
                                                <option value="Q2">Q2</option>
                                                <option value="Q3">Q3</option>
                                                <option value="Q4">Q4</option>
                                            </select>
                                            <label for="end-year" >To year</label>
                                            <input type="number" id="end-year" min="2000" max="2100">
                                            <label for="end-quarter"  >To quarter</label>
                                            <select id="end-quarter" >
                                                <option value="Q1">Q1</option>
                                                <option value="Q2">Q2</option>
                                                <option value="Q3">Q3</option>
                                                <option value="Q4">Q4</option>
                                            </select>
                                            <button  class="btn btn-primary btn-sm" onclick="filterData()">Filter</button>
                                        </div>
                                        <div id="curve_chart" style="width: 100%; height: 500px;"></div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">Table Revenue</div>
                                                    <div class="panel-body">
                                                        <div class="dataTable_wrapper">
                                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Quarter</th>
                                                                        <th>Revenue</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="data-table-body">
                                                                    <c:forEach var="e" items="${data}">
                                                                        <tr>
                                                                            <td>${e[0]}</td>
                                                                            <td><fmt:formatNumber value="${e[1]}" pattern="#,###" /> VNĐ</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
				<span class="text-muted fw-bold me-1">2024©</span> <a
					href="https://keenthemes.com" target="_blank"
					class="text-gray-800 text-hover-primary">OBBM</a>
			</div>
		</div>
	</div>



</body>
</html>
