<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<c:url var="APIurl" value="/api-web-user" />
	<c:url var="LoginURL" value="/dang-nhap" />
	<c:url var="RegisterURL" value="/dang-ky" />
	<c:url var="HomeURL" value="/trang-chu" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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
					<h2>Register</h2>
					<p>Fill in the form below</p>
				</div>
				<form id="form-register">

					<div class="form-group">

						<input type="text" class="form-control" id="username"
							name="username" placeholder="Username" value="${userModel.username}" />

					</div>

					<div class="form-group">

						<input type="password" class="form-control" id="password"
							name="password" placeholder="Password" value="${userModel.password}" />

					</div>

					<div class="form-group">

						<input type="text" class="form-control" id="fullname"
							name="fullname" placeholder="Fullname" value="${userModel.fullname}" />

					</div>

					<input type="button" value="Register" class="btn btn-primary" id="registerButton" />

				</form>
			</div>
			<p class="botto-text">2021</p>
		</div>
	</div>

	<script>

		$('#registerButton').click(function (e) {
			e.preventDefault;
			var data = {};
			var formData = $('#form-register').serializeArray();
			$.each(formData, function (i, v) {
				data["" + v.name + ""] = v.value;
			});
			addUser(data);
		});

		function addUser(data) {
			$.ajax({
				url: '${APIurl}',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					window.location.href= "${LoginURL}?action=login&message=register_success&alert=success";
				},
				error: function (error) {
					window.location.href= "${RegisterURL}?action=registor&message=register_failed&alert=danger";
				}
			});
		}
	</script>
</body>
</html>