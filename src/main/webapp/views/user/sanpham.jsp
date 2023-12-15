<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>Bootstrap 5 Example</title>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" href="../app/reset.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
                <style>
                    .featured .item .info .icon:first-child {
                        margin-left: 0;
                    }

                    .feature__img:last-child {
                        bottom: -121px;
                        right: -58px;
                        width: 332px;
                        height: 370px;
                    }

                    a {
                        text-decoration: none;
                    }

                    .ke::after {
                        position: absolute;
                        bottom: -10px;
                        left: 50%;
                        transform: translateX(-50%);
                        content: "";
                        display: inline-block;
                        width: 150px;
                        height: 4px;
                        background: #defcfc;
                        border-radius: 12px;
                    }

                    .strike-through {
                        text-decoration: line-through;
                    }


                    .mainDiv {
                        display: flex;
                        min-height: 100%;
                        align-items: center;
                        justify-content: center;
                        background-color: #f9f9f9;
                        font-family: 'Open Sans', sans-serif;
                    }

                    .cardStyle {
                        width: 500px;
                        border-color: white;
                        background: #fff;
                        padding: 36px 0;
                        border-radius: 4px;
                        margin: 30px 0;
                        box-shadow: 0px 0 2px 0 rgba(0, 0, 0, 0.25);
                    }

                    #signupLogo {
                        max-height: 100px;
                        margin: auto;
                        display: flex;
                        flex-direction: column;
                    }

                    .formTitle {
                        font-weight: 600;
                        margin-top: 20px;
                        color: #2F2D3B;
                        text-align: center;
                    }

                    .inputLabel {
                        font-size: 12px;
                        color: #555;
                        margin-bottom: 6px;
                        margin-top: 24px;
                    }

                    .inputDiv {
                        width: 70%;
                        display: flex;
                        flex-direction: column;
                        margin: auto;
                    }

                    input {
                        height: 40px;
                        font-size: 16px;
                        border-radius: 4px;
                        border: none;
                        border: solid 1px #ccc;
                        padding: 0 11px;
                    }

                    input:disabled {
                        cursor: not-allowed;
                        border: solid 1px #eee;
                    }

                    .buttonWrapper {
                        margin-top: 40px;
                    }

                    .submitButton {
                        width: 70%;
                        height: 40px;
                        margin: auto;
                        display: block;
                        color: #fff;
                        background-color: #065492;
                        border-color: #065492;
                        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
                        box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
                        border-radius: 4px;
                        font-size: 14px;
                        cursor: pointer;
                    }

                    .submitButton:disabled,
                    button[disabled] {
                        border: 1px solid #cccccc;
                        background-color: #cccccc;
                        color: #666666;
                    }

                    #loader {
                        position: absolute;
                        z-index: 1;
                        margin: -2px 0 0 10px;
                        border: 4px solid #f3f3f3;
                        border-radius: 50%;
                        border-top: 4px solid #666666;
                        width: 14px;
                        height: 14px;
                        -webkit-animation: spin 2s linear infinite;
                        animation: spin 2s linear infinite;
                    }

                    @keyframes spin {
                        0% {
                            transform: rotate(0deg);
                        }

                        100% {
                            transform: rotate(360deg);
                        }
                    }
                </style>
                <link rel="stylesheet" href="../app/media.css">
            </head>

            <body>
                <%@ include file="./common/head.jsp" %>

                    <div class="div " style="margin-left: 20%;">
                        <form action="/product/search" method="post" class="">
                            <div class="input-group">
                                <input name="keywords" value="${keywords}" type="text"
                                    class="mt-3  py-2 px-3 rounded-pill bg-light border-1 mb-5 w-75 d-flex justify-content-center"
                                    placeholder="Search..." aria-label="Search">
                            </div>
                        </form>



                        <form action="/product/select" method="post" style="margin-right: 440px;">

                            <select class="form-control " name="category_id" onchange="this.form.submit()"
                                onblur="this.form.submit()">
                                <option value="">Chọn 1 category</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}">${category.id} </option>
                                </c:forEach>
                            </select>
                        </form>


                    </div>
                    <div class="text-end " style="position: relative;margin-right: 120px; ">
                        <a href="/index/giohang" style="position: fixed;color: black;">
                            <h1><i class=" bi bi-bag"></i></h1>
                            <div class="d-flex justify-content-center align-content-center">
                                <h5 class="text-center"
                                    style="position: absolute;top: 18px;right: 15px;font-size: 20px;color: red;">
                                    ${cartQuantity}
                                </h5>

                            </div>
                        </a>


                    </div>

                    <div class="text-end" style="position: relative;margin-right: 120px; ">
                        <a href="/admin/product" style="position: fixed; margin-top: 100px;">
                            <h1><i class="bi bi-plus-circle text-dark"></i></h1>
                            <div class="d-flex justify-content-center align-content-center">


                            </div>
                        </a>


                    </div>




                    <!-- <div>
                        <div class="d-flex justify-content-center">
                            <div class="card" style="width: 550px;">
                                <div class="card-header">
                                    <label for="">Tìm Kiếm Theo Loại</label>
                                </div>
                                <div class="card-body">
                                    <form class="d-flex align-items-center justify-content-between gap-3">
                                        <div class="form-inline border rounded p-sm-2 my-2" style="width: 500px;">

                                            <select id="" class="form-control" ng-model="sortType">
                                                <option value="boring">Giày</option>
                                                <option value="-price">Áo</option>
                                                <option value="+price">Quần</option>
                                                <option value="+price">Cặp</option>
                                            </select>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div> -->

                    <c:if test="${not empty products}">
                        <div class="container mt-5">
                            <div class="row respon">
                                <c:forEach var="item" items="${products}" varStatus="loop">
                                    <div class="mt-5 col-sm-6 col-lg-3 col-md-4 cachgiay">

                                        <div class=" shadow">
                                            <a href="/product/detail/${item.id}">
                                                <img src="../../upload/product/${item.image}" alt="" class="img-fluid"
                                                    style="height: 100%; width: 100%; object-fit: cover" />
                                                <div style="" class="  py-2">
                                                    <div class="left text-danger fs-4 text-center ">
                                                        <i class="bi bi-fire"></i> Đang Sale
                                                    </div>
                                                    <h6 class="text-center text-black">${item.name}</h6>
                                                    <div class="right fs-5">
                                                        <center><span class="strike-through">550đ </span><span
                                                                class="text-danger">${item.price}</span>
                                                        </center>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center gap-3 justify-content-center">
                                                    <button class="btn btn btn-outline-danger px-4 mb-3">
                                                        Mua <i class="bi bi-bag-check-fill"></i>
                                                    </button>
                                                    <button class="btn btn-outline-primary px-4 mb-3">
                                                        Thêm <i class="bi bi-cart4"></i>
                                                    </button>
                                                </div>
                                            </a>

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>

                    <div class="mb-5">

                        <div class="container mt-5">
                            <div class="row respon">
                                <c:forEach var="item" items="${page.content}" varStatus="loop">
                                    <div class="mt-5 col-sm-6 col-lg-3 col-md-4 cachgiay">

                                        <div class=" shadow">
                                            <a href="/product/detail/${item.id}">
                                                <img src="../../upload/product/${item.image}" alt="" class="img-fluid"
                                                    style="height: 100%; width: 100%; object-fit: cover" />
                                                <div style="" class="  py-2">
                                                    <div class="left text-danger fs-4 text-center ">
                                                        <i class="bi bi-fire"></i> Đang Sale
                                                    </div>
                                                    <h6 class="text-center text-black">${item.name}</h6>
                                                    <div class="right fs-5">
                                                        <center><span class="strike-through">550đ </span><span
                                                                class="text-danger">${item.price}</span>
                                                        </center>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center gap-3 justify-content-center">
                                                    <button class="btn btn btn-outline-danger px-4 mb-3">
                                                        Mua <i class="bi bi-bag-check-fill"></i>
                                                    </button>
                                                    <button class="btn btn-outline-primary px-4 mb-3">
                                                        Thêm <i class="bi bi-cart4"></i>
                                                    </button>
                                                </div>
                                            </a>

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="mt-5 d-flex justify-content-center">

                            <nav aria-label="Page navigation example">
                                <p class="text-center">Page ${page.number + 1} of ${page.totalPages}</p>

                                <ul class="pagination d-flex gap-2">
                                    <li class="page-item">
                                        <a class="page-link btn btn-outline-primary"
                                            href="/index/sanpham?page=0">Home</a>

                                    </li>
                                    <li class="page-item">
                                        <a class="page-link btn btn-outline-primary"
                                            href="/index/sanpham?page=${page.number - 1}">Back</a>
                                    </li>

                                    <li class="page-item">
                                        <a class="page-link btn btn-outline-primary"
                                            href="/index/sanpham?page=${page.number + 1}">Next</a>
                                    </li>

                                    <li class="page-item">
                                        <a class="page-link btn btn-outline-primary"
                                            href="/index/sanpham?page=${page.totalPages - 1}">End</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                    <div class="modal fade" id="ChangePasswordModal" tabindex="-1" aria-labelledby="ChangeModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="text-center" style="margin-left:87px;">Change Password</h1>
                                </div>
                                <div class="mainDiv">
                                    <div class="cardStyle">
                                        <form action="/account/changePassword" method="post" name="signupForm"
                                            id="signupForm">

                                            <div class="inputDiv">
                                                <label class="inputLabel" for="passwordne">Old Password</label>
                                                <input type="password" id="password" name="oldPassword">
                                            </div>

                                            <div class="inputDiv">
                                                <label class="inputLabel" for="password">New Password</label>
                                                <input type="password" id="password" name="newPassword">
                                            </div>

                                            <div class="inputDiv">
                                                <label class="inputLabel" for="confirmPassword">Confirm
                                                    Password</label>
                                                <input type="password" id="confirmPassword" name="retypePassword">
                                            </div>

                                            <div class="buttonWrapper">
                                                <button type="submit" id="submitButton"
                                                    class="submitButton pure-button pure-button-primary">
                                                    <span>Change password</span>
                                                </button>
                                            </div>
                                            <div class="my-3 text-danger">
                                                <label>${error}</label>
                                                <label>${message}</label>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="container"
                                        style="background-color: rgb(249, 250, 255); width: 470px; padding: 50px 30px; margin-top: 30px;">
                                        <form action="/mk/quenmk" method="post">
                                            <h1 class=" text-center">Quên Mật Khẩu</h1>

                                            <label for="" class="w-100 my-2">Email</label>
                                            <input type="email" name="forgotEmail"
                                                style="width: 100%; border-radius: 7px; padding: 8px 10px; border: 1px solid rgb(174, 174, 174);" />
                                            <button type="submit" class="btn btn-primary w-100 my-4"
                                                style="padding: 10px 0px">Lấy
                                                Lại Mật Khẩu</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%@ include file="./common/foot.jsp" %>

            </body>
            <script>
                let message = ""
                if ("${param.message}" != "") {
                    message += "Message: ${param.message}\n"
                }
                if ("${param.error}" != "") {
                    message += "Error: ${param.error}\n"
                }
                if ("${message}" != "") {
                    message += "Message: ${message}\n"
                }
                if (message !== "") {
                    alert(message);
                }
            </script>

            </html>