<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="container">
		<h1 class="form-heading">Đăng nhập</h1>
		<div class="login-form">
			<div class="main-div">
				<c:if test="${not empty message}">
					<div class="alert alert-${alert}">${message}</div>
				</c:if>
				<div class="panel">
					<h2>Đăng nhập</h2>
					<p>Nhập tên đăng nhập và mật khẩu</p>
				</div>
				<form action="<c:url value='/dang-nhap'/>" id="form-login"
					method="POST">

					<div class="form-group">


						<input type="text" class="form-control" id="username"
							name="username" placeholder="Tên đăng nhập">

					</div>

					<div class="form-group">

						<input type="password" class="form-control" id="password"
							name="password" placeholder="Mật khẩu">

					</div>
					<div class="forgot">
						<a href="#">Quên mật khẩu?</a>
					</div>
					<button type="submit" class="btn btn-primary">Đăng nhập</button>
					<input type="hidden" value="login" name="action" />

				</form>
			</div>
			<p class="botto-text">2021</p>
		</div>
	</div>
</body>
</html>