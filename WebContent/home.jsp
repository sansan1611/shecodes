<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Include the JSTL Core library in JSP --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"></jsp:include>
<div class="row" style="display: flex; justify-content: center;">
	<div class="card">
		<div class="col-12 col-lg-8 col-xl-8">
			<div class="card-header" style="text-align: center">BẢN ĐÔ
				THỐNG KÊ SỐ LIỆU THẾ GIỚI</div>
			<div id="chart"></div>

		</div>
	</div>

	<div class="card">
		<div class="card-header" style="text-align: center">TỈ LỆ NHỮNG
			NƯỚC ĐÁNG CHÚ Ý</div>
		<div class="col-12 col-lg-4 col-xl-4">
			<div id="chart_div"></div>
		</div>
	</div>
</div>
<!--End Row-->


<div class="row">
	<div class="col-12 col-lg-12">
		<div class="card">
			<div class="card-header">
				<br>
			</div>
			<div class="table-responsive">
				<table class="table align-items-center table-flush table-borderless">
					<thead>
						<tr>
							<th>Quốc Gia</th>
							<th>Ca Nhiễm</th>
							<th>Ca Nhiễm Mới</th>
							<th>Dương Tính</th>
							<th>Hồi Phục</th>
							<th>Tử Vong</th>
							<th>Tử Vong Mới</th>
						</tr>
					</thead>
					<c:set var="totalCases" value="${0}" />
					<c:set var="totalActive" value="${0}" />
					<c:set var="totalDeaths" value="${0}" />
					<c:set var="totalRecovered" value="${0}" />
					<tbody>
						<c:forEach var="list" items="${listCountry}">

							<tr>
								<td><c:out value="${list.countryName}" /></td>
								<td><c:out value="${list.cases}" /></td>
								<td>+<c:out value="${list.todayCases}" /></td>
								<td><c:out value="${list.active}" /></td>
								<td><c:out value="${list.recovered}" /></td>
								<td><c:out value="${list.deaths}" /></td>
								<td>+<c:out value="${list.todayDeaths}" /></td>

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
					<p class="mb-0 text-white small-font">Tông Ca Nhiễm</p>
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

