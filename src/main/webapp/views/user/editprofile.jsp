<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Edit profile</title>
                    <!-- title icon -->
                    <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
                    <!-- bootstrap css -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                        crossorigin="anonymous">
                    <!-- font awsome -->
                    <script src="https://kit.fontawesome.com/e136359f35.js" crossorigin="anonymous" defer></script>
                    <!-- jquery -->
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" defer></script>
                    <!-- my js -->
                    <script src="/js/script.js" defer></script>


                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                        rel="stylesheet" />
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

                    <style>
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
                </head>

                <body>
                    <jsp:include page="./common/head.jsp"></jsp:include>

                    <div class="container">
                        <!-- header -->
                        <div class="row d-flex justify-content-center">
                            <div class="card my-3" style="width: 50rem;">
                                <div class="bg-white card-header text-center">
                                    <h3>EDIT PROFILE</h3>
                                </div>
                                <div class="card-body">

                                    <form:form class="needs-validation" novalidate="true" action="/account/update"
                                        modelAttribute="account" enctype="multipart/form-data" name="form"
                                        method="post">
                                        <div class="form-group mb-3">
                                            <form:label path="image">Image: </form:label>
                                            <figure>
                                                <img src="" alt="">
                                                <c:choose>
                                                    <c:when test="${account.image != null}">

                                                        <!-- <img src="../../app/user/${account.image}" id="imageResult"
                                                            alt="" class="img-fluid img-thumbnail" width="120"
                                                            height="120"> -->
                                                        <img src="../../upload/user/${account.image}" id="imageResult"
                                                            alt="" class="img-fluid img-thumbnail" width="120"
                                                            height="120">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="/upload/user/error-404.jpg" id="imageResult" alt=""
                                                            class="img-fluid img-thumbnail" width="120" height="120">
                                                    </c:otherwise>
                                                </c:choose>
                                            </figure>
                                            <form:input id="upload" path="image" class="form-control" type="file"
                                                onchange="readURL(this);" accept="image/png, image/jpeg"
                                                value="${account.image}" />
                                        </div>
                                        <div class="form-group mb-3">
                                            <form:label path="id">Username: </form:label>
                                            <form:input path="id" class="form-control" type="text" required="true"
                                                readonly="true" />
                                            <label class="invalid-feedback">Please enter username </label>
                                        </div>
                                        <div class="form-group mb-3">
                                            <form:label path="email">Email</form:label>
                                            <form:input path="email" class="form-control" type="email"
                                                required="true" />
                                            <label class="invalid-feedback">Please enter email </label>
                                        </div>
                                        <div class="form-group mb-3">
                                            <form:input path="password" class="form-control" type="hidden" minlength="5"
                                                maxlength="30" required="true" />
                                        </div>
                                        <div class="form-group mb-3">
                                            <form:label path="phone">Phone: </form:label>
                                            <form:input path="phone" class="form-control" type="tel" required="true" />
                                            <label class="invalid-feedback">Please enter phone </label>
                                        </div>
                                        <div class="form-group mb-3">
                                            <form:label path="address">Address: </form:label>
                                            <form:input path="address" class="form-control" type="text"
                                                required="true" />
                                            <label class="invalid-feedback">Please enter address </label>
                                        </div>
                                        <button class="btn btn-success" formaction="/account/update"
                                            formmethod="post">UPDATE</button>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                        <!-- footer -->

                        <div class="modal fade" id="ChangePasswordModal" tabindex="-1"
                            aria-labelledby="ChangeModalLabel" aria-hidden="true">
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
                                                    <button type="submit" id="submitButton"
                                                        onclick="validateSignupForm()"
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

                    </div>

                    <!-- bootstrap js -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
                        crossorigin="anonymous"></script>
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


                </body>
                <jsp:include page="./common/foot.jsp"></jsp:include>

                </html>