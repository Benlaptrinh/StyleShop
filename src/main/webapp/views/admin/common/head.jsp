<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <nav class="navbar navbar-expand-lg bg-body-tertiary  text-bg-dark py-3 px-4 position-sticky top-0"
                style="z-index: 100;">
                <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="fs-6 text-white"><i class="bi bi-list fs-6 text-white"></i></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 d-flex align-items-center gap-4">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/index/">
                                <img src="../app/img/logo.png" alt="Bootstrap" width="50px" style="object-fit: cover"
                                    class="img-fluid" />
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-white" href="/admin/index"><i
                                    class="bi bi-house-fill fs-5 me-2"></i>Trang
                                Chủ</a>
                        </li>

                        <li class="nav-item d-flex">
                            <a class="nav-link text-white" href="/admin/account"><i
                                    class="bi bi-person-fill fs-5 me-2"></i>Account</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-white" href="/admin/category"><i
                                    class="bi bi-box-fill fs-5 me-2"></i>Categrory
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-white" href="/admin/product"><i
                                    class="bi bi-bag-fill fs-5 me-2"></i>Product
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-white" href="/admin/order"><i class="bi bi-receipt fs-5 me-2"></i>
                                Oder
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-white" href="/admin/revenue"><i
                                    class="bi bi-pencil-fill fs-5 me-2"></i>
                                Tổng Hợp
                            </a>
                        </li>

                    </ul>
                    <ul class="navbar-nav mb-2 mb-lg-0 d-flex align-items-center gap-4">


                        <li class="nav-item">
                            <a class="nav-link text-white" href="/account/logout"><i
                                    class="bi bi-box-arrow-right fs-5 me-2"></i>Đăng
                                Xuất</a>
                        </li>




                    </ul>
                </div>
            </nav>