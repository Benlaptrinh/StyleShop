<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <style>
                    body {
                        padding: 0 2em;
                        font-family: Montserrat, sans-serif;
                        -webkit-font-smoothing: antialiased;
                        text-rendering: optimizeLegibility;
                        color: #444;
                        background: #5bb9b8;
                    }

                    h1 {
                        font-weight: normal;
                        letter-spacing: -1px;
                        color: #34495E;
                    }

                    .rwd-table {
                        background: #34495E;
                        color: #fff;
                        border-radius: .4em;
                        overflow: hidden;
                    }

                    .rwd-table tr {
                        border-color: #46637f;
                    }

                    .rwd-table th,
                    .rwd-table td {
                        margin: .5em 1em;
                    }

                    @media (min-width: 480px) {

                        .rwd-table th,
                        .rwd-table td {
                            padding: 1em !important;
                        }
                    }

                    .rwd-table th,
                    .rwd-table td:before {
                        color: #dd5;
                    }
                </style>
            </head>


            <body>
                <jsp:include page="./common/head.jsp"></jsp:include>

                <div class="container mt-5">
                    <ul class="nav nav-tabs mb-2" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#edit"
                                type="button" role="tab" aria-controls="home" aria-selected="true">Edit</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#list"
                                type="button" role="tab" aria-controls="profile" aria-selected="false">List</button>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <!-- edit tab -->
                        <div class="tab-pane fade show active" id="edit" role="tabpanel" aria-labelledby="edit-tab">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-responsive" data-pattern="priority-columns">

                                        <table class="rwd-table table table-hover table-bordered" style="width: 100%;">

                                            <thead>
                                                <tr>
                                                    <th>Tên Loại Sản Phẩm</th>
                                                    <th>Tổng Tiền</th>
                                                    <th>Số Lượng</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="item" items="${reports}" varStatus="loop">
                                                    <tr>
                                                        <td data-th="Movie Title">${item.groupName}</td>
                                                        <td data-th="Genre">${item.sum}</td>
                                                        <td data-th="Year">${item.count}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>

                                        </table>
                                    </div><!--end of .table-responsive-->
                                </div>
                            </div>
                        </div>

                        <!-- list tab -->
                        <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="list-tab">

                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-responsive" data-pattern="priority-columns">
                                        <table class="rwd-table" style="width: 100%;">

                                            <thead>
                                                <tr>
                                                    <th>Ngày Tạo Sản Phẩm</th>
                                                    <th>Tổng Tiền</th>
                                                    <th>Số Lượng</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="item" items="${reports1}" varStatus="loop">
                                                    <tr>
                                                        <td data-th="Movie Title">${item.groupName}</td>
                                                        <td data-th="Genre">${item.sum}</td>
                                                        <td data-th="Year">${item.count}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>

                                        </table>
                                    </div><!--end of .table-responsive-->
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

                <jsp:include page="./common/foot.jsp"></jsp:include>

            </body>

            </html>