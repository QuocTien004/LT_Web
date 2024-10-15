<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<div class="container mt-5">
    <form action="${pageContext.request.contextPath}/admin/video/insert" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="videoId">Video ID:</label>
            <input type="text" class="form-control" id="videoId" name="videoId" required>
        </div>

        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
        </div>

        <div class="form-group">
            <label for="poster">Poster Image:</label>
            <input type="file" class="form-control-file" id="poster" name="poster" required>
        </div>

        <div class="form-group">
            <label for="views">Views:</label>
            <input type="number" class="form-control" id="views" name="views" value="0" min="0">
        </div>

        <div class="form-group">
            <label for="category">Category:</label>
            <select class="form-control" id="category" name="categoryId" required>
                <c:forEach items="${listcate}" var="cate">
                    <option value="${cate.categoryId}"><c:out value="${cate.categoryname}"/></option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Status:</label><br>
            <div class="form-check form-check-inline">
                <input type="radio" class="form-check-input" id="active" name="status" value="1" checked>
                <label class="form-check-label" for="active">Active</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="radio" class="form-check-input" id="inactive" name="status" value="0">
                <label class="form-check-label" for="inactive">Inactive</label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<!-- Add Bootstrap JS (Optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
