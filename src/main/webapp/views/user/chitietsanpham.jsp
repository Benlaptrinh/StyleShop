<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE html>
            <html lang="en" ng-app="myapp">

            <head>
                <title>Bootstrap 5 Example</title>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" href="../app/reset.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <style>
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
                        background: #9cdfdf;
                        border-radius: 12px;
                    }

                    .strike-through {
                        text-decoration: line-through;
                    }

                    .sao i {
                        color: rgb(193, 219, 45);
                    }


                    @media screen and (max-width: 2560px) {
                        .benright {
                            width: 45%;
                        }

                        .leftsize {
                            width: 50%;
                        }

                        .rightsize {
                            width: 50%;
                        }

                        .bao2 {
                            display: flex;
                            align-items: center;
                            justify-content: space-around;
                        }

                        .anhto {
                            width: 75%;
                        }

                        .anhnho {
                            width: 25%;
                        }

                        .respon .col-sm-6 {
                            width: 300px;
                            /* margin-left: 25px; */

                        }
                    }
                </style>
                <link rel="stylesheet" href="../app/media.css">
            </head>

            <body ng-controller="myCtrl">
                <%@ include file="./common/head.jsp" %>

                    <div class="container-fluid">
                        <div class="container-fluid mb-5">
                            <div class="row d-flex">

                                <div class="left d-flex align-items-center p-5 flex-column col-xl-6 col-md-6">
                                    <img width="100px" height="100px" src="../../app/img/${product.image}" alt=""
                                        class="img-fluid border border-1 rounded-4 shadow anhto" />
                                    <div class="bott d-flex justify-content-evenly gap-3 mx-5 mt-2">
                                        <!-- <img src="img/{{chitiet.image1}}" alt=""
                                        class="img-fluid border border-1 rounded-4 shadow anhnho" />
                                    <img src="img/{{chitiet.image2}}" alt=""
                                        class="img-fluid border border-1 rounded-4 shadow  anhnho" />
                                    <img src="img/{{chitiet.image3}}" alt=""
                                        class="img-fluid border border-1 rounded-4 shadow  anhnho" /> -->

                                    </div>
                                </div>

                                <div class="benright shadow px-5 h-50 mt-5 pt-2 ">
                                    <div class="top-right">

                                        <div class="my-3 d-flex gap-2 sao">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-half"></i>
                                            <h5 class="ms-3">(4,9)</h5>
                                        </div>
                                        <h1>${product.name}</h1>
                                        <h1 class="text-danger fs-3">${product.price}</h1>
                                        <hr />

                                        <div class="row d-flex w-100 py-5">
                                            <div class="leftsize ">
                                                <h4>lựa Chọn Size</h4>
                                                <div class="d-flex gap-3 mt-4 mb-2">
                                                    <button class="btn shadow btn-lg px-4 border btn-outline-dark">
                                                        S
                                                    </button>
                                                    <button class="btn shadow btn-outline-dark btn-lg px-4 border">
                                                        M
                                                    </button>
                                                    <button class="btn shadow btn-lg px-4 border btn-outline-dark">
                                                        L
                                                    </button>

                                                </div>
                                            </div>
                                            <div class="rightsize px-5">
                                                <h4 class="mt-2 w-100">Lựa Chọn Color</h4>
                                                <div class="form-check d-flex mt-4">
                                                    <input type="radio"
                                                        class="form-check-input fs-4 mx-2 text-bg-dark shadow" name="a"
                                                        data-bs-toggle="tooltip" data-bs-placement="top"
                                                        data-bs-custom-class="custom-tooltip"
                                                        data-bs-title="đây là màu đen" />
                                                    <input type="radio"
                                                        class="form-check-input fs-4 mx-2 text-bg-info shadow" name="a"
                                                        data-bs-toggle="tooltip" data-bs-placement="top"
                                                        data-bs-custom-class="custom-tooltip"
                                                        data-bs-title="đây là màu xanh" />
                                                    <input type="radio"
                                                        class="form-check-input fs-4 mx-2 text-bg-danger shadow"
                                                        name="a" data-bs-toggle="tooltip" data-bs-placement="top"
                                                        data-bs-custom-class="custom-tooltip"
                                                        data-bs-title="đây là màu dỏ" />
                                                </div>
                                            </div>
                                        </div>

                                        <hr />
                                        <h5>nếu bạn muốn có thể mua</h5>
                                        <div class="" style="width: 100%;">
                                            <div class="bao2 pb-5 mt-5">
                                                <div class="leftmua  my-2">
                                                    <div class="d-flex flex-row">
                                                        <button class="btn btn-link px-2"
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <i
                                                                class="bi bi-dash bg-black py-2 px-3 text-white shadow rounded-2"></i>
                                                        </button>

                                                        <input id="form1" min="0" name="quantity" value="2"
                                                            type="number" class="form-control form-control-sm"
                                                            style="width: 50px" />

                                                        <button class="btn btn-link px-2"
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <i
                                                                class="bi bi-plus bg-black py-2 px-3 text-white shadow rounded-2"></i>
                                                        </button>
                                                    </div>
                                                </div>

                                                <div class="rightmua d-flex gap-3  my-2">
                                                    <div class="button w-100">
                                                        <button
                                                            class="btn py-2 btn-outline-dark shadow d-flex align-items-center gap-2">
                                                            Thêm Sản Phẩm
                                                            <i class="bi bi-cart fs-5"></i>
                                                        </button>
                                                    </div>

                                                    <a href="/cart/add/${product.id}"
                                                        class="btn py-2 btn-outline-primary shadow d-flex align-items-center gap-2">Add
                                                        <i class="bi bi-cash fs-5"></i></a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                    </div>
                    <h1 class="ke position-relative text-center text-uppercase mt-5 mb-5">
                        Mô tả
                    </h1>

                    <div class="container shadow" style="background-color: rgb(255, 255, 255)">
                        <div class="container d-flex justify-content-between px-5 py-3">
                            <div class="left w-25 gap-5 flex-columns">
                                <h2>Chi Tiết</h2>
                                <div class="d-flex justify-content-between">
                                    Thương hiệu :
                                    <span class="fw-bold text-primary text-end">Adidas</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    Giới tính :
                                    <span class="fw-bold text-primary text-end">Unisex</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    Số Lượng :
                                    <span class="fw-bold text-primary text-end">51</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    Số sản phẩm còn lại :
                                    <span class="fw-bold text-primary text-end">110</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    Gửi từ :
                                    <span class="fw-bold text-primary text-end">Bình Dương</span>
                                </div>
                            </div>

                            <div class="right w-50">
                                <h2>MÔ TẢ SẢN PHẨM</h2>
                                <p>
                                    Mô tả sản phẩm Chất liệu: Jean Cotton Thành phần: 100% Cotton <br />
                                    - Chất liệu mềm mỏng thoải mái <br />
                                    - Độ co giãn vừa phải <br />
                                    - Wash nhẹ hiệu ứng trẻ trung <br />
                                    - Thiết kế túi nhỏ đồng hồ <br />
                                </p>
                            </div>
                        </div>
                        <p class="container p-4 text-center">
                            Tự tin chinh phục cự ly với đôi giày chạy bộ adidas này. Thân giày
                            thoáng khí giúp đôi chân bạn luôn khô thoáng khi chạy đường dài. Lớp đệm
                            siêu nhẹ cho sải bước đàn hồi dễ chịu từ lúc xuất phát tới tận khi về
                            đích. đệm siêu nhẹ cho sải bước đàn hồi dễ chịu từ lúc xuất phát tới tận
                            khi về đích. đệm siêu nhẹ cho sải bước đàn hồi dễ chịu từ lúc xuất phát
                            tới tận khi về đích.Tự tin chinh phục cự ly với đôi giày chạy bộ adidas
                            này. Thân giày thoáng khí giúp đôi chân bạn luôn khô thoáng khi chạy
                            đường dài. Lớp đệm siêu nhẹ cho sải bước đàn hồi dễ chịu từ lúc xuất
                            phát tới tận khi về đích. đệm siêu nhẹ cho sải bước đàn hồi dễ chịu từ
                            lúc xuất phát tới tận khi về đích. đệm siêu nhẹ cho sải bước đàn hồi dễ
                            chịu từ lúc xuất phát tới tận khi về đích.
                        </p>
                    </div>

                    <h1 class="ke position-relative text-center text-uppercase mt-5 mb-5">
                        Sản Phẩm Liên Quan
                    </h1>
                    <div class=" mt-5">
                        <div class="row respon">

                        </div>
                    </div>






                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="container"
                                        style="background-color: rgb(249, 250, 255); width: 470px; padding: 50px 30px; margin-top: 30px;">
                                        <form action="">
                                            <h1 class=" text-center">Quên Mật Khẩu</h1>

                                            <label for="" class="w-100 my-2">Email</label> <input type="text"
                                                style="width: 100%; border-radius: 7px; padding: 8px 10px; border: 1px solid rgb(174, 174, 174);" />
                                            <button class="btn btn-primary w-100 my-4" style="padding: 10px 0px">Lấy
                                                Lại Mật Khẩu</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@include file="./common/foot.jsp" %>

            </body>

            </html>