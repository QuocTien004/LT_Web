<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="APIAdminProduct" value="/api-admin-product"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product</title>
</head>
<body>
<div class="main-content">
    <div class="page-content home-page">
        <c:if test="${not empty messageResponse}">
            <div class="alert alert-${alert}">
                    ${messageResponse}
            </div>
        </c:if>
        <div class="ace-settings-container" id="ace-settings-container">
            <!-- -----------------------------------------------------Nút thêm sản phẩm -->
            <a href='<c:url value="/admin-product?type=edit"/>'>
                <div style="margin-right: 1rem; border-radius: 5px;"
                     class="btn btn-app btn-xs btn-warning ace-settings-btn"
                     id="add-product">
                    <i class="ace-icon fas fa-plus bigger-130"></i>
                </div>
            </a>
        </div>

        <div style="font-family: Arial, Helvetica, sans-serif; font-size: 2rem"
                class="page-header">PRODUCT
        </div>
        <div class="container__right-product ">
            <div class="container__right-content">
                <table style="font-family: Arial, Helvetica, sans-serif;"
                       class="table">
                    <thead>
                    <th style="width: 5%">ID</th>
                    <th style="width: 5%">Image</th>
                    <th style="width: 15%">Product Name</th>
                    <th style="width: 10%">Price</th>
                    <th style="width: 10%">Category</th>
                    <th style="width: 20%">Information</th>
                    <th style="width: 10%">Action</th>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${model}">
                        <tr>
                            <td>${item.productId}</td>
                            <td><img src='${pageContext.request.contextPath}/show-image?fileName=${item.imageSmall}' width="90" height="70"></td>
                            <td>${item.productName}</td>
                            <td><fmt:formatNumber type="number" pattern="###,###" value="${item.price}" />đ</td>
                            <td>${item.category.categoryName}</td>
                            <td>
                                <ul>
                                    <li>Screen: ${item.infoId.screen}</li>
                                    <li>Camera Selfie: ${item.infoId.cameraSelfie}</li>
                                    <li>Camera: ${item.infoId.camera}</li>
                                    <li>Ram: ${item.infoId.ram}</li>
                                    <li>Cpu: ${item.infoId.cpu}</li>
                                    <li>Os: ${item.infoId.os}</li>
                                </ul>
                            </td>
                            <td>
                                <a href='<c:url value="/admin-product?type=edit&productId=${item.productId}"/>'><i
                                        id="edit-product" style="color: #438eb9;" class=" icon fas fa-edit"></i></a>
                                <a id="btnDeleteProduct" data-id="${item.productId}" type="button"
                                   style="pointer-events: all;"> <i style="color: red;"
                                                                    class=" icon fas fa-trash-alt"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    const btnDeleteProduct = document.querySelectorAll(`#btnDeleteProduct`);
    btnDeleteProduct.forEach((item) => item.addEventListener("click", function (e) {
        e.preventDefault();
        const productId = item.dataset.id;
        var data = {};
        data['productId'] = productId;
        deleteProduct(data);
    }))

    function deleteProduct(data) {
        $.ajax({
            url: '${APIAdminProduct}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "/admin-product?type=list&message=delete_success";
            },
            error: function (error) {
                window.location.href = "/admin-product?type=list&message=error_system";
            }
        });
    }
</script>
</body>
</html>