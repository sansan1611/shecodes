<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="header.jsp"></jsp:include>

<div class="main-body-content w-100 ets-pt">
	<div class="container">
		<div class="well" style="background-color: #069e90;">
			<div class="row">

				<!-- Blog Entries Column -->

				<div class="col-md-12">
					<c:forEach var="list" items="${listArticle}">
						<br>
						<div class="card mb-4" style="display: flex; flex-direction: row;">
							<div style="width: 700px; height: 400px;">
								<img style="width: 700px; height: 400px;" class="card-img-top" src="<c:out value="${list.imgUrl}" />"
									alt="Card image cap">
							</div>

							<div class="card-body">
								<div class="card-title">
									<i>Đăng bởi <c:out value="${list.provider}" /></i>

								</div>
								<h1 class="card-title">
									<c:out value="${list.title.toUpperCase()}" />
								</h1>

								<a href="<c:out value="${list.link}" />" class="btn btn-primary"
									target="_blank">Đọc Thêm &rarr;</a>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- Sidebar Widgets Column -->
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>