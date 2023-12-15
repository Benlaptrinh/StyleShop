<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Signup</title>
                <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
                    rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                    crossorigin="anonymous">
                <script src="https://kit.fontawesome.com/e136359f35.js" crossorigin="anonymous" defer></script>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" defer></script>
                <!-- <script src="../app/js/script.js" defer></script> -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
                <script src="https://kit.fontawesome.com/2a2b6a97a5.js" crossorigin="anonymous"></script>
                <!-- <script src="/js/script.js" defer></script> -->

                <!-- <script src="../app/js/script.js"></script> -->

            </head>

            <body>
                <%@ include file="./common/head.jsp" %>

                    <div class="container">
                        <!-- header -->
                        <div class="row d-flex justify-content-center">
                            <div class="card my-3" style="width: 50rem;">
                                <div class="bg-white card-header text-center">
                                    <h3>Signup</h3>
                                </div>
                                <div class="card-body">
                                    <form:form modelAttribute="accForm" action="/account/signup" method="post"
                                        enctype="multipart/form-data" class="needs-validation" novalidate="true">
                                        <div class="signup mt-3">

                                            <div class="form-group mb-3">
                                                <input id="upload" name="image" class="form-control" type="file"
                                                    onchange="readURL(this);" accept="image/png, image/jpeg"
                                                    value="${accForm.image}" />
                                            </div>
                                            <div class="mb-3">
                                                <label for="id"><b>Username</b></label>
                                                <form:input path="id" type="text" class="form-control"
                                                    placeholder="VD: abc123" />
                                                <form:errors path="id" cssClass="form-text text-danger" />
                                            </div>
                                            <!-- Các trường form khác -->
                                            <div class="mb-3">
                                                <label for="email"><b>Email</b></label>
                                                <form:input path="email" type="email" class="form-control"
                                                    placeholder="VD: abc@gmail.com" />
                                                <form:errors path="email" cssClass="form-text text-danger" />
                                            </div>
                                            <div class="mb-3">
                                                <label for="password"><b>Password</b></label>
                                                <form:input path="password" type="password" class="form-control"
                                                    placeholder="VD: abc123" />
                                                <form:errors path="password" cssClass="form-text text-danger" />
                                            </div>
                                            <div class="mb-3">
                                                <label for="retypePassword"><b>Retype Password</b></label>
                                                <form:input path="retypePassword" type="password" class="form-control"
                                                    placeholder="Nhập lại đúng phần Password !" />
                                                <form:errors path="retypePassword" cssClass="form-text text-danger" />
                                            </div>
                                            <div class="mb-3">
                                                <label for="phone"><b>Phone</b></label>
                                                <form:input path="phone" type="tel" class="form-control"
                                                    placeholder="VD: 0123456789" />
                                                <form:errors path="phone" cssClass="form-text text-danger" />
                                            </div>
                                            <div class="mb-3">
                                                <label for="address"><b>Address</b></label>
                                                <form:input path="address" type="text" class="form-control"
                                                    placeholder="Địa chỉ đang hiện tại của bạn." />
                                                <form:errors path="address" cssClass="form-text text-danger" />
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="d-grid gap-2">
                                                <button type="submit" class="btn btn-primary">SUBMIT</button>
                                            </div>
                                        </div>
                                    </form:form>

                                </div>
                            </div>
                        </div>


                        <!-- footer -->
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
                    <%@ include file="./common/foot.jsp" %>


                        <!-- bootstrap js -->
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
                            crossorigin="anonymous"></script>
                        <!-- <script>
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
                            </script> -->
            </body>

            </html>