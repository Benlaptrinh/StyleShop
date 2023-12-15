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
                <script src="https://kit.fontawesome.com/2a2b6a97a5.js" crossorigin="anonymous"></script>

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
                <jsp:include page="./common/head.jsp"></jsp:include>

                <div class="container-fluid">
                    <!-- navbar ne -->

                    <!-- slide -->
                    <div id="carouselExample" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="carousel-item active">

                                <img src="../app/img/slide1.jpg" class="w-100 img-fluid shadow " alt="..."
                                    style="object-fit: cover; height: 500px" />
                            </div>
                            <div class="carousel-item">
                                <img src="../app/img/slide2.jpg" class="w-100 img-fluid shadow" alt="..."
                                    style="object-fit: cover; height: 500px" />
                            </div>
                            <div class="carousel-item">
                                <img src="../app/img/slide3.jpg" class="w-100 img-fluid shadow" alt="..."
                                    style="object-fit: cover; width: 100%; height: 500px" />
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <h1 class="ke position-relative text-center mb-5 text-uppercase mt-5">
                        admin
                    </h1>


                    <div id="featured" class="container p-4" style="
              background: #F5FAFE;">
                        <div class="content">
                            <header>
                                <h2 class="fw-bold ms-5 fs-4 lh-base text-dark fw-bolder">Địa Điểm Nổi Tiếng</h2>
                                <div class="d-flex justify-content-between   ms-5">
                                    <p style=" font-weight: 400;
                      font-size: 16px;
                      line-height: 30px;
                      color: #5A6473;">Tại Cửa Hàng Chúng Tôi Mở Cửa Mọi Thời Gian</p>
                                    <a href="#!" class="me-5">
                                        <span class="" style=" font-weight: 600;
                        font-size: 18px;
                        line-height: 27px;
                        color: #0689FF;
                        margin-right: 10px;">Xem Rõ Tất Cả Thông Tin</span>
                                        <img src="../app/img/muitenphai.svg" alt="" class="arrow">
                                    </a>
                            </header>

                            <div class="row  shadow py-5" style="margin-top: 70px;background-color: rgb(243, 247, 248);
                   ">
                                <!-- item1 -->
                                <div
                                    class="item shadow pb-5  rounded-4 bg-white col-sm-6 col-lg-3 col-md-4 khoangcachne">
                                    <a href="#!"><img style="height: 230px; object-fit: cover;  width: 100%; "
                                            src="../app/img/điaiem1.webp" alt="" class="img-fluid rounded-top"></a>
                                    <div class="body">
                                        <center>
                                            <h3 class="title line-clamp"><a href="#!">Paris</a></h3>
                                        </center>
                                        <center>
                                            <p class="desc fw-bolder" style="">Đường 8502 ngõ Maine 98280</p>
                                        </center>
                                        <div class="info">
                                            <div class="d-flex gap-4  align-items-center justify-content-center">

                                                <div class="div d-flex align-items-center  gap-1"> <img
                                                        src="../app/img/featured1.svg" alt="" class="icon">
                                                    <span class="fw-bold">5 beds</span>
                                                </div>

                                                <div class="div d-flex align-items-center gap-1"> <img
                                                        src="../app/img/featured2.svg" alt="" class="icon">
                                                    <span class="fw-bold">2 both</span>
                                                </div>
                                                <div class="div d-flex gap-1 align-items-center">
                                                    <img src="../app/img/featured3.svg" alt="" class="icon">
                                                    <span class="fw-bold">2000 Sqft</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div
                                    class="item shadow pb-5 rounded-4 bg-white col-sm-6 col-lg-3 col-md-4 khoangcachne">
                                    <a href="#!"><img style="height: 230px; object-fit: cover;  width: 100%;"
                                            src="../app/img/diadiem2.webp" alt="" class="img-fluid rounded-top"></a>
                                    <div class="body">
                                        <center>
                                            <h3 class="title line-clamp"><a href="#!">Germany</a></h3>
                                        </center>
                                        <center>
                                            <p class="desc fw-bolder" style="">Đường 8502 ngõ Maine 98280</p>
                                        </center>
                                        <div class="info">
                                            <div class="d-flex gap-4  align-items-center justify-content-center">

                                                <div class="div d-flex align-items-center  gap-1"> <img
                                                        src="../app/img/featured1.svg" alt="" class="icon">
                                                    <span class="fw-bold">5 beds</span>
                                                </div>

                                                <div class="div d-flex align-items-center gap-1"> <img
                                                        src="../app/img/featured2.svg" alt="" class="icon">
                                                    <span class="fw-bold">2 both</span>
                                                </div>
                                                <div class="div d-flex gap-1 align-items-center">
                                                    <img src="../app/img/featured3.svg" alt="" class="icon">
                                                    <span class="fw-bold">2000 Sqft</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div
                                    class="item shadow pb-5 rounded-4 bg-white col-sm-6 col-lg-3 col-md-4 khoangcachne">
                                    <a href="#!"><img style="height: 230px; object-fit: cover;  width: 100%;"
                                            src="../app/img/diadiem3.webp" alt="" class="img-fluid rounded-top"></a>
                                    <div class="body">
                                        <center>
                                            <h3 class=""><a href="#!" class="text-dark">France</a></h3>
                                        </center>
                                        <center>
                                            <p class="desc fw-bolder" style="">Đường 8502 ngõ Maine 98280</p>
                                        </center>
                                        <div class="info">
                                            <div class="d-flex gap-4  align-items-center justify-content-center">

                                                <div class="div d-flex align-items-center  gap-1"> <img
                                                        src="../app/img/featured1.svg" alt="" class="icon">
                                                    <span class="fw-bold">5 beds</span>
                                                </div>

                                                <div class="div d-flex align-items-center gap-1"> <img
                                                        src="../app/img/featured2.svg" alt="" class="icon">
                                                    <span class="fw-bold">2 both</span>
                                                </div>
                                                <div class="div d-flex gap-1 align-items-center">
                                                    <img src="../app/img/featured3.svg" alt="" class="icon">
                                                    <span class="fw-bold">2000 Sqft</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <section class="mt-3">
                            <div class="container">
                                <div
                                    class="member__header d-flex flex-column align-items-center justify-content-center">
                                    <h1 class="ke position-relative text-center text-uppercase mt-5 mb-4">
                                        Thịnh Hành
                                    </h1>
                                    <p class="text-center fw-bold text-secondary mt-3 w-75">Thời Nay Có Rất NHiều
                                        Bạn
                                        Trẻ Đang Đuổi
                                        Theo Xu
                                        Hướng
                                        Mới Nhất Và cùng Thời Điển Đó Thời Trang Là Thứ Mà Các Bạn Quan Tâm Nhiều
                                        Nhât
                                        Cho Nên Ở Đây
                                        Luôn Luôn
                                        Cung
                                        Cấp Cho Các Bạn</p>
                                </div>
                            </div>
                        </section>


                        <div class="container w-100">
                        </div>

                        <div class="container d-flex justify-content-center shadow  py-4">
                            <div class=" d-flex gap-1">
                                <img src="../app/img/th1.webp" alt="" class="chechieudai img-fluid p-1 rounded-4 "
                                    style=" object-fit: cover;">
                                <div class="img d-flex flex-column img col-sm-6">
                                    <img src="../app/img/th2.webp" alt="" class="img-fluid p-1  rounded-4"
                                        style="height:  200px; object-fit: cover;">
                                    <img src="../app/img/th3.webp" class="img-fluid p-1  rounded-4"
                                        style="height: 200px; object-fit: cover;">
                                </div>
                            </div>
                            <div class="right col-sm-6">
                                <div class="img  flex-column ">
                                    <img src="../app/img/th4.webp" alt="" class="img-fluid p-1   rounded-4"
                                        style="height:  200px; object-fit: cover;">
                                    <img src="../app/img/th5.webp" class="img-fluid p-1  rounded-4"
                                        style="height: 200px; object-fit: cover;">
                                </div>
                                <img src="../app/img/th6.webp" alt="" class="col-6 img-fluid p-1   rounded-4"
                                    style="height: 200px; object-fit: cover; width: 600px;">
                            </div>
                        </div>

                        <section class="mt-3">
                            <div class="container">
                                <div
                                    class="member__header d-flex flex-column align-items-center justify-content-center">
                                    <h1 class="ke position-relative text-center text-uppercase mt-5 mb-4">
                                        Thương Hiệu
                                    </h1>

                                </div>
                            </div>
                        </section>

                        <!-- ádas -->
                        <div class="container mt-5 p-5 shadow" style="background-color: rgb(230, 247, 252)">
                            <div class="row d-flex align-content-center justify-content-between">
                                <div class="col-sm-6 col-lg-3 col-md-">
                                    <div class="d-flex align-content-center justify-content-center">
                                        <img src="../app/img/thh1.webp" alt="" class="rounded-3 img-fluid shadow"
                                            style="width: 75%; height: 290px; object-fit: cover" />
                                    </div>
                                    <h3 class="fs-6 lh-1 text-center mt-2">Dr. Essence Page</h3>
                                    <p class="fs-6 lh-26 text-center">
                                        DDS, California - Linda University
                                    </p>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4">
                                    <div class="d-flex align-content-center justify-content-center">
                                        <img src="../app/img/thh2.webp" alt="" class="rounded-3 img-fluid shadow"
                                            style="width: 75%; height: 290px; object-fit: cover" />
                                    </div>
                                    <h3 class="fs-6 lh-1 text-center mt-2">Dr. Essence Page</h3>
                                    <p class="fs-6 lh-26 text-center">
                                        DDS, California - Linda University
                                    </p>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4">
                                    <div class="d-flex align-content-center justify-content-center">
                                        <img src="../app/img/thh3.webp" alt="" class="rounded-3 img-fluid shadow"
                                            style="width: 75%; height: 290px; object-fit: cover" />
                                    </div>
                                    <h3 class="fs-6 lh-1 text-center mt-2">Dr. Essence Page</h3>
                                    <p class="fs-6 lh-26 text-center">
                                        DDS, California - Linda University
                                    </p>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4">
                                    <div class="d-flex align-content-center justify-content-center">
                                        <img src="../app/img/thh4.webp" alt="" class="rounded-3 img-fluid shadow"
                                            style="width: 75%; height: 290px; object-fit: cover" />
                                    </div>

                                    <h3 class="fs-6 lh-1 text-center mt-2">Dr. Essence Page</h3>
                                    <p class="fs-6 lh-26 text-center">
                                        DDS, California - Linda University
                                    </p>
                                </div>
                            </div>
                        </div>



                        <h1 class="ke position-relative text-center text-uppercase mt-5 mb-5">
                            Về Chúng Tôi
                        </h1>

                        <div class="container p-5 shadow " style="
                  padding: 50px 0 130px 0;
                  background-color: rgb(230, 247, 252);
                  height: 550đpx;
                ">
                            <div class="row d-flex align-items-center justify-content-between">
                                <div class="col-sm-12 col-md me-5 mb-md-0 mb-5">
                                    <figure class="feature__images position-relative">
                                        <img src="../app/img/ab1.webp" alt="" class="img-fluid rounded-4 shadow"
                                            style="width: 512px; height: 370px; object-fit: cover" />
                                        <img src="../app/img/ab2.webp" alt=""
                                            class="feature__img img-fluid rounded-4 position-absolute mb-5 shadow"
                                            style="object-fit: cover" />
                                    </figure>
                                </div>

                                <div class="col-sm-12 col-md ms-5 mt-5 take">
                                    <h1 class="section-deading">Thời Trang Phong Cách Của Giới Trẻ.</h1>
                                    <p class="chieudauchu">
                                        Cụm từ Y2K được viết tắt từ chữ Year (Y) và năm 2000 (2K). Khái niệm Y2K bắt
                                        đầu
                                        là một
                                        thuật ngữ công
                                        nghệ, sau đó sử dụng rộng rãi trong nhiều lĩnh vực khác, trong đó có thời
                                        trang.
                                        Với dấu ấn
                                        đặc trưng của
                                        văn hóa đại chúng với những cái tên nổi bật như Paris Hilton, Britney
                                        Spears.
                                        Những người
                                        nổi tiếng thời
                                        điểm đó được biết đến là những người có cá tính phóng khoáng, nổi loạn, trẻ
                                        trung thể hiện
                                        qua các trang
                                        phục sặc sỡ như quần denim cạp trễ, chân váy midi và những set đồ nhung luôn
                                        là
                                        tâm điểm cho
                                        giới báo chí
                                        săn đón.
                                    </p>
                                    <a href="#!" class="btn btn-outline-primary py-3 px-4  rounded-3">Mua Sản
                                        Phẩm</a>
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
                                            <button class="btn btn-dark w-100 my-4" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal">Login</button>
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
                                                <input type="password" id="password" name="oldPassword" required>
                                            </div>

                                            <div class="inputDiv">
                                                <label class="inputLabel" for="password">New Password</label>
                                                <input type="password" id="password" name="newPassword" required>
                                            </div>

                                            <div class="inputDiv">
                                                <label class="inputLabel" for="confirmPassword">Confirm
                                                    Password</label>
                                                <input type="password" id="confirmPassword" name="retypePassword">
                                            </div>

                                            <div class="buttonWrapper">
                                                <button type="submit" id="submitButton" onclick="validateSignupForm()"
                                                    class="submitButton pure-button pure-button-primary">
                                                    <span>Change password</span>
                                                </button>
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

                    <jsp:include page="./common/foot.jsp"></jsp:include>

            </body>

            </html>