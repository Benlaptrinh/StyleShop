<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    <script src="https://kit.fontawesome.com/2a2b6a97a5.js" crossorigin="anonymous"></script>

                    <script src="../../app/js/script.js" defer></script>


                </head>

                <body style="background-color: #5bb9b8;">

                    <!-- header -->
                    <jsp:include page="./common/head.jsp"></jsp:include>




                    <form class="needs-validation" novalidate="true" action="" modelAttribute="account" name="form">
                        <div class="form-group mb-3">
                            <label path="id">Username: </label>
                            <input path="id" class="form-control" type="text" required="true" />
                            <label class="invalid-feedback">Please enter UserName </label>
                        </div>
                        <div class="form-group mb-3">
                            <label path="email">Email</label>
                            <input path="email" class="form-control" type="email" required="true" />
                            <label class="invalid-feedback">Please enter Email </label>
                        </div>
                        <div class="form-group mb-3">
                            <label path="password">Password</label>
                            <input path="password" class="form-control" type="password" minlength="5" maxlength="30"
                                required="true" />
                            <label class="invalid-feedback">Please enter Password between 5 and 30
                                characters
                            </label>
                        </div>
                        <div class="form-group mb-3">
                            <label path="phone">Phone: </label>
                            <input path="phone" class="form-control" type="tel" required="true" />
                            <label class="invalid-feedback">Please enter Phone </label>
                        </div>
                        <div class="form-group mb-3">
                            <label path="address">Address: </label>
                            <input path="address" class="form-control" type="text" required="true" />
                            <label class="invalid-feedback">Please enter Address </label>
                        </div>
                        <div class="form-group mb-3">
                            <label path="activated">Is Activated: </label>
                            <radiobutton id="isActivated1" path="activated" value="1" /> True
                            <radiobutton id="isActivated2" path="activated" value="0" /> False
                        </div>
                        <div class="form-group mb-3">
                            <label path="admin">Is Admin: </label>
                            <radiobutton id="isAdmin1" path="admin" value="1" /> True
                            <radiobutton id="isAdmin2" path="admin" value="0" /> False
                        </div>

                        <input path="verifycode" class="form-control" type="hidden" required="true" />

                        <button id="createBtn" class="btn btn-outline-success" formaction="/admin/account/create"
                            formmethod="post" ng-disabled="form.$invalid">CREATE</button>
                        <button class="btn btn-outline-secondary" formaction="/admin/account/update" formmethod="post"
                            ng-disabled="form.$invalid">UPDATE</button>
                        <button class="btn btn-outline-danger" formaction="/admin/account/delete/${account.id}"
                            formmethod="get">DELETE</button>
                        <button class="btn btn-outline-info" formaction="/admin/account/"
                            formmethod="get">RESET</button>
                    </form>
                    </div>

                    <!-- list tab -->
                    <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="list-tab">

                        <hr>
                        <div class="row">
                            <div class="text-end">

                                <a href="/admin/account/export-excel" class="btn btn-info  text-white fw-bold">Export
                                    Excel</a>
                            </div>
                        </div>
                        <hr>

                    </div>
                    </div>
                    </div>
                    </main>
                    <!-- jquery -->
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

                    <script>

                        let message = ""
                        if ("${param.message}" != "") {
                            message += "Message: ${param.message}\n"
                            // alert("Message: ${param.message}");
                        }
                        if ("${param.error}" != "") {
                            message += "Error: ${param.error}\n"
                            // alert("${param.error}");
                        }
                        if ("${message}" != "") {
                            message += "Message: ${message}\n"
                            // alert("Message: ${message}");
                        }
                        if (message !== "") {
                            alert(message);
                        }


                    </script>
                    <!-- header -->
                    <jsp:include page="./common/foot.jsp"></jsp:include>
                </body>

                </html>