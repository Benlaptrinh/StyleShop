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
            <form action="/mk/resetpass" method="post" style="max-width: 350px;">
                <input type="hidden" name="token" value="${token}" />
                <div class="border border-secondary rounded p-3">
                    <div>
                        <p>
                            <input type="password" name="password" id="password" class="form-control"
                                placeholder="Enter your new password" required autofocus />
                        </p>
                        <p>
                            <input type="password" class="form-control" placeholder="Confirm your new password" required
                                oninput="checkPasswordMatch(this);" />
                        </p>
                        <p class="text-center">
                            <input id="submit" type="submit" value="Change Password" class="btn btn-primary" />
                        </p>
                    </div>
                </div>
            </form>
        </body>

        </html>