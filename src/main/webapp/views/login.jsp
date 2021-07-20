<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<c:url var="HomeURL" value="/trang-chu" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="container">
		<h1 class="form-heading">
			<a href="${HomeURL}" class="form-heading">Homepage</a>
		</h1>
		<div class="login-form">
			<div class="main-div">
				<c:if test="${not empty message}">
					<div class="alert alert-${alert}">${message}</div>
				</c:if>
				<div class="panel">
					<h2>Login</h2>
					<p>Username and password</p>
				</div>
				<form action="<c:url value='/dang-nhap'/>" id="form-login"
					method="POST">

					<div class="form-group">

						<input type="text" class="form-control" id="username"
							name="username" placeholder="Username">

					</div>

					<div class="form-group">

						<input type="password" class="form-control" id="password"
							name="password" placeholder="Password">

					</div>
					<div class="forgot">
						<a href="<c:url value='/dang-ky?action=register' />">Register</a>
					</div>
					<button type="submit" class="btn btn-primary">Login</button>
					<input type="hidden" value="login" name="action" />

				</form>
			</div>
			<p class="botto-text">Tùng Tùng Trang 2021</p>
		</div>
	</div>
</body>
</html>