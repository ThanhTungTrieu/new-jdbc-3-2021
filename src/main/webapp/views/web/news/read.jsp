<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết</title>
</head>
<body>
	<div class="row">

      <div class="col-lg-3">
        <h1 class="my-4">Thể loại</h1>
        <div class="list-group">
        	<c:forEach var="item" items="${categories}" >	
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

        <div class="card mt-4">
          <img class="card-img-top img-fluid" src="${model.thumbnail}" alt="thumbnail">
          <div class="card-body">
            <h3 class="card-title">${model.title}</h3>
            <p class="card-text">${model.content}</p>
        </div>
        <!-- /.card -->
      </div>
      <!-- /.col-lg-9 -->

    </div>
    </div>
</body>
</html>