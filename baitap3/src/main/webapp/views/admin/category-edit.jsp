<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="jakarta.tags.core" %>

<!-- Add Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

<div class="container mt-5">
    <form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data">
        <!-- Hidden input for category ID -->
        <input type="hidden" id="categoryid" name="categoryid" value="${cate.categoryId}">

        <!-- Category Name -->
        <div class="mb-3">
            <label for="categoryname" class="form-label">Category name:</label>
            <input type="text" class="form-control" id="categoryname" name="categoryname" value="${cate.categoryname}" required>
        </div>

        <!-- Images Upload -->
        <div class="mb-3">
            <label for="images" class="form-label">Images:</label>
            <input type="file" class="form-control" id="images" name="images" value="${cate.images}">
        </div>

        <!-- Display existing image -->
        <c:if test="${cate.images.substring(0,5) == 'https'}">
            <c:url value="${cate.images}" var="imgUrl"></c:url>
        </c:if>
        <c:if test="${cate.images.substring(0,5) != 'https'}">
            <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
        </c:if>
        <div class="mb-3">
            <img height="150" width="200" src="${imgUrl}" class="img-thumbnail" />
        </div>

        <!-- Status Radio Buttons -->
        <div class="mb-3">
            <label class="form-label">Status:</label><br>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="ston" name="status" value="1" <c:if test="${cate.status == 1}">checked</c:if>>
                <label class="form-check-label" for="ston">Đang hoạt động</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="stoff" name="status" value="0" <c:if test="${cate.status == 0}">checked</c:if>>
                <label class="form-check-label" for="stoff">Khóa</label>
            </div>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

<!-- Add Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
