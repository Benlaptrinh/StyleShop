<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!DOCTYPE html>
        <html lang="en" xmlns:th="http://www.thymeleaf.org">

        <head>
            <title></title>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        </head>

        <body>
            <jsp:include page="./common/head.jsp"></jsp:include>
            <table class="table table-hover table-striped table-bordered">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Tên Người Mua</th>
                        <th scope="col">Mail Người Mua</th>
                        <th scope="col">SDT Người Mua</th>
                        <th scope="col">Địa Chỉ Người Mua</th>
                        <th scope="col">Tên Sản Phẩm</th>
                        <th scope="col">Giá Sản Phẩm</th>
                        <th scope="col">Ngày Mua</th>
                        <th scope="col">Loại Sản Phẩm</th>
                        <th scope="col" class="text-danger">Tổng Tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${ords}" varStatus="loop">
                        <tr>
                            <th>${item.id}</th>
                            <th>${item.orderid.username.id}</th>
                            <th>${item.orderid.username.email}</th>
                            <th>${item.orderid.username.phone}</th>
                            <th>${item.orderid.username.address}</th>
                            <th>${item.productid.name}</th>
                            <th>${item.productid.price}</th>
                            <th>${item.productid.createdate}</th>
                            <th>${item.productid.categoryid.name}</th>
                            <th>${item.price}</th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <jsp:include page="./common/foot.jsp"></jsp:include>

        </body>

        </html> -->