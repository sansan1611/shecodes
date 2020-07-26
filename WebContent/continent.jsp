<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Include the JSTL Core library in JSP --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript">
	var jsonData = [];
	$(document).ready(function() {
		$.ajax({
			url : "https://corona.lmao.ninja/v2/continents",
			dataType : "json",
			async : false,
			success : function(result) {
				jsonData = result;
			}
		});
	});

	// Load the Visualization API and the corechart package.
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Châu lục');
		data.addColumn('number', 'Ca nhiễm');
		data.addColumn('number', 'Hồi phục');
		data.addColumn('number', 'Tử vong');
		for (var i = 0; i < jsonData.length; i++) {
			var name = jsonData[i].continent;
			var cases = jsonData[i].cases;
			var recovered = jsonData[i].recovered;
			var deaths = jsonData[i].deaths;
			data.addRows([ [ name, cases, recovered, deaths ] ]);
		}
		;

		var options = {
			'width' : 1150,
			'height' : 350,
			'backgroundColor' : '#eef4fb'
		};

		var chart = new google.charts.Bar(document
				.getElementById('continent_chart'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>

<div class="row" style="display: flex; justify-content: center;">
	<div class="col-12 col-lg-12">
		<div class="card">
			<div class="card-header" style="text-align: center">BIỂU ĐỒ CỘT
				THEO DÕI SỐ LIỆU</div>

			<div id="continent_chart" style="margin: 0px 30px 30px 30px"></div>
		</div>

		<div class="card">
			<div class="card-header">
				SỐ LIỆU CHO TỪNG CHÂU LỤC<br>
			</div>
			<div class="table-responsive">
				<table class="table align-items-center table-flush table-borderless">
					<thead>
						<tr>
							<th>Tên Châu Lục</th>
							<th>Ca Nhiễm</th>
							<th>Ca Nhiễm Mới</th>
							<th>Dương Tính</th>
							<th>Hồi Phục</th>
							<th>Tử Vong</th>
							<th>Tử Vong Mới</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${listContinent}">

							<tr>
								<td><c:out value="${list.continentName}" /></td>
								<td><c:out value="${list.cases}" /></td>
								<td>+<c:out value="${list.todayCases}" /></td>
								<td><c:out value="${list.active}" /></td>
								<td><c:out value="${list.recovered}" /></td>
								<td><c:out value="${list.deaths}" /></td>
								<td>+<c:out value="${list.todayDeaths}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--End Row-->
<jsp:include page="footer.jsp"></jsp:include>

