<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
            <script src="https://kit.fontawesome.com/2a2b6a97a5.js" crossorigin="anonymous"></script>
        </head>

        <body>
            <%@ include file="./common/head.jsp" %>

                <div class="container">
                    <div class="">
                        <section class="text-center ">
                            <!-- Background image -->
                            <div class="p-5 bg-image" style="
                  background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg');
                  height: 150px;
                  "></div>
                            <!-- Background image -->

                            <div class="card mx-4 mx-md-5 shadow-5-strong" style="
                  margin-top: -100px;
                  background: hsla(0, 0%, 100%, 0.8);
                  backdrop-filter: blur(30px);
                  ">
                                <div class="card-body py-5 px-md-5 d-flex justify-content-center">

                                    <div class="row d-flex justify-content-center w-75">
                                        <div class="col-lg-8">
                                            <h2 class="fw-bold mb-5">Sign up now</h2>
                                            <h1>${loi}</h1>

                                            <form action="/account/login" method="post" class="row g-3 needs-validation"
                                                novalidate>
                                                <div class="form-floating mb-3 position-relative">
                                                    <input type="text" name="username" class="form-control"
                                                        id="floatingInput" placeholder="name@example.com"
                                                        value="${cookie.username.value}"> <label
                                                        for="floatingInput">Username</label> <span
                                                        class="position-absolute top-50 end-0 px-4 translate-middle-y">
                                                        <i class="bi bi-envelope-at"></i>
                                                    </span>
                                                </div>

                                                <div class="form-floating mb-3 position-relative">
                                                    <input name="password" type="password" class="form-control"
                                                        id="floatingInput" placeholder="name@example.com"
                                                        value="${cookie.password.value}"> <label
                                                        for="floatingInput">PassWorld</label> <span
                                                        class="position-absolute top-50 end-0 px-4 translate-middle-y">
                                                        <i class="bi bi-key"></i>
                                                    </span>
                                                </div>

                                                <div
                                                    class="form-check d-flex align-content-center justify-content-between mb-4">
                                                    <div>
                                                        <input class="form-check-input me-2" type="checkbox" value=""
                                                            id="form2Example33" name="remember" checked />
                                                        <label class="form-check-label" for="form2Example33">
                                                            Nhớ Mật Khẩu
                                                        </label>
                                                    </div>
                                                    <div>
                                                        <a href="/account/signup"
                                                            class="text-primary  text-decoration-none"> Tạo 1
                                                            Tài
                                                            Khoảng !</a>

                                                    </div>
                                                </div>

                                                <!-- Submit button -->
                                                <button type="submit" class="btn btn-primary btn-block mb-4 w-25">
                                                    Sign up
                                                </button>

                                                <h3 class="text-danger">${message} ${param.error}</h3>



                                                <!-- Register buttons -->
                                                <div class="text-center">
                                                    <p>or sign up with:</p>
                                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                                        <i class="fab fa-facebook-f"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                                        <i class="fab fa-google"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                                        <i class="fab fa-twitter"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                                        <i class="fab fa-github"></i>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div style="width: 400px;" class="d-flex align-items-center justify-content-center">
                            <form action="" class=""
                                style="padding: 10px 20px; width: 700px;background-color: rgb(242, 250, 240);">
                                <!-- input -->
                                <div class="Input py-2">
                                    <label for="" class="py-1">Đến :</label>
                                    <input type="text" class="form-control " style="padding:  10px 20px" name="" id=""
                                        placeholder="" />
                                </div>

                                <div class="Input py-2">
                                    <label for="" class="py-1">link :</label>
                                    <input type="text" class="form-control " style="padding:  10px 20px" name="" id=""
                                        placeholder="" />
                                </div>

                                <div class="Input py-2">
                                    <label for="" class="py-1">Nội Dung :</label>
                                    <textarea name="" id="" class="w-100" cols="" rows="5"></textarea>
                                </div>
                                <button type="" class="btn btn-primary">Gửi</button>
                                <button type="" class="btn btn-secondary">Huỷ</button>
                            </form>
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

                </div>

                <%@ include file="./common/foot.jsp" %>

        </body>

        </html>