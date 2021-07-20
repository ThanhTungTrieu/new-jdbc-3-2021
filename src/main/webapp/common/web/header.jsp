<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="HomeURL" value="/trang-chu" />
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${HomeURL}?page=1&maxPageItem=6">Home page</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<%-- <li class="nav-item active"><a class="nav-link" href="${HomeURL}">Trang chủ
						<span class="sr-only">(current)</span>
				</a></li> --%>
				<c:if test="${not empty USERMODEL}">
					<li class="nav-item"><a class="nav-link" href="#">Welcome, ${USERMODEL.fullname}</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/thoat?action=logout' /> ">Logout</a></li>
				</c:if>
				<c:if test="${empty USERMODEL}">
					<li class="nav-item"><a class="nav-link" href="<c:url value='/dang-nhap?action=login' /> ">Login</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
