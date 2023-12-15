<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <title>Admin - Product</title>
                    <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                        crossorigin="anonymous">
                    <script src="https://kit.fontawesome.com/e136359f35.js" crossorigin="anonymous" defer></script>
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" defer></script>
                    <!-- <script src="../app/js/script.js" defer></script> -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                        rel="stylesheet" />
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
                    <script src="https://kit.fontawesome.com/e136359f35.js" crossorigin="anonymous" defer></script>
                    <style>
                        .text-center {
                            text-align: center;
                        }

                        .mt-5 {
                            margin-top: 50px;
                        }

                        .h1-custom {
                            font-size: 2.5rem;
                            color: #ffffff;
                            /* Màu xanh dương */
                            font-family: 'Arial', sans-serif;
                            position: relative;
                        }

                        .h1-custom::after {
                            content: '';
                            position: absolute;
                            width: 10%;
                            height: 4px;
                            /* Độ dày của gạch chân */
                            background-color: #ffffff;
                            /* Màu xanh dương hoặc màu bạn chọn */
                            bottom: -8px;
                            /* Khoảng cách giữa tiêu đề và gạch chân */
                            left: 45%;
                        }
                    </style>
                </head>

                <body style="background-color: #5bb9b8;">
                    <!-- header -->
                    <jsp:include page="./common/head.jsp"></jsp:include>
                    <div class="container">

                        <h1 class="text-center mt-5 h1-custom">Chi Tiết Hoá Đơn</h1>
                        <div class="container w-100 mt-5" style="height: 300px;">

                            <table class="table table-hover table-striped table-bordered  table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Tên Người Mua</th>
                                        <th scope="col">Mail Người Mua</th>
                                        <th scope="col">SDT Người Mua</th>
                                        <th scope="col">Địa Chỉ Người Mua</th>
                                        <th scope="col">Số Lượng</th>
                                        <th scope="col">Tên Sản Phẩm</th>
                                        <th scope="col">Giá Sản Phẩm</th>
                                        <th scope="col">Ngày Mua</th>
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
                                            <th>${item.orderid.address}</th>
                                            <th>${item.soluonghienthi}</th>
                                            <th>${item.productid.name}</th>
                                            <th>${item.productid.price}</th>
                                            <th>${item.orderid.createdate}</th>
                                            <th>${item.price}</th>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>

                    <jsp:include page="./common/foot.jsp"></jsp:include>
                </body>

                </html>