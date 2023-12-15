<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <script src="https://kit.fontawesome.com/2a2b6a97a5.js" crossorigin="anonymous"></script>
                <style>
                    a {
                        text-decoration: none;
                    }

                    h1#secondInput,
                    #shipValue input[type="text"] {
                        border: none;
                        outline: none;
                        background-color: transparent;
                        width: 100%;
                    }
                </style>
            </head>

            <body>
                <div class="container-fluid">
                    <!-- navbar ne -->
                    <%@ include file="./common/head.jsp" %>
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

                        <section class="h-custom">
                            <div class="container py-5 h-100">
                                <div class="row d-flex justify-content-center align-items-center h-100">
                                    <div class="col-12">
                                        <div class="card card-registration card-registration-2 shadow"
                                            style="border-radius: 15px">
                                            <div class="card-body p-0">
                                                <div class="row g-0">
                                                    <div class="col-lg-8">
                                                        <div class="p-5" style="background-color: rgb(244, 244, 244);">
                                                            <div
                                                                class="d-flex justify-content-between align-items-center">
                                                                <h1 class="fw-bold mb-0 text-black">Sản Phẩm</h1>

                                                                <a href="/cart/clear"
                                                                    class="btn btn-outline-secondary"><i
                                                                        class="bi bi-x-octagon-fill fs-5"><span
                                                                            class="mx-3">Clear</span></i></a>

                                                            </div>
                                                            <hr class="" />


                                                            <c:forEach var="item" items="${cartItems}" varStatus="loop">

                                                                <form action="/cart/update" method="post"
                                                                    class="row mb-4 d-flex justify-content-between align-items-center">
                                                                    <input type="hidden" name="id" value="${item.id}">
                                                                    <div class="col-md-2 col-lg-2 col-xl-2">

                                                                        <img src="../app/img/${item.image}"
                                                                            class="img-fluid rounded-3 "
                                                                            style="width: 100px;" style="width: 100px;"
                                                                            alt="Cotton T-shirt" />
                                                                    </div>
                                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                                        <h6 class="text-muted">Product</h6>
                                                                        <h6 class="text-black mb-0">${item.name}
                                                                        </h6>
                                                                    </div>


                                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                                        <input type="number"
                                                                            class="form-control input-sm"
                                                                            onblur="this.form.submit()"
                                                                            onchange="this.form.submit()" name="qty"
                                                                            value="${item.qty}">
                                                                    </div>
                                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">

                                                                        <h6 class="mb-0">${item.price *
                                                                            item.qty} $
                                                                        </h6>
                                                                    </div>

                                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                                        <a href="/cart/remove/${item.id}"
                                                                            class="text-muted "><i
                                                                                class="bi bi-trash3-fill "></i></a>
                                                                    </div>
                                                                </form>
                                                            </c:forEach>
                                                            <hr class="" />
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4" style="background-color: rgb(237, 237, 237)">
                                                        <div class="p-5">
                                                            <h3 class="fw-bold  pt-1">Thanh Toán</h3>
                                                            <hr class="" />
                                                            <div class="">
                                                                <div class="Input">
                                                                    <h5 class="text-uppercase ">Địa Chỉ Nhận Hàng</h5>
                                                                    <input type="text" class="form-control" name=""
                                                                        id="vietodayInput"
                                                                        placeholder="Enter text..." />
                                                                </div>

                                                                <div class="Input mt-3">
                                                                    <div class="d-flex gap-2  ">
                                                                        <input type="checkbox" class="form-check-input"
                                                                            id="shipCheckbox">
                                                                        <h5 class="">Giao Hàng (Ship)</h5>
                                                                    </div>

                                                                </div>
                                                            </div>


                                                            <div class="mt-3">
                                                                <div id="accordion">

                                                                </div>

                                                                <hr class="" />
                                                                <div class="d-flex justify-content-between mb-3">
                                                                    <h5 class="text-uppercase">Tổng Tiền :</h5>
                                                                    <h5>${totalAmount} $ </h5>
                                                                </div>



                                                                <a class="nav-link  text-white" href="#"
                                                                    data-bs-toggle="modal" data-bs-target="#mewmew"
                                                                    style="background-color: #35558a; width: 150px; padding: 10px 10px;"><i
                                                                        class="bi bi-pass-fill fs-5 me-2"></i>Xem Chi
                                                                    Tiết</a>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </section>
                </div>


                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="container" style="background-color: rgb(255, 255, 255); width: 470px">
                                    <form action="">
                                        <center class="">
                                            <h1>Login</h1>
                                        </center>
                                        <button class="btn btn-primary w-100">
                                            <i class="bi bi-facebook"></i>Login with Facebook
                                        </button>
                                        <button class="btn btn-info w-100 my-3 text-white">
                                            <i class="bi bi-twitter text-white"></i>Login with Facebook
                                        </button>
                                        <h6 class="text-secondary text-center">Or</h6>
                                        <label for="" class="w-100 my-2">Email</label>
                                        <input type="text" style="width: 100%; padding: 8px 0px" />
                                        <div
                                            class="centner d-flex my-3 gap-5 align-items-center justify-content-between">
                                            <label for="" class="w-100">Password</label>
                                            <label for="" class="w-100">Forgot your password?</label>
                                        </div>
                                        <input type="password" style="width: 100%; padding: 8px 0px" />
                                        <button class="btn btn-dark w-100 my-4">Login</button>
                                    </form>
                                    <center>
                                        <h6 class="px-5 py-4 shadow" style="border: 1px solid black">
                                            Don’t have an account?
                                            <a href="" data-bs-toggle="modal" data-bs-target="#exampleModal1"><u
                                                    class="text-secondary">Join
                                                    Unsplash</u></a>
                                        </h6>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="container" style="background-color: rgb(255, 255, 255); width: 470px">
                                    <form action="">
                                        <center class="">
                                            <h1>Join Store</h1>
                                            <p>
                                                Already have an account? <u class="text-secondary">Login</u>
                                            </p>
                                        </center>
                                        <button class="btn btn-primary w-100">
                                            <i class="bi bi-facebook"></i>Login with Facebook
                                        </button>
                                        <button class="btn btn-info w-100 my-3 text-white">
                                            <i class="bi bi-twitter text-white"></i>Login with Facebook
                                        </button>

                                        <div class="d-flex gap-5 justify-content-between">
                                            <div class="left">
                                                <label for="" class="w-100 my-2">First name</label>
                                                <input type="text" style="width: 100%; padding: 8px 0px" />
                                            </div>
                                            <div class="right">
                                                <label for="" class="w-100 my-2">Last name</label>
                                                <input type="text" style="width: 100%; padding: 8px 0px" />
                                            </div>
                                        </div>

                                        <label for="" class="w-100 mt-3">Email</label>

                                        <input type="password" style="width: 100%; padding: 8px 0px" />
                                        <label for="" class="w-100 my-2">Username (only letters, numbers, and
                                            underscores)</label>
                                        <input type="text" style="width: 100%; padding: 8px 0px" />
                                        <label for="" class="w-100 my-2">Password (min. 8 char)</label>
                                        <input type="text" style="width: 100%; padding: 8px 0px" />
                                        <button class="btn btn-dark w-100 my-4">Login</button>
                                    </form>
                                    <center>
                                        <h6 class="px-5 py-4 shadow fs-6" style="border: 1px solid black">
                                            By joining, you to the
                                            <u class="text-secondary">Terms</u> and
                                            <u class="text-secondary">Privacy Policy</u>.
                                        </h6>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


                <div class="modal fade" id="mewmew" tabindex="-1" aria-labelledby="ChangeModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body text-start text-black p-4">
                                <h5 class="modal-title text-uppercase mb-5" id="exampleModalLabel">Johnatan Miller</h5>
                                <h4 class="mb-5" style="color: #35558a;">Thanks for your order</h4>
                                <p class="mb-0" style="color: #35558a;">Payment summary</p>
                                <hr class="mt-2 mb-4"
                                    style="height: 0; background-color: transparent; opacity: .75; border-top: 2px dashed #9e9e9e;">

                                <div class="d-flex justify-content-between mb-2">
                                    <p class="fw-bold mb-0">Tên Người Mua </p>
                                    <p class="text-muted mb-0 me-3">${username}</p>
                                </div>

                                <div class="d-flex justify-content-between mb-2">
                                    <p class="fw-bold mb-0">Số Điện Thoại </p>
                                    <p class="text-muted mb-0 me-3">${stdne}</p>
                                </div>

                                <!-- <div class="d-flex justify-content-between mb-2">
                                    <p class="fw-bold mb-0">Địa Chỉ </p>
                                    <input type="text" class="form-control text-end" style="border: none;"
                                        name="secondInput" id="secondInput" />
                                </div> -->

                                <div class="d-flex justify-content-between mb-2">
                                    <p class="fw-bold mb-0">Số Lượng </p>
                                    <p class="text-muted mb-0 me-3">${cartQuantity}</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="fw-bold ">Giá Gốc </p>
                                    <p class="small me-2" style="font-size: 17px;">${totalAmount}</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="fw-bold ">Shipping </p>
                                    <p class="small "><input type="text" class="form-control text-end" id="shipValue"
                                            placeholder="100" style="display: none;border: none;"></p>
                                </div>


                                <div class="d-flex justify-content-between">
                                    <p class="fw-bold">Total</p>

                                    <span><strong id="totalAmountAfterShip"
                                            class="text-danger">${totalAmount}</strong></span>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <a href='/cart/checkout/<% out.print((String)session.getAttribute("username")); %>?quantity=${totalAmount}&anotherValue=${idne}&soluongne=${cartQuantity}&vietne='
                                    id="checkoutLink" class="btn btn-dark btn-block btn-lg"
                                    data-mdb-ripple-color="dark">
                                    <i class="bi bi-cash-stack"></i>
                                    Thanh Toán</a>
                            </div>
                        </div>
                    </div>
                </div>

                <%@ include file="./common/foot.jsp" %>


            </body>
            <script>
                document.getElementById("vietodayInput").addEventListener("input", function () {
                    var vietodayValue = this.value;
                    var checkoutLink = document.getElementById("checkoutLink");
                    var originalHref = checkoutLink.getAttribute("href");
                    var newHref = originalHref.replace(/vietne=[^&]*/, "vietne=" + encodeURIComponent(vietodayValue));
                    checkoutLink.setAttribute("href", newHref);


                });


            </script>

            <script>
                // Chờ cho trang web được tải hoàn toàn
                document.addEventListener("DOMContentLoaded", function () {
                    // Lấy tham chiếu đến các ô input
                    var vietodayInput = document.getElementById("vietodayInput");
                    var secondInput = document.getElementById("secondInput");

                    // Thêm sự kiện "input" vào ô input đầu tiên để theo dõi sự thay đổi giá trị
                    vietodayInput.addEventListener("input", function () {
                        // Gán giá trị từ ô input đầu tiên vào ô input thứ hai
                        secondInput.value = vietodayInput.value;
                    });
                });
            </script>

            <script>
                var shipCheckbox = document.getElementById('shipCheckbox');
                var shipValueInput = document.getElementById('shipValue');

                shipCheckbox.addEventListener('change', function () {
                    if (shipCheckbox.checked) {
                        shipValueInput.value = '50.0';
                        shipValueInput.style.display = 'block';
                    } else {
                        shipValueInput.value = '';
                        shipValueInput.style.display = 'none';
                    }
                });
            </script>
            <script>
                // Lấy giá trị totalAmount và ship từ biến đã được định nghĩa trước đó
                var totalAmount = parseFloat('${totalAmount}'); // Chuyển đổi totalAmount thành số thực
                var ship = 50.0; // Giá trị ship

                // Lấy tham chiếu đến thẻ span chứa totalAmount sau khi trừ ship
                var totalAmountAfterShipSpan = document.getElementById('totalAmountAfterShip');
                var shipCheckbox = document.getElementById('shipCheckbox');

                // Thực hiện phép trừ khi checkbox được chọn
                shipCheckbox.addEventListener('change', function () {
                    if (shipCheckbox.checked) {
                        // Nếu checkbox được chọn, giảm giá trị totalAmount đi 10
                        totalAmountAfterShipSpan.textContent = (totalAmount + ship).toFixed(2);
                    } else {
                        // Nếu checkbox không được chọn, giữ nguyên giá trị totalAmount
                        totalAmountAfterShipSpan.textContent = totalAmount.toFixed(2);
                    }
                });
            </script>

            </html>