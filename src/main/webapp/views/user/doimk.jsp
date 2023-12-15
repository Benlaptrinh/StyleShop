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
        </head>

        <body>
            <jsp:include page="./common/head.jsp"></jsp:include>

            <h1 class="text-center">Đổi Mật Khẩu</h1>

            <div class="container w-50 mt-5 shadow " style="padding: 20px 50px;">
                <form action="/mk/resetpass" method="post">
                    <input type="hidden" name="token" value="${token}" />
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input name="password" type="password" id="form2Example1" class="form-control" />
                        <label class="form-label" for="form2Example1">Password</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-4">
                        <input type="password" id="form2Example2" class="form-control" />
                        <label class="form-label" for="form2Example2">Confirm Password</label>
                    </div>



                    <!-- Submit button -->
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary btn-block mb-4 w-25">Sign in</button>
                    </div>


                </form>
            </div>
            <jsp:include page="./common/foot.jsp"></jsp:include>

        </body>

        </html>