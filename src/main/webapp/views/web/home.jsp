<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/common/taglib.jsp" %>
		<!DOCTYPE html>
		<html>

		<head>
			<title>Homepage</title>
		</head>

		<body>
			<div class="row">

				<div class="col-lg-3">

					<h1 class="my-4">Categories</h1>
					<div class="list-group">
						<c:forEach var="item" items="${categories}">
							<c:url var="findByCategoryIdURL" value="/trang-chu">
								<c:param name="action" value="findByCategoryId"></c:param>
								<c:param name="categoryId" value="${item.id}"></c:param>
							</c:url>
							<a href="${findByCategoryIdURL}" class="list-group-item">${item.name}</a>
						</c:forEach>
					</div>

				</div>
				<!-- /.col-lg-3 -->

				<div class="col-lg-9">

					<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active">
								<img class="d-block img-fluid" src="https://lh3.googleusercontent.com/d/1gAv2E2Rt3zik_umL_pSJCvcK3-sufPod" alt="First slide">
							</div>
						</div>
					</div>
					<form action="<c:url value='/trang-chu' />" id="form-submit" method="GET">
						<div class="row">
							<c:forEach var="item" items="${model.listResult}">
								<div class="col-lg-4 col-md-6 mb-4">
									<div class="card h-100">
										<a href="#"><img class="card-img-top" src="${item.thumbnail}" height="165px"
												alt="thumbnail"></a>
										<div class="card-body">
											<c:url var="readURL" value="/trang-chu">
												<c:param name="action" value="read" />
												<c:param name="id" value="${item.id}" />
											</c:url>
											<h4 class="card-title">
												<a href="${readURL}">${item.title}</a>
											</h4>
											<p class="card-text">${item.shortDescription}</p>
										</div>
										<div class="card-footer">
											<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
												&#9734;</small>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<!-- /.row -->
						<ul class="pagination" id="pagination"></ul>
						<input type="hidden" value="" id="page" name="page" />
						<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
					</form>
					
				</div>
				<!-- /.col-lg-9 -->

			</div>
			<!-- /.row -->

			<script type="text/javascript">
				var totalPages = ${ model.totalPage };
				var currentPage = ${ model.page };
				var limit = 6;
				$(function () {
					window.pagObj = $('#pagination').twbsPagination({
						totalPages: totalPages,
						visiblePages: 6,
						startPage: currentPage,
						onPageClick: function (event, page) {
							if (currentPage != page) {
								$('#maxPageItem').val(limit);
								$('#page').val(page);
								$('#form-submit').submit();
							}
						}
					});
				});
			</script>
		</body>

		</html>