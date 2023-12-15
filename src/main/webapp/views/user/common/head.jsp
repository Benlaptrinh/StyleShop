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
                            <a class="nav-link" aria-current="page" href="/">
                                <img src="../app/img/logo.png" alt="Bootstrap" width="50px" style="object-fit: cover"
                                    class="img-fluid" />
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-white" href="/"><i class="bi bi-house-fill fs-5 me-2"></i>Trang
                                Chủ</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-white" href="/sanpham"><i
                                    class="bi bi-box-seam-fill fs-5 me-2"></i>Sản
                                Phẩm</a>
                        </li>



                        <li class="nav-item">
                            <a class="nav-link text-white" href="/cart/view"><i
                                    class="bi bi-bag-check-fill fs-5 me-2"></i>Thanh
                                Toán
                            </a>
                        </li>



                    </ul>
                    <ul class="navbar-nav mb-2 mb-lg-0 d-flex align-items-center gap-4">
                        <c:if test="${! isLogin}">
                            <li class="nav-item">
                                <a class="nav-link text-white" href="/account/login"><i
                                        class="bi bi-person-circle fs-5 me-2"></i>Đăng
                                    Nhập</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link text-white" href="#" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal"><i
                                        class="bi bi-question-circle-fill fs-5 me-2"></i>Quên
                                    Mật
                                    Khẩu</a>
                            </li>
                        </c:if>


                        <c:if test="${isLogin}">
                            <li class="nav-item">
                                <a class="nav-link text-white" href="/account/update"><i
                                        class="bi bi-emoji-laughing-fill fs-5 me-2"></i>Xin
                                    Chào ${sessionUsername}
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="/account/update"><i
                                        class="bi bi-pencil-fill fs-5 me-2"></i>Edit Profile
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link text-white" href="#" data-bs-toggle="modal"
                                    data-bs-target="#ChangePasswordModal"><i class="bi bi-pass-fill fs-5 me-2"></i>Đổi
                                    Mật
                                    Khẩu</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link text-white" href="/account/logout"><i
                                        class="bi bi-box-arrow-right fs-5 me-2"></i>Đăng Xuất
                                </a>
                            </li>

                        </c:if>
                    </ul>
                </div>


            </nav>