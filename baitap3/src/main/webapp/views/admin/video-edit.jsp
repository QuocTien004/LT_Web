<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<div class="container mt-5">
    <form action="<c:url value='/admin/video/update'/>" method="post" enctype="multipart/form-data">
        <input type="text" id="videoId" name="videoId" value="${vid.videoId}" hidden>

        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" class="form-control" id="title" name="title" value="${vid.title}" required>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="3" required>${vid.description}</textarea>
        </div>

        <div class="form-group">
            <label for="poster">Poster Image:</label>
            <input type="file" class="form-control-file" id="poster" name="poster">
        </div>

        <div class="form-group">
            <label for="category">Category:</label>
            <select class="form-control" id="category" name="categoryId" required>
                <c:forEach items="${listcate}" var="cate">
                    <option value="${cate.categoryId}">${cate.categoryname}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Current Video:</label><br>
            <video height="150" width="200" controls>
                <c:choose>
                    <c:when test="${vid.poster.startsWith('https')}">
                        <source src="${vid.poster}" type="video/mp4">
                    </c:when>
                    <c:otherwise>
                        <source src="${pageContext.request.contextPath}/video?fname=${vid.poster}" type="video/mp4">
                    </c:otherwise>
                </c:choose>
                Your browser does not support the video tag.
            </video>
        </div>

        <div class="form-group">
            <label for="views">Views:</label>
            <input type="number" class="form-control" id="views" name="views" value="${vid.views}" min="0">
        </div>

        <div class="form-group">
            <label>Status:</label><br>
            <div class="form-check form-check-inline">
                <input type="radio" class="form-check-input" id="active" name="status" value="1" <c:if test="${vid.active}">checked</c:if>>
                <label class="form-check-label" for="active">Active</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="radio" class="form-check-input" id="inactive" name="status" value="0" <c:if test="${!vid.active}">checked</c:if>>
                <label class="form-check-label" for="inactive">Inactive</label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

<!-- Add Bootstrap JS (Optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
