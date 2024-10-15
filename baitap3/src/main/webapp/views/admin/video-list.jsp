<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<div class="container mt-5">
    <div class="mb-3">
        <a href="${pageContext.request.contextPath}/admin/video/add" class="btn btn-primary">Add Video</a>
    </div>

    <form action="${pageContext.request.contextPath}/admin/video/search" method="get" class="form-inline mb-4">
        <input type="text" class="form-control mr-2" name="name" placeholder="Search">
        <button type="submit" class="btn btn-success">Tìm kiếm</button>
    </form>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>STT</th>
                <th>Poster</th>
                <th>Title</th>
                <th>Views</th>
                <th>Status</th>
                <th>Category ID</th>
                <th>Video ID</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listVideos}" var="video" varStatus="STT">
                <tr>
                    <td>${STT.index + 1}</td>
                    <td>
                        <video height="150" width="200" controls>
                            <c:if test="${video.poster.substring(0, 5) == 'https'}">
                                <source src="${video.poster}" type="video/mp4">
                            </c:if>
                            <c:if test="${video.poster.substring(0, 5) != 'https'}">
                                <source src="${pageContext.request.contextPath}/video?fname=${video.poster}" type="video/mp4">
                            </c:if>
                            Your browser does not support the video tag.
                        </video>
                    </td>
                    <td>${video.title}</td>
                    <td>${video.views}</td>
                    <td>${video.active ? 'Active' : 'Inactive'}</td>
                    <td>${video.category.categoryId}</td>
                    <td>${video.videoId}</td>
                    <td>
                        <a href="<c:url value='/admin/video/edit?id=${video.videoId}'/>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="<c:url value='/admin/video/delete?id=${video.videoId}'/>" class="btn btn-danger btn-sm ml-2">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Add Bootstrap JS (Optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
