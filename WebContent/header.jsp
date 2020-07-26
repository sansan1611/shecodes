<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Include the JSTL Core library in JSP --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Covid-19 Tracking</title>
<!-- loader-->
<link href="${pageContext.request.contextPath}/assets/css/pace.min.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/assets/js/pace.min.js"></script>
<!--favicon-->
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.ico"
	type="image/x-icon" />
<!-- Vector CSS -->
<link
	href="${pageContext.request.contextPath}/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css"
	rel="stylesheet" />
<!-- simplebar CSS-->
<link
	href="${pageContext.request.contextPath}/assets/plugins/simplebar/css/simplebar.css"
	rel="stylesheet" />
<!-- Bootstrap core CSS-->
<link
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- animate CSS-->
<link href="${pageContext.request.contextPath}/assets/css/animate.css"
	rel="stylesheet" type="text/css" />

<!-- Icons CSS-->
<link href="${pageContext.request.contextPath}/assets/css/icons.css"
	rel="stylesheet" type="text/css" />
<!-- Sidebar CSS-->
<link
	href="${pageContext.request.contextPath}/assets/css/sidebar-menu.css"
	rel="stylesheet" />
<!-- Custom Style-->
<link href="${pageContext.request.contextPath}/assets/css/app-style.css"
	rel="stylesheet" />
<style type="text/css">
body {
	background-color: #069e90;
}
</style>

<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	var jsonData = [];
	$(document).ready(function() {
		$.ajax({
			url : "https://coronavirus-19-api.herokuapp.com/countries",
			dataType : "json",
			async : false,
			success : function(result) {
				jsonData = result;
			}
		});
	});

	// Load the Visualization API and the corechart package.
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Country');
		data.addColumn('number', 'Cases');

		for (var i = 1; i < jsonData.length && jsonData[i].cases>300000; i++) {

			var name = jsonData[i].country;
			var cases = jsonData[i].cases;
			data.addRows([ [ name, cases ] ]);

		}

		// Set chart options
		var options = {
			'width' : 450,
			'height' : 450,
			'backgroundColor' : '#069e90'
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>

<script type='text/javascript'>
	var jsonData2 = [];
	$(document).ready(function() {
		$.ajax({
			url : "https://corona.lmao.ninja/v2/countries",
			dataType : "json",
			async : false,
			success : function(result) {
				jsonData2 = result;
				jsonData2[203].country = "United Kingdom";
				jsonData2[204].country = "United States";
			}
		});
	});
	google.load('visualization', '1', {
		'packages' : [ 'geochart' ]
	});
	google.setOnLoadCallback(drawStatesMap);

	function drawStatesMap() {
		var data2 = new google.visualization.DataTable();
		data2.addColumn('string', 'Country');
		data2.addColumn('number', 'Cases');

		for (var i = 0; i < jsonData2.length; i++) {
			var name = jsonData2[i].country;
			var cases = jsonData2[i].cases;
			data2.addRows([ [ name, cases ] ]);
		}
		var options = {
			'width' : 700,
			'height' : 450,
			'backgroundColor' : '#069e90'
		};
		var chart = new google.visualization.GeoChart(document
				.getElementById('chart'));
		chart.draw(data2, options);
	}
</script>
</head>

<body class="bg-theme bg-theme1">

	<!-- Start wrapper-->
	<div id="wrapper">

		<!--Start sidebar-wrapper-->
		<div id="sidebar-wrapper" data-simplebar=""
			data-simplebar-auto-hide="true">
			<div class="brand-logo">
				<a href="<c:url value='/'/>"> <img
					src="<c:url value='https://image.shutterstock.com/image-vector/stop-coronavirus-2019ncov-hand-drawn-600w-1628405167.jpg'/>"
					class="logo-icon" alt="logo icon">
					<h5 class="logo-text">COVID-19 TRACKING</h5>
				</a>
			</div>
			<ul class="sidebar-menu do-nicescrol">
				<li class="sidebar-header">SỐ LIỆU</li>

				<li><a href="<c:url value='/'/>" class="pro-btn"> <img
						src="<c:url value='https://www.mapsofworld.com/images-mow/world-map.jpg'/>"
						class="logo-icon" alt="logo icon"> <span>Trang chủ</span>
				</a></li>

				<li><a href="<c:url value='/continent'/>" class="pro-btn">
						<img
						src="<c:url value='https://w0.pngwave.com/png/1020/834/world-map-continent-world-ocean-seven-continents-map-png-clip-art.png'/>"
						class="logo-icon" alt="logo icon"> <span>Châu lục</span>
				</a></li>

				<li><a href="<c:url value='/vietnam'/>" class="pro-btn"> <img
						src="<c:url value='https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/2000px-Flag_of_Vietnam.svg.png'/>"
						class="logo-icon" alt="logo icon"> <span>Việt Nam</span>
				</a></li>

				<li><a href="<c:url value='/news'/>" class="pro-btn"> <img
						src="<c:url value='https://vnn-imgs-f.vgcloud.vn/2020/03/10/12/vi-sao-phai-khai-bao-y-te-toan-dan-bang-ung-dung-ncovi.jpg'/>"
						class="logo-icon" alt="logo icon"> <span>Tin tức</span>
				</a></li>

				<li class="sidebar-header">CÁC CÁCH BẢO VỆ BẢN THÂN</li>
				<ol style="pading-left: 2.5px;">
					<li>Rửa tay thường xuyên</span></li>
					<hr>
					<li>Tránh tiếp xúc gần</span></li>
					<hr>
					<li>Che miệng và mũi bằng khẩu trang vải khi ở xung quanh
						người khác</span>
					</li>
					<hr>
					<li>Che miệng khi ho và hắt hơi</span></li>
					<hr>
					<li>Vệ sinh và khử trùng</span>
					</li>
					<hr>
					<li>Theo dõi sức khỏe của quý vị mỗi ngày</span>
					</li>
				</ol>

				<hr>
			</ul>

		</div>
		<!--End sidebar-wrapper-->

		<!--Start topbar header-->
		<header class="topbar-nav">
			<nav class="navbar navbar-expand fixed-top">
				<ul class="navbar-nav mr-auto align-items-center">
					<li class="nav-item"><a class="nav-link toggle-menu"
						href="javascript:void();"> </a></li>
				</ul>

				<ul class="navbar-nav align-items-center center-nav-link">

					<li class="nav-item language" style="font-weight: 900;"><a
						class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect"
						href="https://www.google.com/search?sxsrf=ALeKk01f_X99GCmnU5hR6gC-9QSXxhL2gA%3A1595669906509&ei=kv0bX5bFHoyxmAWGkpToBw&q=%23covid-19&oq=%23covid-19&gs_lcp=CgZwc3ktYWIQAzIFCAAQywEyBQgAEMsBMgUIABDLATIFCAAQywEyBQgAEMsBMgUIABDLATIFCAAQywEyBAgAEB46BggjECcQE1DVRViySWCFTGgAcAB4AIABY4gB6QKSAQE0mAEAoAEBqgEHZ3dzLXdpesABAQ&sclient=psy-ab&ved=0ahUKEwiW1tLPjejqAhWMGKYKHQYJBX0Q4dUDCAw&uact=5"
						target="_blank">#covid-19</a></li>
					<li class="nav-item language"><a
						class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect"
						href="javascript:void();"><i class="fa fa-phone"
							aria-hidden="true"></i>1900-3228</a></li>

					<li class="nav-item language"><a
						class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect"
						href="https://tokhaiyte.vn/" target="_blank">Khai báo y tế</a></li>

					<li class="nav-item language"><a
						class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect"
						data-toggle="dropdown" href="javascript:void();">Tổ chức y tế
							<i class="fa fa-sort-desc" aria-hidden="true"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-right"
							style="background-color: #069e90;">
							<li class="dropdown-item"><a href="https://www.who.int/"
								target="_blank">WHO</a></li>
							<li class="dropdown-item"><a href="https://moh.gov.vn/"
								target="_blank">MOH</a></li>
						</ul></li>
				</ul>
			</nav>
		</header>
		<!--End topbar header-->


		<div class="content-wrapper">
			<div id="content" class="container-fluid">