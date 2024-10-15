<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Add Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

<div class="container mt-5">
    <form action="${pageContext.request.contextPath}/admin/category/insert" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="categoryname" class="form-label">Category name:</label>
            <input type="text" class="form-control" id="categoryname" name="categoryname" required>
        </div>

        <div class="mb-3">
            <label for="images" class="form-label">Images:</label>
            <input type="file" class="form-control" id="images" name="images" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Status:</label><br>
            <input class="form-check-input" type="radio" id="ston" name="status" value="1" required>
            <label for="ston" class="form-check-label">Hoạt động</label><br>
            <input class="form-check-input" type="radio" id="stoff" name="status" value="0" required>
            <label for="stoff" class="form-check-label">Khóa</label>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<!-- Add Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
