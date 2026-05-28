<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%
        String path = request.getContextPath();

    %>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Education Management System</title>

    <!-- Favicon -->
<%--    <link rel="shortcut icon" type="image/x-icon" href="<%= doc %>Document/Organization/Logo.png"/>--%>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet"
          crossorigin="anonymous"/>

    <!-- jQuery & Toast -->
    <script src="<%=path%>/bootstrap/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <link href="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.js" type="text/javascript"></script>
    <link href="<%=path%>/bootstrap/css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="page-wrap">
    <!-- Student / Teacher toggle -->
    <div class="login-switch">
        <b id="organization-code" class="switch-pill active"></b> &nbsp;&nbsp;
        <a id="link-a" class="switch-pill">Teacher</a>&nbsp;&nbsp;
        <a id="link-b" class="switch-pill active">&nbsp;&nbsp;Student&nbsp;&nbsp;&nbsp;&nbsp;</a>
    </div>

    <!-- LOGIN CARD (center) -->
    <div class="login-card">
        <div class="login-inner">

            <!-- gradient bar -->
            <div class="login-bar">
                <div class="login-bar-title">SIGN IN</div>
                <div class="login-bar-bottom">
                    <i class="fa fa-graduation-cap"></i>
                    <span>Education<br/>Management<br/>System</span>
                </div>
            </div>

            <!-- main body -->
            <div class="login-body">
                <div class="brand-row">
                    <div class="brand-title">
                        <h1 id="organization-name"></h1>
                        <p class="tagline">Powered by EduLink</p>
                    </div>
                    <!-- लोगो right side मा -->
                    <img src="<%=path%>/Organization/Logo.png"
                         class="org-logo"
                         alt="Logo"
                         onerror="this.style.display='none';"/>
                </div>

                <h2 class="welcome-title">Log In</h2>
                <p class="welcome-sub">Enter your credentials to continue.</p>

                <form id="dataFrom">
                    <div class="input-group">
                        <span class="input-label">Username</span>
                        <div class="input-wrapper">
                            <span class="icon-left"><i class="fa fa-user"></i></span>
                            <input name="username" id="username" type="text"
                                   placeholder="Username here"/>
                        </div>
                    </div>

                    <div class="input-group">
                        <span class="input-label">Password</span>
                        <div class="input-wrapper">
                            <span class="icon-left"><i class="fa fa-lock"></i></span>
                            <input name="password" id="password" type="password"
                                   placeholder="Enter password here"/>
                            <span class="icon-right" id="toggle-password">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </span>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                    <div id="message" style="color: darkgreen"></div>
                    <div style="clear: both"></div>
                    <div style="width: 100%">
                        <button id="login-btn" class="login-btn" type="submit">Sign In</button>
                    </div>

                </form>
            </div> <!-- /.login-body -->

        </div> <!-- /.login-inner -->
    </div> <!-- /.login-card -->
</div>


<script>
    const path = localStorage.getItem("context-path");
    if (path === null || path.length === 0) {
        window.location.assign("<%= request.getContextPath() %>/");
    }
    const code = (path.replaceAll("/edulink/", ""));
    const documentPath = localStorage.getItem("document-path");
    const targetURL = "<%=path%>/Login?path=" + code + "&doc=" + documentPath.substring(1, documentPath.length);
    document.getElementById("link-a").setAttribute("href", targetURL + "&target=T");
    document.getElementById("link-b").setAttribute("href", targetURL + "&target=S")
    document.getElementById("organization-name").innerHTML = code;
    document.getElementById("organization-code").innerHTML = "Organization";
    // show / hide password
    $("#toggle-password").on("click", function () {
        const pwdInput = document.getElementById("password");
        const icon = this.querySelector("i");
        if (pwdInput.type === "password") {
            pwdInput.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            pwdInput.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    });

    $("#dataFrom").submit(function (event) {
        event.preventDefault();
        const password = document.getElementById("password").value;
        const username = document.getElementById("username").value;

        if (username.length < 3 || password.length < 3) {
            message("Please provide user name and password!!");
            return false;
        }

        document.getElementById("login-btn").innerHTML =
            "<div class='logging-btn'>LOGGING IN&nbsp;&nbsp;<i class='fa fa-spinner fa-spin' style='font-size:16px'></i></div>";
        document.getElementById("login-btn").setAttribute("disabled", "");

        $.ajax({
            type: "GET",
            url: path + "/public/api/hibernate-util",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                const requestData = {"username": username, "password": password};
                $.ajax({
                    type: "POST",
                    url: path + "/public/api/login",
                    data: JSON.stringify(requestData),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        window.location.assign(
                            "<%=path%>/organization-login?path=" + path +
                            "&token=" + data.token +
                            "&bsdate=" + data.badate +
                            "&fyStart=" + data.fyStart
                        );
                    },
                    error: function (XMLHttpRequest) {
                        console.log(XMLHttpRequest);
                        message(XMLHttpRequest.responseJSON.message);
                    }
                });
            },
            error: function (XMLHttpRequest) {
                message(XMLHttpRequest.responseText);
            }
        });
    });

    function message(msg) {
        $.toast({
            heading: "Error",
            text: msg,
            icon: 'error',
            loader: true,
            loaderBg: '#FF0000',
            position: 'mid-center'
        });
        loginButtonEnable();
    }

    function loginButtonEnable() {
        document.getElementById("login-btn").innerHTML = "Sign In";
        document.getElementById("login-btn").removeAttribute("disabled");
    }

    function errorStatus(XMLHttpRequest) {
        alert(XMLHttpRequest.responseJSON.message);
    }

</script>
</body>
</html>