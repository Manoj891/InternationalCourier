<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <%
        String path = request.getContextPath();
    %>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Courier Management System</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <script src="<%=path%>/bootstrap/js/jquery-3.4.1.min.js"></script>

    <link href="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.css" rel="stylesheet">
    <script src="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.js"></script>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        body{
            background:#f8fafc;
            overflow-x:hidden;
        }

        .navbar{
            height:90px;
            background:#ffffff;
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:0 70px;
            position:sticky;
            top:0;
            z-index:999;
            box-shadow:0 2px 20px rgba(0,0,0,.08);
        }

        .logo{
            display:flex;
            align-items:center;
            gap:15px;
        }

        .logo img{
            height:55px;
        }

        .logo h2{
            font-size:24px;
            font-weight:700;
            color:#0f172a;
        }

        .nav-links{
            display:flex;
            align-items:center;
            gap:30px;
        }

        .nav-links a{
            text-decoration:none;
            color:#475569;
            font-weight:500;
        }

        .login-top-btn{
            background:linear-gradient(
                    90deg,
                    #0f172a 0%,
                    #2563eb 50%,
                    #7c3aed 100%
            );
            color:white;
            border:none;
            padding:12px 26px;
            border-radius:50px;
            cursor:pointer;
            font-weight:600;
        }

        .hero{
            min-height:90vh;
            display:flex;
            align-items:center;
            justify-content:space-between;
            padding:80px;
            background:linear-gradient(
                    135deg,
                    #eef2ff 0%,
                    #f8fafc 50%,
                    #f3e8ff 100%
            );
        }

        .hero-left{
            width:50%;
        }

        .hero-left h1{
            font-size:68px;
            line-height:1.1;
            margin-bottom:25px;
            color:#0f172a;
            font-weight:800;
        }

        .hero-left p{
            font-size:20px;
            color:#64748b;
            line-height:1.9;
            margin-bottom:30px;
        }

        .hero-btn{
            background:linear-gradient(
                    90deg,
                    #0f172a 0%,
                    #2563eb 50%,
                    #7c3aed 100%
            );
            color:#fff;
            color:white;
            border:none;
            padding:16px 34px;
            border-radius:50px;
            font-size:17px;
            cursor:pointer;
            font-weight:600;
        }

        .hero-right{
            width:50%;
            display:flex;
            justify-content:center;
            align-items:center;
        }
        .hero-right img{
            width:420px;
            max-width:100%;
        }
        .navbar{
            max-width:1400px;
            margin:auto;
        }
        .hero{
            gap:60px;
        }
        .services{
            padding:90px 70px;
        }

        .section-title{
            text-align:center;
            font-size:42px;
            margin-bottom:60px;
            font-weight:700;
        }

        .service-grid{
            display:grid;
            grid-template-columns:repeat(3,1fr);
            gap:25px;
        }

        .card{
            background:white;
            padding:35px;
            border-radius:18px;
            box-shadow:0 10px 35px rgba(0,0,0,.08);
            transition:.3s;
        }

        .card:hover{
            transform:translateY(-8px);
        }

        .card i{
            font-size:45px;
            color:#2563eb;
            margin-bottom:15px;
        }

        .card h3{
            margin-bottom:10px;
        }

        .card p{
            color:#64748b;
            line-height:1.8;
        }

        .stats{
            background:linear-gradient(
                    90deg,
                    #0f172a 0%,
                    #2563eb 50%,
                    #7c3aed 100%
            );
            color:white;
            padding:80px;
            display:grid;
            grid-template-columns:repeat(4,1fr);
            text-align:center;
        }

        .stats h2{
            font-size:58px;
        }

        .stats p{
            margin-top:10px;
        }

        .contact{
            padding:100px 60px;
            text-align:center;
        }

        .contact h2{
            font-size:42px;
            margin-bottom:15px;
        }

        .contact p{
            color:#64748b;
            font-size:18px;
        }

        .footer{
            background:linear-gradient(
                    90deg,
                    #0f172a 0%,
                    #2563eb 50%,
                    #7c3aed 100%
            );
            color:white;
            text-align:center;
            padding:25px;
        }

        .modal{
            display:none;
            position:fixed;
            top:0;
            left:0;
            width:100%;
            height:100%;
            background:rgba(0,0,0,.75);
            z-index:99999;
        }

        .modal-content{
            background:white;
            width:500px;
            max-width:95%;
            padding:35px;
            border-radius:18px;
            margin:60px auto;
            position:relative;
        }

        .close{
            position:absolute;
            right:18px;
            top:12px;
            font-size:28px;
            cursor:pointer;
        }
        .login-title{
            font-size:30px;
            margin-bottom:8px;
            color:#2563eb;
            font-weight:700;
        }

        .login-sub{
            color:#64748b;
            margin-bottom:25px;
        }

        .form-group{
            margin-bottom:18px;
        }

        .form-group label{
            display:block;
            margin-bottom:8px;
            font-weight:500;
        }

        .form-group input{
            width:100%;
            padding:14px;
            border:1px solid #dbe2ea;
            border-radius:10px;
            outline:none;
        }

        .login-btn{
            width:100%;
            border:none;
            background:linear-gradient(
                    90deg,
                    #0f172a 0%,
                    #2563eb 50%,
                    #7c3aed 100%
            );
            color:white;
            padding:15px;
            border-radius:10px;
            cursor:pointer;
            font-size:16px;
            font-weight:600;
        }
        .nav-links a:hover{
            color:#2563eb;
        }
        @media(max-width:900px){

            .navbar{
                padding:20px;
            }

            .hero{
                flex-direction:column;
                padding:40px;
            }

            .hero-left,
            .hero-right{
                width:100%;
            }

            .hero-left h1{
                font-size:42px;
            }

            .service-grid{
                grid-template-columns:1fr;
            }

            .stats{
                grid-template-columns:1fr 1fr;
                gap:25px;
            }

            .nav-links a{
                display:none;
            }
        }

    </style>

</head>

<body>

<nav class="navbar">
    <div class="logo">

        <img src="<%=path%>/Organization/Logo.png"
             onerror="this.style.display='none';">

        <h2>Courier Management System</h2>

    </div>

    <div class="nav-links">

        <a href="#">Home</a>
        <a href="#">Services</a>
        <a href="#">Tracking</a>
        <a href="#">About</a>
        <a href="#">Contact</a>

        <button id="openLogin"
                class="login-top-btn">
            Login
        </button>

    </div>
</nav>

<section class="hero">
    <div class="hero-left">

        <h1>
            Fast Secure Reliable
            Courier Service
        </h1>

        <p>
            Manage booking, parcel tracking,
            delivery operations, customer records,
            billing and reports from one powerful system.
        </p>

        <button id="openLogin2"
                class="hero-btn">
            Get Started
        </button>

    </div>

    <div class="hero-right">

        <img src="<%=path%>/Organization/Logo.png">

    </div>

</section>

<section class="services">
    <h2 class="section-title">
        Our Services
    </h2>

    <div class="service-grid">

        <div class="card">
            <i class="fa fa-truck"></i>
            <h3>Courier Delivery</h3>
            <p>
                Fast nationwide delivery service with
                secure package handling.
            </p>
        </div>

        <div class="card">
            <i class="fa fa-globe"></i>
            <h3>International Cargo</h3>
            <p>
                Global shipping and cargo solutions
                with reliable tracking.
            </p>
        </div>

        <div class="card">
            <i class="fa fa-cubes"></i>
            <h3>Warehousing</h3>
            <p>
                Smart inventory and warehouse
                management solutions.
            </p>
        </div>

    </div>

</section>

<section class="stats">

    <div>
        <h2>77</h2>
        <p>District Coverage</p>
    </div>

    <div>
        <h2>500+</h2>
        <p>Branches</p>
    </div>

    <div>
        <h2>10M+</h2>
        <p>Deliveries</p>
    </div>

    <div>
        <h2>24/7</h2>
        <p>Support</p>
    </div>

</section>

<section class="contact">

    <h2>Ready To Grow With Us?</h2>

    <p>
        Start managing your courier operations
        with a modern logistics platform.
    </p>

</section>

<footer class="footer">
    © 2026 Courier Management System | Powered by Hint Plus
</footer>

<div id="loginModal" class="modal">


    <div class="modal-content">

        <span class="close">&times;</span>

        <h2 class="login-title">
            Sign In
        </h2>

        <p class="login-sub">
            Enter your account credentials.
        </p>

        <form id="dataFrom">

            <div class="form-group">
                <label>Username</label>
                <input
                        id="username"
                        value="ADMIN"
                        placeholder="Username">
            </div>

            <div class="form-group">
                <label>Password</label>
                <input
                        id="password"
                        type="password"
                        value="IC@ADMIN12"
                        placeholder="Password">
            </div>

            <button id="login-btn"
                    class="login-btn"
                    type="submit">
                Sign In
            </button>

        </form>

    </div>


</div>

<script>

    $("#openLogin,#openLogin2").click(function(){
        $("#loginModal").fadeIn();
    });

    $(".close").click(function(){
        $("#loginModal").fadeOut();
    });

    $(window).click(function(e){
        if($(e.target).hasClass("modal")){
            $("#loginModal").fadeOut();
        }
    });

    $("#dataFrom").submit(function(event){

        event.preventDefault();

        const username=$("#username").val();
        const password=$("#password").val();

        if(username.length<3 || password.length<3){

            $.toast({
                heading:"Error",
                text:"Please provide username and password",
                icon:"error",
                position:"mid-center"
            });

            return false;
        }

        $("#login-btn").html(
            "LOGGING IN <i class='fa fa-spinner fa-spin'></i>"
        );

        $("#login-btn").attr("disabled","");

        $.ajax({

            type:"POST",

            url:"public/api/login",

            data:JSON.stringify({
                username:username,
                password:password
            }),

            contentType:"application/json; charset=utf-8",

            dataType:"json",

            success:function(data){

                window.location.assign(
                    "web/setup?token="+data.token
                );

            },

            error:function(XMLHttpRequest){

                $("#login-btn").html("Sign In");
                $("#login-btn").removeAttr("disabled");

                $.toast({
                    heading:"Error",
                    text:"Login Failed",
                    icon:"error",
                    position:"mid-center"
                });

            }

        });

    });

</script>

</body>
</html>
