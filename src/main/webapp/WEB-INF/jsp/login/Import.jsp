<%-- 
    Document   : ImportJetking
    Created on : Mar 1, 2020, 3:03:29 PM
    Author     : MS
--%>
<%@page import="java.util.Date" %>
<%@page import="java.io.File" %>
<%
    String path = request.getContextPath();

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome User</title>
    <link href="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/bootstrap/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/bootstrap/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/appheader.js" type="text/javascript"></script>
    <link href="<%=path%>/bootstrap/style.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/bootstrap/datatables.js" type="text/javascript"></script>
    <link href="<%=path%>/bootstrap/datatables.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/bootstrap/js/jswithcss.js" type="text/javascript"></script>
    <style>
        .btn-success {
            height: 26px;
        }

        .form-control {
            height: 29px;
        }

        fieldset {
            border: 1px solid #f89800 !important;
            display: table-cell !important;
            padding: 0 15px 25px !important;
            border-top: 1px solid #f89800 !important;
        }

        legend {
            padding: 0 15px;
            border: none;
            width: auto;
            font-weight: bold;
            margin: 0;
            font-family: Arial;
            color: #000;
            font-size: 16px;
        }
    </style>
</head>

<body>
<div class="container">
    <fieldset>
        <legend>Configure Database</legend>
        <form method='POST'>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>User Name</label>
                <input type='text' name='dbUser' id='dbUser' value="" class="form-control" required>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Password</label>
                <input type='password' name='dbPassword' id='dbPassword' class="form-control" value="" required>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>&nbsp;</label><br>
                <input type='button' onclick="configureDatabase()" value='Configure' class='btn btn-primary'/>
            </div>
        </form>
    </fieldset>

    <br>
    <fieldset>
        <legend>Configure District</legend>
        <input type='button' value='Config' onclick="districtConfigFunction()" class='btn btn-primary'/>
    </fieldset>
    <br>
    <fieldset>
        <legend>Configure Calender</legend>
        <input type='button' value='Config' onclick="calenderConfigFunction()" class='btn btn-primary'/>
    </fieldset>
    <br><br>
    <div class='col-lg-12 col-sm-12 col-md-12 col-xs-12' id="output">

    </div>
    <br><br><br> <br><br><br>

</div>
<script>

    let URL = "";
    let configureStatus = true;
    const path = localStorage.getItem("context-path");


    function configureDatabase() {
        const username = document.getElementById('dbUser').value;
        const password = document.getElementById('dbPassword').value;
        $('.btn').button('loading');

        $.ajax({
            type: "POST",
            url: path + "/public/api/configure/database?dbPassword=" + password + "&dbUser=" + username
            , contentType: false, dataType: "json", catch: false, processData: false,
            success: function (data) {
                $('.btn').button('reset');
                if (data['error']) {
                    alert(data['error'].message);
                } else {
                    alert(data.message);
                }
            },
            error: function (XMLHttpRequest) {
                $('.btn').button('reset');
                alert(XMLHttpRequest + " Status: " + textStatus + " Error: " + errorThrown);
            }
        });
    }


    function calenderConfigFunction() {
        $('.btn').button('loading');
        URL = path + "/public/api/configure/calender";
        demo();

        $.ajax({
            type: "POST", url: URL, contentType: false, dataType: "json", catch: false, processData: false,
            success: function (data) {
                configureStatus = false;
                $('.btn').button('reset');
                if (data['error']) {
                    alert(data['error'].message);
                    return false;
                } else {
                    document.getElementById('output').innerHTML = data.message;
                    alert(data.message);
                    return false;
                }
            },
            error: function (XMLHttpRequest) {
                $('.btn').button('reset');
                configureStatus = false;
                return false;
                alert(XMLHttpRequest + " Status: " + textStatus + " Error: " + errorThrown);
            }
        });
    }

    function districtConfigFunction() {
        $('.btn').button('loading');
        URL = path + "/public/api/configure/district-municipal";
        $.ajax({
            type: "POST", url: URL, contentType: false, dataType: "json", catch: false, processData: false,
            success: function (data) {
                configureStatus = false;
                $('.btn').button('reset');
                if (data['error']) {
                    alert(data['error'].message);
                    return false;
                } else {
                    document.getElementById('output').innerHTML = data.message;
                    alert(data.message);
                    return false;
                }
            },
            error: function (XMLHttpRequest) {
                $('.btn').button('reset');
                configureStatus = false;
                return false;
                alert(XMLHttpRequest + " Status: " + textStatus + " Error: " + errorThrown);
            }
        });
    }


</script>
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <p>&nbsp;</p>
                <p>Copy Right &copy; 2024-2028 </p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>

