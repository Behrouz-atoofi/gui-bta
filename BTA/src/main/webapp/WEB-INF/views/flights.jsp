
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html  >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Mobirise v5.0.29, mobirise.com">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/logo-134x134.jpg" type="image/x-icon">
    <meta name="description" content="">


    <title>flights</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/tether/tether.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/dropdown/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/socicon/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/theme/css/style.css">
    <link rel="preload" as="style" href="${pageContext.request.contextPath}/resources/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/mobirise/css/mbr-additional.css" type="text/css">




</head>
<body>

<section class="menu cid-s932vJDtIO" once="menu" id="menu1-l">

    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="https://mobiri.se">
                        <img src="${pageContext.request.contextPath}/resources/assets/images/logo-134x134.jpg" alt="Mobirise" style="height: 3.8rem;">
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-black display-7" href="https://mobiri.se">Travel Agency&nbsp;</a></span>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown nav-right" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-black text-primary display-4" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link link text-black display-4" href="/login">
                        Login</a></li><li class="nav-item"><a class="nav-link link text-black display-4" href="/register">
                        Register</a></li><li class="nav-item"><a class="nav-link link text-black display-4" href="/Allflights">
                        Flights</a></li></ul>


            </div>
        </div>
    </nav>

</section>

<section class="engine"><a href="https://mobirise.info/w">html5 templates</a></section><section class="features9 cid-s933a1Epxz" id="features10-m">
    <!---->


    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style mb-0 display-2"><strong>Flights</strong></h3>

        </div>
        <C:forEach items="${flights}" var="flight" >
        <div class="row mt-4">
            <div class="card col-12">
                <div class="card-wrapper">
                    <div class="top-line row">
                        <div class="col">
                            <h4 class="card-title mbr-fonts-style display-5"><strong>${flight.origin} -> -> -> ${flight.destination}</strong></h4>
                        </div>
                        <div class="col-auto">
                            <p class="price mbr-fonts-style display-5">Price : ${flight.price} IRR</p>
                            <p class="price mbr-fonts-style display-10">Flight ID : ${flight.flightId} </p>
                            <p class="price mbr-fonts-style display-8">QU : ${flight.quantity}</p>
                            <p class="price mbr-fonts-style display-8">Time : ${flight.time}</p>
                            <button type="button" class="btn btn-success align-right" href="Addtocart?${flight.flightId}">Add to cart</button>
                        </div>

                    </div>

                    </div>

                </div>

            </div>
        </C:forEach>
        </div>

    </div>
</section>


<script src="${pageContext.request.contextPath}/resources/assets/web/assets/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/tether/tether.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/smoothscroll/smooth-scroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/dropdown/js/nav-dropdown.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/dropdown/js/navbar-dropdown.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/touchswipe/jquery.touch-swipe.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/theme/js/script.js"></script>



</body>
</html>