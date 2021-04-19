<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/common/taglib.jsp" %>
		<!DOCTYPE html>
		<html>

		<head>
			<title>Trang chủ</title>
		</head>

		<body>
			<div class="row">

				<div class="col-lg-3">

					<h1 class="my-4">Thể loại</h1>
					<div class="list-group">
						<c:forEach var="item" items="${categories}">
							<a href="#" class="list-group-item">${item.name}</a>
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
								<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
							data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
						</a>
					</div>
					<form action="<c:url value='/trang-chu' />" id="form-submit" method="GET">
						<div class="row">
							<c:forEach var="item" items="${model.listResult}">
								<div class="col-lg-4 col-md-6 mb-4">
									<div class="card h-100">
										<a href="#"><img class="card-img-top" src="http://placehold.it/700x400"
												alt=""></a>
										<div class="card-body">
											<h4 class="card-title">
												<a href="#">${item.title}</a>
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