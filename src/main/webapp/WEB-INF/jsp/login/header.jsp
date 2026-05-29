<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>EduLink</title>
    <%
        String path = request.getContextPath();
   
    %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="index, follow"/>

    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>Document/Organization/Logo.png">

    <!-- Bootstrap + Toast -->
    <link href="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <!-- Font Awesome 4 (पुरानो icon हरुका लागि) -->
    <link href="<%=path%>/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <!-- Font Awesome 5 (fas, fab, far, fa-file-invoice-dollar जस्ता icon हरुका लागि) -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-dNmKUuVY0NqH8N3as1qLkGouVp21Hb+Jseb3CidRubc4QZAlWTMwVzbtIgbz9hVYBk2Jy5o+1OtS9O35VYfKkg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- App CSS -->
    <link href="<%=path%>/bootstrap/style.css" rel="stylesheet" type="text/css"/>

    <!-- jQuery / Bootstrap JS / Toast / Datatable / Custom -->
    <script src="<%=path%>/bootstrap/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/appheader.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/datatables.js" type="text/javascript"></script>
    <link href="<%=path%>/bootstrap/datatables.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/bootstrap/js/jswithcss.js" type="text/javascript"></script>

    <!-- Data table print and export -->
    <script src="<%=path%>/bootstrap/datatable/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/datatable/buttons.print.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/datatable/buttons.html5.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/datatable/jszip.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<%=path%>/bootstrap/datatable/buttons.dataTables.min.css">
</head>

<body class="hp-with-sidebar">
<script>
    const path = localStorage.getItem("context-path");
    const token = localStorage.getItem("token");
    const userType = localStorage.getItem("userType");
    const username = localStorage.getItem("username");

    if (userType !== "ADM") {
        const uri = (window.location.pathname).replace("/ms-ware", "");
        if (!(uri === "/home")) {
            if (!localStorage.getItem("menuUserAccess").includes(uri)) {
                alert("You don't have access this feature!!");
                window.location.assign("<%=path%>/home");
            }
        }
    }

    function searchModelBox() {
        $("#searchModelBox").modal();
    }


        document.addEventListener('DOMContentLoaded', function () {
        var body    = document.body;
        var sidebar = document.querySelector('.hp-sidebar');
        var toggle  = document.querySelector('.hp-sidebar-toggle');

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
        var submenuLinks = document.querySelectorAll('.hp-sidebar .hp-submenu a');

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

        var clickInsideSidebar = sidebar.contains(e.target);
        var clickOnToggle      = toggle && toggle.contains(e.target);

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
              </ul>
        </div>

        <!-- Billing -->
        <div class="hp-menu-group">
            <a href="#menu-billing" class="hp-menu-title" data-toggle="collapse"
               data-parent="#hp-sidebar-accordion">
                <span><i class="fas fa-coins"></i> Billing</span>
                <i class="fa fa-chevron-down hp-arrow"></i>
            </a>
            <ul id="menu-billing" class="hp-submenu collapse">
             </ul>
        </div>

        <!-- Student -->
        <div class="hp-menu-group">
            <a href="#menu-student" class="hp-menu-title" data-toggle="collapse"
               data-parent="#hp-sidebar-accordion">
                <span><i class="fa fa-users"></i> Student</span>
                <i class="fa fa-chevron-down hp-arrow"></i>
            </a>
            <ul id="menu-student" class="hp-submenu collapse">
            </ul>
        </div>

        <!-- Inventory -->
        <div class="hp-menu-group">
            <a href="#menu-inventory" class="hp-menu-title" data-toggle="collapse"
               data-parent="#hp-sidebar-accordion">
                <span><i class="fa fa-cubes"></i> Inventory</span>
                <i class="fa fa-chevron-down hp-arrow"></i>
            </a>
            <ul id="menu-inventory" class="hp-submenu collapse">
               </ul>
        </div>

        <!-- A/C -->
        <div class="hp-menu-group">
            <a href="#menu-account" class="hp-menu-title" data-toggle="collapse"
               data-parent="#hp-sidebar-accordion">
                <span><i class="fa fa-suitcase"></i> A/C</span>
                <i class="fa fa-chevron-down hp-arrow"></i>
            </a>
            <ul id="menu-account" class="hp-submenu collapse">
                <li><a href="<%=path%>/Account/ChartOfAccount"><i class="fas fa-warehouse"></i> Chart of Account</a></li>
                <li><a href="<%=path%>/Account/JournalVoucher"><i class="fas fa-money-bill"></i> Journal Voucher</a></li>
                <li><a href="<%=path%>/Account/ReceiveVoucher"><i class="fas fa-receipt"></i> Receive Voucher</a></li>
                </ul>
        </div>

        <!-- Exam -->
        <div class="hp-menu-group">
            <a href="#menu-exam" class="hp-menu-title" data-toggle="collapse"
               data-parent="#hp-sidebar-accordion">
                <span><i class="fas fa-diagnoses"></i> Exam</span>
                <i class="fa fa-chevron-down hp-arrow"></i>
            </a>
            <ul id="menu-exam" class="hp-submenu collapse">
                <li><a href="<%=path%>/Exam/GradingSystem"><i class="fas fa-ruler-vertical"></i> Grading System</a></li>
                <li><a href="<%=path%>/Exam/PercentageSystem"><i class="fas fa-percentage"></i> Percentage System</a></li>
                <li><a href="<%=path%>/Exam/ExamTerminal"><i class="fas fa-diagnoses"></i> Exam Terminal</a></li>
                <li><a href="<%=path%>/Exam/AddNewExam"><i class="fas fa-brain"></i> Exam Master</a></li>
                <li><a href="<%=path%>/Exam/ExamSchedule"><i class="fas fa-brain"></i> Exam Schedule</a></li>
                <li><a href="<%=path%>/Exam/ExamStudentRegistration"><i class="fas fa-user-tag"></i> Student Registration</a></li>
                <li><a href="<%=path%>/Exam/ExamStudentRegistrationPending"><i class="far fa-calendar-check"></i> Approve Registration</a></li>
                <li><a href="<%=path%>/Exam/EntranceCard"><i class="far fa-calendar-check"></i> Entrance Card</a></li>
                <li><a href="<%=path%>/Exam/MarkEntry"><i class="fas fa-keyboard"></i> Mark Entry</a></li>
                <li><a href="<%=path%>/Exam/MarkApprove"><i class="fas fa-check-square"></i> Approve Mark</a></li>
                <li><a href="<%=path%>/Exam/MarkReport"><i class="far fa-chart-bar"></i> Mark Report</a></li>
                <li><a href="<%=path%>/Exam/GpaWiseReport"><i class="far fa-chart-bar"></i> GPA Wise Report</a></li>
                <li><a href="<%=path%>/Exam/SubjectWiseReport"><i class="far fa-chart-bar"></i> Subject Wise Report</a></li>
                <li><a href="<%=path%>/Exam/StudentAttendance"><i class="far fa-calendar-alt"></i> Student Attendance</a></li>
                <li><a href="<%=path%>/Exam/ExamResultPublish"><i class="fas fa-check-square"></i> Publish Result</a></li>
                <li><a href="<%=path%>/Exam/GradeStatement"><i class="fas fa-thermometer"></i> Grade Statement</a></li>
                <li><a href="<%=path%>/Exam/FinalGradeStatement"><i class="fas fa-thermometer"></i> Final Grade Statement</a></li>
                <li><a href="<%=path%>/Exam/CharacterCertificate"><i class="fas fa-paste"></i> Character Certificate</a></li>
                <li><a href="<%=path%>/Exam/MarkUpdate"><i class="fas fa-paste"></i> Mark Update</a></li>
            </ul>
        </div>

        <!-- Library -->
        <div class="hp-menu-group">
            <a href="#menu-lib" class="hp-menu-title" data-toggle="collapse"
               data-parent="#hp-sidebar-accordion">
                <span><i class="fas fa-university"></i> Library</span>
                <i class="fa fa-chevron-down hp-arrow"></i>
            </a>
            <ul id="menu-lib" class="hp-submenu collapse">
                <li><a href="<%=path%>/Library/BookType"><i class="fas fa-swatchbook"></i> Book Type</a></li>
                <li><a href="<%=path%>/Library/BookStock"><i class="fab fa-book-dead"></i> Book Entry</a></li>
                <li><a href="<%=path%>/Library/BookCurrentStock"><i class="fab fa-book"></i> Book Current Stock</a></li>
                <li><a href="<%=path%>/Library/BookSearch"><i class="fas fa-book-open"></i> Book Search</a></li>
                <li><a href="<%=path%>/Library/BookReport"><i class="fas fa-book-open"></i> Book Report</a></li>
                <li><a href="<%=path%>/Library/BookIssue"><i class="fas fa-book-reader"></i> Issue Book</a></li>
                <li><a href="<%=path%>/Library/BookReturn"><i class="fas fa-person-booth"></i> Return Book</a></li>
                <li><a href="<%=path%>/Library/BookIssueReport"><i class="fas fa-box-tissue"></i> Issue Report</a></li>
            </ul>
        </div>

        <!-- Employee -->
        <div class="hp-menu-group">
            <a href="#menu-emp" class="hp-menu-title" data-toggle="collapse"
               data-parent="#hp-sidebar-accordion">
                <span><i class="fas fa-restroom"></i> Employee</span>
                <i class="fa fa-chevron-down hp-arrow"></i>
            </a>
            <ul id="menu-emp" class="hp-submenu collapse">
                <li><a href="<%=path%>/Employee/DepartmentMaster"><i class="fas fa-sitemap"></i> Department Master</a></li>
                <li><a href="<%=path%>/Employee/LevelMaster"><i class="fas fa-layer-group"></i> Level Master</a></li>
                <li><a href="<%=path%>/Employee/EmployeeInfo"><i class="fas fa-user-friends"></i> Employee Info</a></li>
                <li><a href="<%=path%>/Employee/IDCard"><i class="far fa-address-card"></i> Employee ID Card</a></li>
                <li><a href="<%=path%>/Employee/OnlineVacancy"><i class="fas fa-blog"></i> Online Vacancy</a></li>
                <li><a href="<%=path%>/Employee/TeachersClassSubject"><i class="fab fa-audible"></i> Subject Class Teacher</a></li>
                <li><a href="<%=path%>/Employee/BiometricDeviceMap"><i class="far fa-check-square"></i> Biometric Device Map</a></li>
                <li><a href="<%=path%>/Employee/EmpWorkingHour"><i class="fas fa-briefcase"></i> Working Hour</a></li>
                <li><a href="<%=path%>/Employee/WdmsAttendance"><i class="fas fa-hdd"></i> Date Wise Attendance</a></li>
                <li><a href="<%=path%>/Employee/AttendanceReport"><i class="fas fa-hdd"></i> Monthly Attendance</a></li>
                <li><a href="<%=path%>/Employee/EmployeeSalaryInfo"><i class="fas fa-comments-dollar"></i> Salary Info</a></li>
                <li><a href="<%=path%>/Employee/TaxSlab"><i class="fas fa-stream"></i> Tax Slab</a></li>
                <li><a href="<%=path%>/Employee/RegularAllowance"><i class="fab fa-asymmetrik"></i> Employee Allowance</a></li>
                <li><a href="<%=path%>/Employee/LeaveApplication"><i class="fas fa-highlighter"></i> Leave Application</a></li>
                <li><a href="<%=path%>/Employee/LeaveReport"><i class="fas fa-paper-plane"></i> Leave Report</a></li>
                <li><a href="<%=path%>/Employee/MonthlySalary"><i class="fas fa-money-check"></i> Monthly Salary</a></li>
                <li><a href="<%=path%>/Employee/SalaryReport"><i class="fas fa-funnel-dollar"></i> Salary Report</a></li>
            </ul>
        </div>

        <!-- Utility -->
        <div class="hp-menu-group">
            <a href="#menu-utility" class="hp-menu-title" data-toggle="collapse"
               data-parent="#hp-sidebar-accordion">
                <span><i class="fa fa-wrench"></i> Utility</span>
                <i class="fa fa-chevron-down hp-arrow"></i>
            </a>
            <ul id="menu-utility" class="hp-submenu collapse">
                <li><a href="<%=path%>/Utility/OrganizationMaster"><i class="fa fa-building"></i> Organization Master</a></li>
                <li><a href="<%=path%>/Utility/OrganizationUserInfo"><i class="fa fa-user-plus"></i> Application User</a></li>
                <li><a href="<%=path%>/Utility/OrganizationTeam"><i class="fas fa-user-tie"></i> Organization Team</a></li>
                <li><a href="<%=path%>/Employee/ShareHolder"><i class="fas fa-user-tie"></i> Share Holder</a></li>
                <li><a href="<%=path%>/Utility/AdBsCalender"><i class="fa fa-calendar"></i> Calendar</a></li>
                <li><a href="<%=path%>/Utility/NoticeBoard"><i class="fas fa-chalkboard-teacher"></i> Assign New Notice</a></li>
                <li><a href="<%=path%>/Employee/RoutingReport"><i class="fas fa-calendar-week"></i> Assign Routine</a></li>
                <li><a href="<%=path%>/Utility/ClassWiseSMS"><i class="fas fa-mobile-alt"></i> Send SMS to Student</a></li>
                <li><a href="<%=path%>/Utility/OtherSMS"><i class="fas fa-comments"></i> Send Custom SMS</a></li>
                <li><a href="<%=path%>/Utility/SmsReport"><i class="fas fa-comments"></i> SMS Report</a></li>
                <li><a href="<%=path%>/Utility/MenuControl"><i class="fas fa-gamepad"></i> Menu Control</a></li>
                <li><a href="<%=path%>/Utility/AccountTransfer"><i class="fas fa-database"></i> Account Transfer</a></li>
                <li><a href="<%=path%>/Utility/Backup"><i class="fas fa-database"></i> Backup</a></li>
                <li><a href="<%=path%>/Setup/MunicipalMaster"><i class="fas fa-database"></i> Municipal</a></li>
                <li><a href="<%=path%>/Utility/EmailNotificationService"><i class="fas fa-database"></i> Email Notification Service</a></li>
                <li><a href="<%=path%>/Utility/SenderEmail"><i class="fas fa-database"></i> Email Configuration</a></li>
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

        <span class="hp-topbar-title">Dashboard</span>
    </div>

    <!-- CENTER: search -->
    <div class="hp-topbar-center">
        <button class="hp-icon-btn" onclick="searchModelBox()" aria-label="Search">
            <i class="fa fa-search"></i>
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

<div class="container hp-main" id="container" style="padding-bottom: 200px;width: 85%; overflow:scroll;">

