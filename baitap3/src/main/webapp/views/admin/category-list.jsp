<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- Add Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

<div class="container mt-4">
    <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-primary mb-3">Add Category</a>
    
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Images</th>
                <th scope="col">Category Name</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listcategory}" var="cate" varStatus="STT">
                <tr>
                    <td>${STT.index+1}</td>

                    <!-- Check if the image URL is HTTPS or not -->
                    <c:if test="${cate.images.substring(0,5)== 'https'}">
                        <c:url value="${cate.images}" var="imgUrl"></c:url>
                    </c:if>
                    <c:if test="${cate.images.substring(0,5) != 'https'}">
                        <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                    </c:if>

                    <td>
                        <img height="150" width="200" class="img-thumbnail" src="${imgUrl}" />
                    </td>
                    <td>${cate.categoryname}</td>
                    <td>
                        <c:if test="${cate.status == 1}">
                            <span class="badge bg-success">Hoạt động</span>
                        </c:if>
                        <c:if test="${cate.status != 1}">
                            <span class="badge bg-danger">Khóa</span>
                        </c:if>
                    </td>
                    <td>
                        <a href="<c:url value='/admin/category/edit?id=${cate.categoryId}'/>" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="<c:url value='/admin/category/delete?id=${cate.categoryId}'/>" class="btn btn-danger btn-sm">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Add Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
