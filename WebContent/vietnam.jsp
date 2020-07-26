<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Include the JSTL Core library in JSP --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript">
	var jsonData = [];
	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : "https://api.apify.com/v2/datasets/RnzK2Aea1RlgBcauw/items?format=json&clean=1",
									dataType : "json",
									async : false,
									success : function(result) {
										jsonData = result;
									}
								});
					});

	// Load the Visualization API and the corechart package.
	google.charts.load('current', {
		packages : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Thời gian');
		data.addColumn('number', 'Ca nhiễm');
		data.addColumn('number', 'Hồi phục');
		data.addColumn('number', 'Dương tính');
		data.addColumn('number', 'Tử vong');

		//        get 10 last statistic updated api time
		for (var i = jsonData.length - 10; i < jsonData.length; i++) {
			var day = jsonData[i].lastUpdatedAtApify;
			var cases = jsonData[i].infected;
			var recovered = jsonData[i].recovered;
			var active = jsonData[i].treated;
			var deaths = jsonData[i].deaths;
			data.addRows([ [ day, cases, recovered, active, deaths ] ]);
		}
		;

		var options = {
			'width' : 1150,
			'height' : 350,
			'legend' : 'none',
			trendlines : {
				0 : {
					type : 'polynomial',
					degree : 3,
					visibleInLegend : true,
				}
			}
		// Draw a trendline for data series 0.
		};

		// Instantiate and draw the chart.
		var chart = new google.visualization.ColumnChart(document
				.getElementById('timeline'));
		chart.draw(data, options);

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>

<div class="row" style="display: flex; justify-content: center;">
	<div class="card">
		<div class="col-12 col-lg-8 col-xl-8">
			<div class="card-header" style="margin-left: 400px;">BIỂU ĐỒ CỘT
				THEO DÕI THEO THỜI GIAN</div>
			<div id="timeline"></div>

		</div>
	</div>

</div>
<!--End Row-->

<div class="row">
	<div class="col-12 col-lg-12">
		<div class="card">
			<div class="card-header">
				SỐ LIỆU CHO TỪNG THÀNH PHỐ<br> <br>
			</div>
			<div class="table-responsive">
				<table class="table align-items-center table-flush table-borderless">
					<thead>
						<c:set var="totalCases" value="${0}" />
						<c:set var="totalActive" value="${0}" />
						<c:set var="totalDeaths" value="${0}" />
						<c:set var="totalRecovered" value="${0}" />
						<tr>
							<th>Thành Phố</th>
							<th>Ca Nhiễm</th>
							<th>Dương Tính</th>
							<th>Hồi Phục</th>
							<th>Tử Vong</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${vietnamStatistic}">

							<tr>
								<td><c:out value="${list.name}" /></td>
								<td><c:out value="${list.cases}" /></td>
								<td><c:out value="${list.active}" /></td>
								<td><c:out value="${list.recovered}" /></td>
								<td><c:out value="${list.deaths}" /></td>

								<c:set var="totalCases" value="${totalCases + list.cases}" />
								<c:set var="totalActive" value="${totalActive + list.active}" />
								<c:set var="totalDeaths" value="${totalDeaths + list.deaths}" />
								<c:set var="totalRecovered"
									value="${totalRecovered + list.recovered}" />
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--End Row-->

<div class="card mt-3">
	<div class="card-content">
		<div class="row row-group m-0">
			<div class="col-12 col-lg-6 col-xl-3 border-light">
				<div class="card-body">
					<h5 class="text-white mb-0">${totalCases}<span
							class="float-right"></span>
					</h5>
					<div class="progress my-3" style="height: 3px;">
						<div class="progress-bar" style="width: 55%"></div>
					</div>
					<p class="mb-0 text-white small-font">Tổng Ca Nhiễm</p>
				</div>
			</div>
			<div class="col-12 col-lg-6 col-xl-3 border-light">
				<div class="card-body">
					<h5 class="text-white mb-0">${totalActive}<span
							class="float-right"></span>
					</h5>
					<div class="progress my-3" style="height: 3px;">
						<div class="progress-bar" style="width: 55%"></div>
					</div>
					<p class="mb-0 text-white small-font">Tổng Ca Dương Tính</p>
				</div>
			</div>
			<div class="col-12 col-lg-6 col-xl-3 border-light">
				<div class="card-body">
					<h5 class="text-white mb-0">${totalDeaths}<span
							class="float-right"></span>
					</h5>
					<div class="progress my-3" style="height: 3px;">
						<div class="progress-bar" style="width: 55%"></div>
					</div>
					<p class="mb-0 text-white small-font">Tổng Ca Tử Vong</p>
				</div>
			</div>
			<div class="col-12 col-lg-6 col-xl-3 border-light">
				<div class="card-body">
					<h5 class="text-white mb-0">${totalRecovered}<span
							class="float-right"></span>
					</h5>
					<div class="progress my-3" style="height: 3px;">
						<div class="progress-bar" style="width: 55%"></div>
					</div>
					<p class="mb-0 text-white small-font">Tổng Ca Hồi Phục</p>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>


