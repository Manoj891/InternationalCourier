<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>EduLink</title>
    <%
        String path = request.getContextPath();
    %>
    <script>
        const path = "<%=path%>";
        const token = "Bearer "+localStorage.getItem("IC-TOKEN");
    </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="index, follow"/>

    <%--    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>Document/Organization/Logo.png">--%>

    <!-- Bootstrap + Toast -->
    <link href="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <!-- Font Awesome 4 (पुरानो icon हरुका लागि) -->
    <link href="<%=path%>/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <!-- App CSS -->
    <link href="<%=path%>/bootstrap/style.css" rel="stylesheet" type="text/css"/>

    <!-- jQuery / Bootstrap JS / Toast / Datatable / Custom -->
    <script src="<%=path%>/bootstrap/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/datatables.js" type="text/javascript"></script>
    <link href="<%=path%>/bootstrap/datatables.css" rel="stylesheet" type="text/css"/>


    <!-- Data table print and export -->
    <script src="<%=path%>/bootstrap/datatable/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/datatable/buttons.print.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/datatable/buttons.html5.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/datatable/jszip.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<%=path%>/bootstrap/datatable/buttons.dataTables.min.css">
</head>

<body class="hp-with-sidebar">
<script>

    const userType = localStorage.getItem("userType");
    const username = localStorage.getItem("username");
   document.addEventListener('DOMContentLoaded', function () {
       const body = document.body;
       const sidebar = document.querySelector('.hp-sidebar');
       const toggle = document.querySelector('.hp-sidebar-toggle');
       function isMobile() {
            return window.innerWidth <= 991;   // mobile / tab
        }

        /* ===== HAMBURGER TOGGLE ===== */
        if (toggle) {
            toggle.addEventListener('click', function (e) {
                e.stopPropagation();
                body.classList.toggle('hp-sidebar-collapsed');
            });
        }

        /* Mobile मा default = closed */
        if (isMobile()) {
            body.classList.add('hp-sidebar-collapsed');
        }

        /* ===== SUB-MENU LINK CLICK => AUTO CLOSE (ONLY) ===== */
       const submenuLinks = document.querySelectorAll('.hp-sidebar .hp-submenu a');
       submenuLinks.forEach(function (link) {
            link.addEventListener('click', function () {
                if (isMobile()) {
                    body.classList.add('hp-sidebar-collapsed');
                }
            });
        });

        /* ===== SIDEBAR बाहिर क्लिक गरे पनि बन्द (mobile) ===== */
        document.addEventListener('click', function (e) {
            if (!isMobile()) return;
            if (!sidebar) return;

            const clickInsideSidebar = sidebar.contains(e.target);
            const clickOnToggle = toggle && toggle.contains(e.target);

            if (!clickInsideSidebar && !clickOnToggle) {
                body.classList.add('hp-sidebar-collapsed');
            }
        });
    });


    // sidebar UI behaviours
    $(function () {
        // mobile sidebar toggle
        $("#hp-sidebar-toggle").on("click", function () {
            $("#hp-sidebar").toggleClass("hp-open");
        });

        // Accordion: एउटै बेलामा एउटा group मात्र open
        $("#hp-sidebar-accordion .collapse").on("show.bs.collapse", function () {
            $("#hp-sidebar-accordion .collapse.in").not(this).collapse("hide");
        });

        // title active class
        $("#hp-sidebar-accordion .collapse")
            .on("shown.bs.collapse", function () {
                $(this).prev(".hp-menu-title").addClass("active");
            })
            .on("hidden.bs.collapse", function () {
                $(this).prev(".hp-menu-title").removeClass("active");
            });
    });
</script>

<!-- LEFT SIDEBAR -->
<aside id="hp-sidebar" class="hp-sidebar">
    <div class="hp-sidebar-brand">
        <div class="hp-logo-circle">
            <i class="fa fa-university"></i>
        </div>
        <a href="<%=path%>/home">
            <span>EduLink</span>
        </a>
    </div>
    <div class="hp-sidebar-welcome">
        Welcome, <b id="header-username"></b>
    </div>

    <div id="hp-sidebar-accordion" class="hp-sidebar-accordion">
        <!-- Setup -->
        <div class="hp-menu-group">
            <a href="#menu-setup" class="hp-menu-title" data-toggle="collapse"
               data-parent="#hp-sidebar-accordion">
                <span><i class="fa fa-cog"></i> Setup</span>
                <i class="fa fa-chevron-down hp-arrow"></i>
            </a>
            <ul id="menu-setup" class="hp-submenu collapse">
                <li><a href="<%=path%>/web/setup/branch"><i class="fas fa-warehouse"></i> Branch</a></li>
                <li><a href="<%=path%>/web/setup/application-user"><i class="fas fa-warehouse"></i> User</a></li>
            </ul>
        </div>


    </div>
</aside>

<!-- TOP BAR -->
<header class="hp-topbar">
    <!-- LEFT: sidebar toggle + title -->
    <div class="hp-topbar-left">
        <button type="button" class="hp-sidebar-toggle">
            <i class="fa fa-bars"></i>
        </button>

    </div>

    <!-- RIGHT: user dropdown -->
    <div class="hp-topbar-right">
        <div class="dropdown hp-user-menu">
            <button class="hp-user-btn dropdown-toggle" type="button"
                    id="hpUserMenuBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-user-circle"></i>
                <span id="hp-user-name-top"></span>
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="hpUserMenuBtn">
                <li class="disabled">
                    <a href="javascript:void(0);">Welcome, <b id="hp-user-name-top-dd"></b></a>
                </li>
                <li role="separator" class="divider"></li>
                <li>
                    <a href="<%= path%>/Utility/ChangePassword">
                        <i class="fa fa-key"></i> Change Password
                    </a>
                </li>
                <li>
                    <a href="<%= path%>/Utility/support">
                        <i class="fa fa-life-ring"></i> Support
                    </a>
                </li>
                <li role="separator" class="divider"></li>
                <li>
                    <a href="<%= path%>/web/logout" style="color:red;">
                        <i class="fa fa-sign-out"></i> Log Out
                    </a>
                </li>
            </ul>
        </div>
    </div>
</header>

<script>
    // username label set
    (function () {
        var uname = username || "";
        var el1 = document.getElementById("header-username");
        if (el1) el1.innerHTML = uname;

        var el2 = document.getElementById("hp-user-name-top");
        if (el2) el2.innerHTML = uname;

        var el3 = document.getElementById("hp-user-name-top-dd");
        if (el3) el3.innerHTML = uname;
    })();
</script>

<div class="container hp-main" id="container" style="overflow:scroll;">

