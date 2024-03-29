<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Administator Panel :Customers </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
    body {
        background: #36BDD1;
        background: -webkit-linear-gradient(left top, #027, #36BDD1);
        background: -moz-linear-gradient(bottom right, #027, #36BDD1);
        background: linear-gradient(to bottom right, #027, #36BDD1);
        color: #fff;
        font-family: 'Raleway', Helvetica, Arial, sans-serif;
        font-size: 18px;
        font-weight: 300;
        line-height: 140%;
        margin: 0;
        min-height: 100vh;
        padding: 0;
        width: 100%;
    }
    h1.page_title{color:#fff;}
    h4.what_to_do{color:#fff;}
    h2.menu_title{color:#fff;}
    .page_title,
    .what_to_do {
        font-weight: 300;
        line-height: 120%;
        text-align: center;
        text-shadow: 0 1px 5px rgba(0,0,0,.8);
        text-transform: uppercase;
    }

    /* PEN STYLES ========== */
    a,
    .side_menu {
        -webkit-transition: all 300ms ease-in-out;
        transition: all 300ms ease-in-out;
    }

    /* MENU CONTAINER ----- */
    .side_menu {
        background: rgba(0,20,60,.9);
        height: 100vh;
        left: -250px;
        position: absolute;
        top: 0;
        width: 250px;
    }
    .side_menu .container {
        padding: 0 1em;
    }

    /* HAMBURGER STYLES ----- */
    .burger_box {
        display: block;
        float: right;
        margin-right: -45px;
    }
    .burger_box a.menu-icon {
        display: inline-block;
        float: none;
        height: 43px;
        padding: 10px;
        opacity: .5;
        width: 45px;
        z-index: 100;
    }
    .burger_box a.menu-icon:hover,
    .burger_box a.menu-icon.opened {
        opacity: 1;
    }
    .burger_box a.menu-icon.opened {
        background: rgba(0,20,60,.9);
    }
    .burger_box .menu-icon_box {
        display: inline-block;
        height: 25px;
        position: relative;
        text-align: left;
        width: 25px;
    }
    .burger_box .menu-icon_line {
        background: #fff;
        border-radius: 2px;
        display: inline-block;
        height: 3px;
        position: absolute;
        width: 100%;
    }
    .burger_box .menu-icon_line--1 {
        top: 2px;
    }
    .burger_box .menu-icon_line--2 {
        top: 10px;
    }
    .burger_box .menu-icon_line--3 {
        top: 18px;
    }
    .burger_box .menu-icon_line--1 {
        transition: top 200ms 250ms, transform 200ms;
        -webkit-transition: top 200ms 250ms, -webkit-transform 200ms;
    }
    .burger_box .menu-icon_line--2 {
        transition: opacity 0ms 300ms;
        -webkit-transition: opacity 0ms 300ms;
    }
    .burger_box .menu-icon_line--3 {
        transition: top 100ms 300ms, transform 200ms;
        -webkit-transition: top 100ms 300ms, -webkit-transform 200ms;
    }
    .burger_box .menu-icon.opened .menu-icon_box {
        transform: scale3d(0.9, 0.9, 0.9);
        -webkit-transform: scale3d(0.9, 0.9, 0.9);
    }
    .burger_box .menu-icon.opened .menu-icon_line {
        top: 10px;
    }
    .burger_box .menu-icon.opened .menu-icon_line--1 {
        transform: rotate3d(0, 0, 1, 45deg);
        -webkit-transform: rotate3d(0, 0, 1, 45deg);
        transition: top 100ms, transform 200ms 250ms;
        -webkit-transition: top 100ms, -webkit-transform 200ms 250ms;
    }
    .burger_box .menu-icon.opened .menu-icon_line--2 {
        opacity: 0;
        transition: opacity 200ms;
        -webkit-transition: opacity 200ms;
    }
    .burger_box .menu-icon.opened .menu-icon_line--3 {
        transform: rotate3d(0, 0, 1, -45deg);
        -webkit-transform: rotate3d(0, 0, 1, -45deg);
        transition: top 200ms, transform 200ms 250ms;
        -webkit-transition: top 200ms, -webkit-transform 200ms 250ms;
    }

    /* STAGGER LIST ----- */
    .list_load {
        display: none;
        list-style: none;
        padding: 0;
    }
    .list_item {
        margin-left: -20px;
        opacity: 0;
        -webkit-transition: all 200ms ease-in-out;
        transition: all 200ms ease-in-out;
    }
    .list_item a {
        color: #fff;
        display: block;
        padding: 5px 10px;
        text-decoration: none;
    }
    .list_item a:hover {
        background: rgba(255,255,255,.2);
    }</style>
</head>
<body>

<h1 class="page_title">Customers</h1>
<h1></h1>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th>id</th>
            <th>first name</th>
            <th>last name</th>
            <th>Email </th>
            <th>phoneNumber</th>
            <th>Billing Address</th>
            <th>edit</th>
            <th>delete</th>

            <th></th>
        </tr>
        </thead>
        <c:forEach items="${Customers}" var="Customers" varStatus="counter">
            <tr>

                <td>${Customers.id}</td>
                <td>${Customers.firstName}</td>
                <td>${Customers.lastName}</td>
                <td>${Customers.email}</td>
                <td>${Customers.phoneNumber}</td>
                <td>${Customers.billing_address}</td>
                <td><a href="editCustomer?id=${Customers.id}">edit</a></td>
                <td><a href="deleteCustomer?id=${Customers.id}">delete</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="side_menu">
    <div class="burger_box">
        <div class="menu-icon-container">
            <a href="#" class="menu-icon js-menu_toggle closed">
				<span class="menu-icon_box">
					<span class="menu-icon_line menu-icon_line--1"></span>
					<span class="menu-icon_line menu-icon_line--2"></span>
					<span class="menu-icon_line menu-icon_line--3"></span>
				</span>
            </a>
        </div>
    </div>
    <div class="px-5">
        <h2 class="menu_title">Menu</h2>
        <ul class="list_load">
            <li class="list_item"><a href="flights">Flights</a></li>
            <li class="list_item"><a href="customers">Customers</a></li>
            <li class="list_item"><a href="transactions">Transactions</a></li>
            <li class="list_item"><a href="/cAuth">Logout</a></li>

        </ul>
        <%--        <div class="spacer_box"><p>This is a spacer box.</p></div>--%>
    </div>
</div>
<script>$(document).ready(function(){
    // Requires jQuery

    $(document).on('click','.js-menu_toggle.closed',function(e){
        e.preventDefault(); $('.list_load, .list_item').stop();
        $(this).removeClass('closed').addClass('opened');

        $('.side_menu').css({ 'left':'0px' });

        var count = $('.list_item').length;
        $('.list_load').slideDown( (count*.6)*100 );
        $('.list_item').each(function(i){
            var thisLI = $(this);
            timeOut = 100*i;
            setTimeout(function(){
                thisLI.css({
                    'opacity':'1',
                    'margin-left':'0'
                });
            },100*i);
        });
    });

    $(document).on('click','.js-menu_toggle.opened',function(e){
        e.preventDefault(); $('.list_load, .list_item').stop();
        $(this).removeClass('opened').addClass('closed');

        $('.side_menu').css({ 'left':'-250px' });

        var count = $('.list_item').length;
        $('.list_item').css({
            'opacity':'0',
            'margin-left':'-20px'
        });
        $('.list_load').slideUp(300);
    });
});</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
