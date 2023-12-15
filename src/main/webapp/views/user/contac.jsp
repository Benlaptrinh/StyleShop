<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <link
                href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
                rel="stylesheet">

            <title>Hexashop - Contact Page</title>
            <link rel="stylesheet" href="../app/reset.css" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
            <script src="https://kit.fontawesome.com/2a2b6a97a5.js" crossorigin="anonymous"></script>


            <!-- Additional CSS Files -->
            <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
            <link rel="stylesheet" type="text/css" href="../app/css/bootstrap.min.css">

            <link rel="stylesheet" type="text/css" href="../app/css/font-awesome.css">

            <link rel="stylesheet" href="../app/css/templatemo-hexashop.css">

            <link rel="stylesheet" href="../app/css/owl-carousel.css">

            <link rel="stylesheet" href="../app/css/lightbox.css">

        </head>

        <body>
            <%@ include file="./common/head.jsp" %>

                <div class="page-heading about-page-heading" id="top">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="inner-content">
                                    <h2>Contact Us</h2>
                                    <span>Awesome, clean &amp; creative HTML5 Template</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ***** Main Banner Area End ***** -->

                <!-- ***** Contact Area Starts ***** -->
                <div class="contact-us">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div id="map">
                                    <!-- <iframe
                                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d90186.37207676383!2d-80.13495239500924!3d25.9317678710111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88d9ad1877e4a82d%3A0xa891714787d1fb5e!2sPier%20Park!5e1!3m2!1sen!2sth!4v1637512439384!5m2!1sen!2sth"
                                        width="100%" height="400px" frameborder="0" style="border:0"
                                        allowfullscreen></iframe> -->
                                    <iframe
                                        src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d4280.216263008006!2d106.62609590279439!3d10.852441668764465!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1svi!2s!4v1696047082768!5m2!1svi!2s"
                                        width="100%" height="400px" frameborder="0" style="border:0"
                                        allowfullscreen></iframe>
                                    <!-- You can simply copy and paste "Embed a map" code from Google Maps for any location. -->

                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="section-heading">
                                    <h2>Say Hello. Don't Be Shy!</h2>
                                    <span>Details to details is what makes Hexashop different from the other
                                        themes.</span>
                                </div>
                                <form id="contact" action="/contactus/send" method="post">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <fieldset>
                                                <input name="name" type="text" id="name" placeholder="Your name"
                                                    required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-6">
                                            <fieldset>
                                                <input name="phone" type="text" id="phone" placeholder="Your Std"
                                                    required="">
                                            </fieldset>
                                        </div>

                                        <div class="col-lg-12 ">
                                            <fieldset>
                                                <input style="margin-top: 35px;" name="email" type="email" id="name"
                                                    placeholder="Your email" required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <textarea name="note" rows="6" id="message" placeholder="Your note"
                                                    required=""></textarea>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset class="d-flex justify-content-center">

                                                <button type="submit" class="btn btn-dark " style="width: 100px;"><i
                                                        class="bi bi-send-plus fs-5 "><span
                                                            class="ms-2">Gửi</span></i></button>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="subscribe">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="section-heading">
                                    <h2>By Subscribing To Our Newsletter You Can Get 30% Off</h2>
                                    <span>Details to details is what makes Hexashop different from the other
                                        themes.</span>
                                </div>
                                <form id="subscribe" action="" method="get">
                                    <div class="row">
                                        <div class="col-lg-5">
                                            <fieldset>
                                                <input name="name" type="text" id="name" placeholder="Your Name"
                                                    required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-5">
                                            <fieldset>
                                                <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*"
                                                    placeholder="Your Email Address" required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-2">
                                            <fieldset>
                                                <button type="submit" id="form-submit" class="main-dark-button"><i
                                                        class="fa fa-paper-plane"></i></button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-4">
                                <div class="row">
                                    <div class="col-6">
                                        <ul>
                                            <li>Store Location:<br><span>Sunny Isles Beach, FL 33160, United
                                                    States</span>
                                            </li>
                                            <li>Phone:<br><span>010-020-0340</span></li>
                                            <li>Office Location:<br><span>North Miami Beach</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-6">
                                        <ul>
                                            <li>Work Hours:<br><span>07:30 AM - 9:30 PM Daily</span></li>
                                            <li>Email:<br><span>info@company.com</span></li>
                                            <li>Social Media:<br><span><a href="#">Facebook</a>, <a
                                                        href="#">Instagram</a>,
                                                    <a href="#">Behance</a>, <a href="#">Linkedin</a></span></li>
                                        </ul>
                                    </div>
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
                    <script>

                        $(function () {
                            var selectedClass = "";
                            $("p").click(function () {
                                selectedClass = $(this).attr("data-rel");
                                $("#portfolio").fadeTo(50, 0.1);
                                $("#portfolio div").not("." + selectedClass).fadeOut();
                                setTimeout(function () {
                                    $("." + selectedClass).fadeIn();
                                    $("#portfolio").fadeTo(50, 1);
                                }, 500);

                            });
                        });

                    </script>

        </body>

        </html>