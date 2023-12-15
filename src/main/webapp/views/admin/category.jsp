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
                    <script src="https://kit.fontawesome.com/2a2b6a97a5.js" crossorigin="anonymous"></script>

                    <script src="../../app/js/script.js" defer></script>

                </head>

                <body style="background-color: #5bb9b8;">
                    <!-- header -->
                    <jsp:include page="./common/head.jsp"></jsp:include>

                    <h1 class="text-white text-center" style="margin-top: 120px">Loại Sản Phẩm</h1>

                    <main class="show "
                        style="background-color: white; width: 50%;margin-left: 24%; border-radius: 10px;margin-top: 40px;padding: 100px 0;">
                        <div class="container w-50">
                            <ul class="nav nav-tabs mb-2" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                        data-bs-target="#edit" type="button" role="tab" aria-controls="home"
                                        aria-selected="true">Edit</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                                        data-bs-target="#list" type="button" role="tab" aria-controls="profile"
                                        aria-selected="false">List</button>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <!-- edit tab -->
                                <div class="tab-pane fade show active" id="edit" role="tabpanel"
                                    aria-labelledby="edit-tab">
                                    <form:form class="needs-validation" novalidate="true" action=""
                                        modelAttribute="category" name="form">
                                        <div class="form-group mb-3">
                                            <form:label path="id">Category ID: </form:label>
                                            <form:input path="id" class="form-control" type="text" required="true" />
                                            <label class="invalid-feedback">Please enter id </label>
                                        </div>
                                        <div class="form-group mb-3">
                                            <form:label path="name">Category Name</form:label>
                                            <form:input path="name" class="form-control" type="text" required="true" />
                                            <label class="invalid-feedback">Please enter name </label>
                                        </div>
                                        <button class="btn btn-success" formaction="/admin/category/create"
                                            formmethod="post" ng-disabled="form.$invalid">CREATE</button>
                                        <button class="btn btn-secondary" formaction="/admin/category/update"
                                            formmethod="post" ng-disabled="form.$invalid">UPDATE</button>
                                        <button class="btn btn-danger"
                                            formaction="/admin/category/delete/${category.id}"
                                            formmethod="get">DELETE</button>
                                        <button class="btn btn-info" formaction="/admin/category/"
                                            formmethod="get">RESET</button>
                                    </form:form>
                                </div>

                                <!-- list tab -->
                                <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="list-tab">
                                    <div class="row bg-light p-2">
                                        <div class="text-center">
                                            <h3 class="text-capitalize">SORT CATEGORY BY <span class="fw-bold">A</span>
                                            </h3>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="text-end">
                                            <a href="/admin/category/export-excel"
                                                class="btn btn-info  text-white fw-bold">Export Excel</a>
                                        </div>
                                    </div>
                                    <hr>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">NAME</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${categories}" varStatus="loop">
                                                <tr>
                                                    <th scope="row">${item.id}</th>
                                                    <th>${item.name}</th>
                                                    <th class="text-end">
                                                        <a href="/admin/category/edit/${item.id}"
                                                            class="btn btn-primary" role="button">Edit</a>
                                                        <a href="/admin/category/delete/${item.id}"
                                                            class="btn btn-danger" role="button">Del</a>
                                                    </th>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>


                    <!-- header -->
                    <jsp:include page="./common/foot.jsp"></jsp:include>

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

                </html>